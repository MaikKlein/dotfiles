---------------------------
-- Default awesome theme --
---------------------------

local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes"

client.connect_signal("manage", function (c)
    -- c.shape = gears.shape.rounded_rect
    c.border_width = "0"
end)

local theme = {}

theme.font          = "Roboto medium 10"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.taglist_bg_focus = "#268bd2" 
theme.taglist_bg_urgent = "#dc322f" 
theme.taglist_bg_empty = "#586e75" .. "60"
theme.taglist_bg_occupied = theme.taglist_bg_empty
theme.taglist_spacing = 8

theme.taglist_shape_empty = gears.shape.circle
theme.taglist_shape_focus = gears.shape.circle
theme.taglist_shape = gears.shape.circle

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."/icons/tag-list/tag/default/menu.svg"
theme.menu_submenu = themes_path.."/icons/tag-list/tag/default/menu.svg"
theme.awesome_icon = themes_path.."/icons/tag-list/tag/default/menu.svg"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
--
--
local titlebar_path = themes_path .. "/icons/titlebar/stoplight/"

-- Define the image to load
theme.titlebar_close_button_normal = titlebar_path .."close_normal.svg"
theme.titlebar_close_button_focus  = titlebar_path.."close_focus.svg"

theme.titlebar_minimize_button_normal = titlebar_path.."minimize_normal.svg"
theme.titlebar_minimize_button_focus  = titlebar_path.."minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = titlebar_path.."ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = titlebar_path.."ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = titlebar_path.."ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = titlebar_path.."ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive = titlebar_path.."sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = titlebar_path.."sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = titlebar_path.."sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = titlebar_path.."sticky_focus_active.svg"

theme.titlebar_floating_button_normal_inactive = titlebar_path.."floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = titlebar_path.."floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = titlebar_path.."floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = titlebar_path.."floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive = titlebar_path.."maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = titlebar_path.."maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = titlebar_path.."maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = titlebar_path.."maximized_focus_active.svg"

theme.wallpaper = "/home/maik/dotfiles/wallpapers/nms.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, theme.bg_focus, theme.fg_focus
-- )

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_normal = theme.bg_normal .. "70"
theme.tasklist_bg_focus = theme.tasklist_bg_normal

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
