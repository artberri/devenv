local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local tasklist = {}

tasklist.buttons = gears.table.join(
  awful.button({}, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),
  awful.button({}, 3, function()
    awful.menu.client_list({ theme = { width = 250 } })
  end),
  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
  end),
  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
  end))

tasklist.widget_template = {
  {
    {
      {
        {
          id     = 'icon_role',
          widget = wibox.widget.imagebox,
        },
        margins = 2,
        right   = 10,
        widget  = wibox.container.margin,
      },
      {
        id     = 'text_role',
        widget = wibox.widget.textbox,
      },
      layout = wibox.layout.fixed.horizontal,
    },
    left   = 10,
    right  = 10,
    top    = 5,
    bottom = 5,
    widget = wibox.container.margin
  },
  id     = 'background_role',
  widget = wibox.container.background,
}

return tasklist
