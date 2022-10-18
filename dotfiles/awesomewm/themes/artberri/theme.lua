---------------------------
-- My theme --
---------------------------

local theme_assets    = require("beautiful.theme_assets")
local xresources      = require("beautiful.xresources")
local dpi             = xresources.apply_dpi
local gears           = require("gears")
local awful           = require("awful")
local wibox           = require("wibox")
local beautiful       = require("beautiful")
local gfs             = require("gears.filesystem")
local themes_path     = gfs.get_themes_dir()
local mytheme_path    = gfs.get_configuration_dir() .. "themes/artberri/"
local holo_theme_path = os.getenv("HOME") .. "/.config/awesome/copycats/themes/holo"
local powerarrow_path = os.getenv("HOME") .. "/.config/awesome/copycats/themes/powerarrow-dark"
local suit            = awful.layout.suit

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

local theme = {}

-- Dracula theme color palette https://draculatheme.com/contribute
theme.color_background        = "#2D2B55"
theme.color_background_active = "#1E1E3F"
theme.color_foreground        = "#CEC5FF"
theme.color_urgent            = "#FAD000"
theme.color_comment           = "#525087"

theme.color_cyan   = "#8be9fd"
theme.color_green  = "#50fa7b"
theme.color_orange = "#ffb86c"
theme.color_pink   = "#ff79c6"
theme.color_purple = "#bd93f9"
theme.color_red    = "#ff5555"
theme.color_yellow = "#f1fa8c"

-- Photo by v2osk on Unsplash
theme.wallpaper = mytheme_path .. "v2osk-eKTUtA74uN0-unsplash.jpg"
theme.font = "Iosevka Semibold 16"

theme.bg_normal   = theme.color_background
theme.bg_focus    = theme.color_background_active
theme.bg_urgent   = theme.color_urgent
theme.bg_minimize = theme.bg_normal
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = theme.color_foreground
theme.fg_focus    = theme.fg_normal
theme.fg_urgent   = theme.color_background
theme.fg_minimize = theme.color_comment

theme.useless_gap       = dpi(5)
theme.gap_single_client = dpi(0)
theme.border_width      = dpi(0)
theme.border_normal     = theme.color_background
theme.border_focus      = theme.color_background_active
theme.border_marked     = theme.color_purple

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(50)
theme.menu_width        = dpi(300)

-- Define the image to load
theme.titlebar_close_button_normal              = powerarrow_path .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = powerarrow_path .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = powerarrow_path .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = powerarrow_path .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = powerarrow_path .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = powerarrow_path .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = powerarrow_path .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = powerarrow_path .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = powerarrow_path .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = powerarrow_path .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = powerarrow_path .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = powerarrow_path .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = powerarrow_path .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = powerarrow_path .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = powerarrow_path .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = powerarrow_path .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = powerarrow_path .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = powerarrow_path .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = powerarrow_path .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = powerarrow_path .. "/icons/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_tile       = holo_theme_path .. "/icons/tile.png"
theme.layout_tileleft   = holo_theme_path .. "/icons/tileleft.png"
theme.layout_tilebottom = holo_theme_path .. "/icons/tilebottom.png"
theme.layout_tiletop    = holo_theme_path .. "/icons/tiletop.png"
theme.layout_fairv      = holo_theme_path .. "/icons/fairv.png"
theme.layout_fairh      = holo_theme_path .. "/icons/fairh.png"
theme.layout_spiral     = holo_theme_path .. "/icons/spiral.png"
theme.layout_dwindle    = holo_theme_path .. "/icons/dwindle.png"
theme.layout_max        = holo_theme_path .. "/icons/max.png"
theme.layout_fullscreen = holo_theme_path .. "/icons/fullscreen.png"
theme.layout_magnifier  = holo_theme_path .. "/icons/magnifier.png"
theme.layout_floating   = holo_theme_path .. "/icons/floating.png"

-- Generate Awesome icon:
theme.awesome_icon = mytheme_path .. "logo.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

theme.hotkeys_bg = theme.bg_normal
theme.hotkeys_fg = theme.fg_normal
theme.hotkeys_modifiers_fg = theme.color_purple
theme.hotkeys_font = "Iosevka Semibold 14"
theme.hotkeys_description_font = "Iosevka Semibold 14"
theme.hotkeys_group_margin = dpi(16)
theme.hotkeys_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, dpi(12))
end

theme.notification_max_width = dpi(640)
theme.notification_max_height = dpi(160)
theme.notification_font = "Iosevka Semibold 12"
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_border_width = dpi(1)
theme.notification_border_color = theme.bg_normal
theme.notification_opacity = 0.8
theme.notification_icon_size = dpi(48)
theme.notification_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 12)
end

function theme.at_screen_connect(s)
    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Each screen has its own tag table.
    if s.index == screen.primary.index then
        -- Quake terminal
        s.quake = awful.util.quake({ app = "alacritty", argname = "--title %s",
            extra = "--class QuakeDD -o \"window.startup_mode=Fullscreen\" -e tmux", visible = true,
            height = 1, screen = s })

        awful.tag(
            {
                awful.util.tagnames.browser,
                awful.util.tagnames.code,
                awful.util.tagnames.communication,
                awful.util.tagnames.extra
            },
            s,
            { suit.max, suit.max, suit.max, suit.fair })
    else
        awful.tag({ "main" }, s, suit.max.fullscreen)
    end

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons
    }
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen          = s,
        filter          = awful.widget.tasklist.filter.currenttags,
        buttons         = awful.util.tasklist.buttons,
        widget_template = awful.util.tasklist.widget_template,
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    if s.index == screen.primary.index then
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                awful.util.launcher,
                s.mytaglist,
                s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                wibox.widget.systray(),
                mytextclock,
                s.mylayoutbox,
            },
        }
    else
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
            },
        }
    end
end

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
