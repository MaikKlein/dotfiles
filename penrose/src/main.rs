/**
 * My personal penrose config (build from the head of develop)
 */
#[macro_use]
extern crate penrose;

use penrose::helpers::spawn;
use penrose::hooks::LayoutHook;
use penrose::layout::{bottom_stack, paper, side_stack};
use penrose::{
    Backward, Config, Forward, Layout, LayoutConf, Less, More, WindowManager, XcbConnection,
};
use simplelog::{LevelFilter, SimpleLogger};
use std::env;
use std::process::Command;

fn main() {
    SimpleLogger::init(LevelFilter::Info, simplelog::Config::default()).unwrap();

    let mut config = Config::default();
    config.workspaces = &["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    config.fonts = &["ProFont For Powerline:size=10", "Iosevka Nerd Font:size=10"];
    config.floating_classes = &["rofi", "dmenu", "dunst", "polybar", "pinentry-gtk-2"];

    let follow_focus_conf = LayoutConf {
        floating: false,
        gapless: true,
        follow_focus: true,
    };
    let n_main = 1;
    let ratio = 0.6;
    config.layouts = vec![
        Layout::new("[side]", LayoutConf::default(), side_stack, n_main, ratio),
        Layout::new("[botm]", LayoutConf::default(), bottom_stack, n_main, ratio),
        Layout::new("[papr]", follow_focus_conf, paper, n_main, ratio),
        Layout::floating("[----]"),
    ];

    let home = env::var("HOME").unwrap();
    let power_script = format!("{}/bin/scripts/power-menu.sh", home);
    let power_menu = Box::new(move |wm: &mut WindowManager| {
        match Command::new(&power_script).output() {
            Ok(choice) => {
                match String::from_utf8(choice.stdout).unwrap().as_str() {
                    "restart-wm\n" => wm.exit(),
                    _ => (), // other options are handled by the script
                }
            }
            Err(_) => return, // user exited without making a choice
        };
    });

    let key_bindings = gen_keybindings! {
        // Program launch
        "M-semicolon" => run_external!("rofi-apps"),
        "M-Return" => run_external!("st"),

        // actions
        "M-A-s" => run_external!("screenshot"),
        "M-A-k" => run_external!("toggle-kb-for-tada"),
        "M-A-l" => run_external!("lock-screen"),
        "M-A-m" => run_external!("xrandr --output HDMI-1 --auto --right-of eDP-1 "),

        // client management
        "M-j" => run_internal!(cycle_client, Forward),
        "M-k" => run_internal!(cycle_client, Backward),
        "M-S-j" => run_internal!(drag_client, Forward),
        "M-S-k" => run_internal!(drag_client, Backward),
        "M-S-q" => run_internal!(kill_client),

        // workspace management
        "M-Tab" => run_internal!(toggle_workspace),
        "M-bracketright" => run_internal!(cycle_screen, Forward),
        "M-bracketleft" => run_internal!(cycle_screen, Backward),
        "M-S-bracketright" => run_internal!(drag_workspace, Forward),
        "M-S-bracketleft" => run_internal!(drag_workspace, Backward),

        // Layout & window management
        "M-grave" => run_internal!(cycle_layout, Forward),
        "M-S-grave" => run_internal!(cycle_layout, Backward),
        "M-A-Up" => run_internal!(update_max_main, More),
        "M-A-Down" => run_internal!(update_max_main, Less),
        "M-A-Right" => run_internal!(update_main_ratio, More),
        "M-A-Left" => run_internal!(update_main_ratio, Less),
        "M-A-C-Escape" => run_internal!(exit),
        "M-A-Escape" => power_menu;

        forall_workspaces: config.workspaces => {
            "M-{}" => focus_workspace,
            "M-S-{}" => client_to_workspace,
        }
    };

    // Set the root X window name to be the active layout symbol so it can be picked up by polybar
    let active_layout_as_root_name: LayoutHook = |wm: &mut WindowManager, _, _| {
        wm.set_root_window_name(wm.current_layout_symbol());
    };
    config.layout_hooks.push(active_layout_as_root_name);

    let conn = XcbConnection::new();
    let mut wm = WindowManager::init(config, &conn);

    spawn(format!("{}/bin/scripts/penrose-startup.sh", home));
    active_layout_as_root_name(&mut wm, 0, 0);
    wm.grab_keys_and_run(key_bindings);
}
