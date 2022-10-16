local awful = require("awful")
local beautiful = require("beautiful")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")


local menu = {}

local nautilus = function() awful.util.spawn("nautilus") end

function menu.build(args)
    -- Create a launcher widget and a main menu
    local myawesomemenu = {
        { "Hotkeys", function() args.hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "Manual", terminal .. " -e man awesome" },
        { "Edit config", editor_cmd .. " " .. awesome.conffile },
        { "Open terminal", terminal },
        { "Open file explorer", nautilus },
        { "Lock", args.lockscreen },
        { "Restart", awesome.restart },
        { "Quit", function() awesome.quit() end },
    }

    local menu_awesome = { "Awesome", myawesomemenu, beautiful.awesome_icon }

    local mymainmenu = {}

    if has_fdo then
        mymainmenu = freedesktop.menu.build({
            before = { menu_awesome }
        })
    else
        mymainmenu = awful.menu({
            items = {
                menu_awesome,
                { "Debian", debian.menu.Debian_menu.Debian }
            }
        })
    end

    return mymainmenu
end

return menu
