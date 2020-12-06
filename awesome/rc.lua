-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local keys = require("config.keys")
local apps = require("config.apps")
local layouts = require("config.layouts")
local dpi = require('beautiful').xresources.apply_dpi


local primary_monitor = "DP-2"
local secondary_monitor = "HDMI-0"
--local secondary_monitor = "DP-0"

-- Montor setup
awful.spawn("xrandr --output " .. primary_monitor .. " --mode 2560x1440 --rate 144 --primary --preferred --right-of " .. secondary_monitor)

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/theme.lua")

-- This is used later as the default terminal and editor to run.
editor_cmd = apps.terminal .. " -e " .. apps.editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"
awful.layout.layouts = layouts.layouts

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", apps.terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", apps.terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()
mytextclock.font = "Roboto bold 10"

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3,
                        function(t)
                            if client.focus then
                                client.focus:toggle_tag(t)
                            end
                        end
                    )
                )

local tasklist_buttons = gears.table.join(
                     -- awful.button({ }, 1, function (c)
                     --                          if c == client.focus then
                     --                              c.minimized = true
                     --                          else
                     --                              c:emit_signal(
                     --                                  "request::activate",
                     --                                  "tasklist",
                     --                                  {raise = true}
                     --                              )
                     --                          end
                     --                      end),
                     -- awful.button({ }, 3, function()
                     --                          awful.menu.client_list({ theme = { width = 250 } })
                     --                      end),
                     -- awful.button({ }, 4, function ()
                     --                          awful.client.focus.byidx(1)
                     --                      end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = "/home/maik/dotfiles/wallpapers/nms.png"
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)
client.connect_signal("focus", function() 
    if client.focus then
        client.focus:raise()
    end
end)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    -- awful.tag({ "⬤","⬤","⬤","⬤","⬤","⬤","⬤","⬤","⬤" }, s, awful.layout.layouts[1])

    for i=1,9 do 
        awful.tag.add(" ", {
            -- icon               = "⬤",
            layout             = awful.layout.suit.tile,
            -- master_fill_policy = "master_width_factor",
            -- gap_single_client  = true,
            -- gap                = 15,
            screen             = s,
            font = "Roboto bold 10"
        })
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.focused,
        buttons = tasklist_buttons,
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        bg = beautiful.bg_normal .. "70"
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            -- s.mypromptbox,
        },
        -- mylayoutbox,
        mytextclock,
        -- s.mytasklist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
    -- awful.button({ }, 4, awful.tag.viewnext),
    -- awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({"Control", "Shift"},
              "c",
              function (c) c:kill() end,
              {description = "close", group = "client"}),

    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)


local key_bindings = gears.table.join(keys.general, keys.workspace)
root.keys(key_bindings)

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
-- }}}

beautiful.useless_gap = 8
-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hint_honor = false,
                     -- floating = false,
     }
    },

    -- -- Floating clients.
    -- { rule_any = {
    --     instance = {
    --       "DTA",  -- Firefox addon DownThemAll.
    --       "copyq",  -- Includes session name in class.
    --       "pinentry",
    --     },
    --     class = {
    --       "Arandr",
    --       "Blueman-manager",
    --       "Gpick",
    --       "Kruler",
    --       "MessageWin",  -- kalarm.
    --       "Sxiv",
    --       "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
    --       "Wpa_gui",
    --       "veromix",
    --       "xtightvncviewer"},

    --     -- Note that the name property shown in xprop might be set slightly after creation of the client
    --     -- and the name shown there might not match defined rules here.
    --     name = {
    --       "Event Tester",  -- xev.
    --     },
    --     role = {
    --       "AlarmWindow",  -- Thunderbird's calendar.
    --       "ConfigManager",  -- Thunderbird's about:config.
    --       "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
    --     }
    --   }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar.enable_tooltip = false
    awful.titlebar(c, {size = 20, bg = beautiful.bg_normal .. "90", position = "left" }) : setup {
        -- { -- Middle
        --     { -- Title
        --         align  = "center",
        --         widget = awful.titlebar.widget.titlewidget(c)
        --     },
        --     buttons = buttons,
        --     layout  = wibox.layout.flex.horizontal
        -- },
        { -- Right
            awful.titlebar.widget.closebutton(c),
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            layout = wibox.layout.fixed.vertical()
        },
        {
            layout  = wibox.layout.align.vertical,
            buttons = buttons
        },
        { -- Left
            awful.titlebar.widget.stickybutton(c),
            layout  = wibox.layout.fixed.vertical,
            buttons = buttons
        },
        layout = wibox.layout.align.vertical,
        expand = "none"
    }
end)

-- -- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)

-- client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
-- client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
-- Defaults
naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(32)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 5
naughty.config.defaults.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, dpi(6)) end
naughty.config.defaults.title = 'System Notification'

-- -- Apply theme variables
naughty.config.padding = 8
naughty.config.spacing = 8
naughty.config.defaults.margin = dpi(16)
naughty.config.defaults.border_width = 0
naughty.config.defaults.position = 'top_right'

-- Timeouts
naughty.config.presets.low.timeout = 3
naughty.config.presets.critical.timeout = 0

naughty.config.presets.normal = {
  font         = 'SFNS Display 10',
  fg           = beautiful.fg_normal,
  bg = beautiful.tasklist_bg_normal,
  border_width = 0,
  margin       = dpi(16),
  position     = 'top_right'
}

naughty.config.presets.low = {
  font         = 'SFNS Display 10',
  fg           = beautiful.fg_normal,
  bg = beautiful.tasklist_bg_normal,
  border_width = 0,
  margin       = dpi(16),
  position     = 'top_right'
}

naughty.config.presets.critical = {
  font         = 'SFNS Display Bold 10',
  fg           = '#ffffff',
  bg           = '#ff0000',
  border_width = 0,
  margin       = dpi(16),
  position     = 'top_right',
  timeout      = 0
}


naughty.config.presets.ok = naughty.config.presets.normal
naughty.config.presets.info = naughty.config.presets.normal
naughty.config.presets.warn = naughty.config.presets.critical
