local home = os.getenv("HOME")
local mymodules = home .. "/.awesome/modules/?.lua"
package.path = package.path .. ";" .. mymodules

local awful = require("awful")
local rules = require("awful.rules")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local vicious = require("vicious")


-- Default applications

local terminal = "urxvt"
local browser = "chromium"
local filemanager = "nemo --no-desktop"
local editor = "vim"

local modkey = "Mod4"
local awesomedir = home .. "/.awesome"
local themes = awesomedir .. "/themes"
local active_theme = themes .. "/tomorrow-night"
local wallpapers = awesomedir .. "/wallpapers"
local icons = awesomedir .. "/icons"


-- Theme init

beautiful.init(active_theme .. "/theme.lua")
beautiful.wallpaper = wallpapers .. "/sleepy-kitten.jpg"

gears.wallpaper.maximized(beautiful.wallpaper, nil, true)


-- Layout

local layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.fair,
  awful.layout.suit.floating
}

-- Tags

local tags = {
  names = { "TERM", "WEB", "CODE", "CHAT", "GAME", "VIDEO", "OTHERS" }
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, layouts.floating)
end


-- Contextual menu

local mainmenu = awful.menu({
  items = {
    {"term", terminal},
    {"browser", browser},
    {"files", filemanager},
    {"restart", awesome.restart},
    {"quit", awesome.quit},
  }
})

-- Separator
local separator = wibox.widget.textbox()
separator:set_text(' ')

--cpu
local cpuwidget = wibox.widget.textbox()
local cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.widget_cpu)

vicious.register(cpuwidget, vicious.widgets.cpu,
  '<span color="' .. beautiful.fg_magenta .. '">$1%</span>', 13)

--memory
local memwidget = wibox.widget.textbox()
local memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.widget_mem)

vicious.register(memwidget, vicious.widgets.mem,
  '<span color="' .. beautiful.fg_magenta .. '">$1%</span>', 13)

--network
netupwidget = wibox.widget.textbox()
netdownwidget = wibox.widget.textbox()
netupicon = wibox.widget.imagebox()
netdownicon = wibox.widget.imagebox()
netupicon:set_image(beautiful.widget_netup)
netdownicon:set_image(beautiful.widget_netdown)

vicious.register(netupwidget, vicious.widgets.net, '<span color="' .. theme.fg_yellow  .. '">${eno1 up_kb}</span>', 3)
vicious.register(netdownwidget, vicious.widgets.net, '<span color="' .. theme.fg_green  .. '">${eno1 down_kb}</span>', 3)

--audio
audiowidget = wibox.widget.textbox()
local audioicon = wibox.widget.imagebox()
audioicon:set_image(beautiful.widget_spkr)

vicious.register(audiowidget, vicious.widgets.volume, '<span color="' .. theme.fg_blue .. '">$1%</span>', 2, "PCM")

audiowidget:buttons(awful.util.table.join(
  awful.button({ }, 1, function () awful.util.spawn("amixer -q set PCM 5dB+", false) end),
  awful.button({ }, 3, function () awful.util.spawn("amixer -q set PCM 5dB-", false) end)
))

--Clock
local clock = awful.widget.textclock()


--Kernel
local archicon = wibox.widget.imagebox()
archicon:set_image(beautiful.widget_arch)

--UpTIme
local uptimewidget = wibox.widget.textbox()
vicious.register(uptimewidget, vicious.widgets.uptime, "UPTIME: <span color='" .. beautiful.fg_blue .. "'>$2H $3MIN</span>", 61)


local toppanel = {}
local botpanel = {}
local promptbox = {}
local taglist = {}
local tasklist = {}

taglist.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag)
)

for s = 1, screen.count() do
  promptbox[s] = awful.widget.prompt()

  taglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all,
    taglist.buttons)

  tasklist[s] = awful.widget.tasklist(s,
    awful.widget.tasklist.filter.focused, tasklist.buttons)

  toppanel[s] = awful.wibox({ position = "top", screen = s })
  botpanel[s] = awful.wibox({ position = "bottom", screen = s })

  local left_layout = wibox.layout.fixed.horizontal()
  left_layout:add(separator)
  left_layout:add(taglist[s])
  left_layout:add(separator)
  left_layout:add(promptbox[s])

  local right_layout = wibox.layout.fixed.horizontal()
  if screen.count() == 2 and s == 2 or screen.count() == 1 then
    right_layout:add(wibox.widget.systray())
    right_layout:add(separator)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(separator)
    right_layout:add(netupicon)
    right_layout:add(netupwidget)
    right_layout:add(netdownicon)
    right_layout:add(netdownwidget)
    right_layout:add(separator)
    right_layout:add(audioicon)
    right_layout:add(audiowidget)
    right_layout:add(separator)
    right_layout:add(clock)
  end

  local layout = wibox.layout.align.horizontal()
  layout:set_left(left_layout)
  layout:set_middle(tasklist[s])
  layout:set_right(right_layout)

  toppanel[s]:set_widget(layout)
  toppanel[s]:set_bg(theme.fg_black)

  --Bottom panel

  local bot_left_layout = wibox.layout.fixed.horizontal()
  bot_left_layout:add(archicon)

  local bot_right_layout = wibox.layout.fixed.horizontal()
  bot_right_layout:add(uptimewidget)

  local bot_layout = wibox.layout.align.horizontal()
  bot_layout:set_left(bot_left_layout)
  bot_layout:set_right(bot_right_layout)

  botpanel[s]:set_widget(bot_layout)
  botpanel[s]:set_bg(theme.fg_black)
end


--Mouse binding
root.buttons(awful.util.table.join(
  awful.button({}, 3, function() mainmenu:toggle() end)
))


-- Key binding
globalkeys = awful.util.table.join(
  awful.key({ modkey, }, "j", function()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey, }, "k", function()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end),
  awful.key({ modkey, "Mod1" }, "/", function(c)
    local curidx = awful.tag.getidx()
    local dstidx = curidx + 1
    if curidx == 9 then dstidx = 1 end
    awful.client.movetotag(tags[mouse.screen][dstidx], c)
  end),
  awful.key({ modkey, "Mod1"   }, ".", function(c)
    local curidx = awful.tag.getidx()
    local dstidx = curidx - 1
    if curidx == 1 then dstidx = 9 end
    awful.client.movetotag(tags[mouse.screen][dstidx], c)
  end),
  awful.key({ modkey, }, "t", function() awful.util.spawn(terminal) end),
  awful.key({ modkey, }, "e", function() awful.util.spawn(editor) end),
  awful.key({ modkey, }, "w", function() awful.util.spawn(browser) end),
  awful.key({ modkey, }, "f", function() awful.util.spawn(filemanager) end),
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Control" }, "q", awesome.quit),
  awful.key({ modkey, }, "l", function() awful.tag.incmwfact( 0.05) end),
  awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end),
  awful.key({ modkey, }, "space", function() awful.layout.inc(layouts, 1) end),
  awful.key({ modkey, "Control" }, "n", awful.client.restore),
  awful.key({ modkey }, "r", function() promptbox[mouse.screen]:run() end),
  awful.key({ modkey, }, "o", awful.client.movetoscreen ),
  awful.key({ modkey, "Mod1" }, "m", function() xrandr.switch(2) end),
  awful.key({ }, "XF86AudioRaiseVolume", function()
    awful.util.spawn("amixer set Master 1%+", false)
  end),
  awful.key({ }, "XF86AudioLowerVolume", function()
    awful.util.spawn("amixer set Master 1%-", false)
  end),
  awful.key({ }, "XF86AudioMute", function()
    awful.util.spawn("amixer set Master toggle", false)
  end),
  awful.key({ "Mod4" }, "F3", function()
    awful.util.spawn("amixer set Master 1%+", false)
  end),
  awful.key({ "Mod4" }, "F2", function()
    awful.util.spawn("amixer set Master 1%-", false)
  end),
  awful.key({ "Mod4" }, "F1", function()
    awful.util.spawn("amixer set Master toggle", false)
  end)
)

clientkeys = awful.util.table.join(
  awful.key({ modkey, "Mod1" }, "c", function(c) c:kill() end),
  awful.key({ modkey, }, "f", function(c) c.fullscreen = not c.fullscreen end),
  awful.key({ modkey, }, "n", function(c) c.minimized = true end),
  awful.key({ modkey, }, "m", function(c)
    c.maximized_horizontal = not c.maximized_horizontal
    c.maximized_vertical = not c.maximized_vertical
  end)
)

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize)
)

keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(9, math.max(#tags[s], keynumber))
end

for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = mouse.screen
      if tags[screen][i] then
        awful.tag.viewonly(tags[screen][i])
      end
    end),
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = mouse.screen
      if tags[screen][i] then
        awful.tag.viewtoggle(tags[screen][i])
      end
    end),
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus and tags[client.focus.screen][i] then
        awful.client.movetotag(tags[client.focus.screen][i])
      end
    end),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus and tags[client.focus.screen][i] then
        awful.client.toggletag(tags[client.focus.screen][i])
      end
    end)
  )
end

root.keys(globalkeys)


-- Signals
client.connect_signal("manage", function(c, startup)
  c:connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
      and awful.client.focus.filter(c) then
      client.focus = c
    end
  end)

  if not startup then
    if not c.size_hints.user_position and not
        c.size_hints.program_position then
      awful.placement.no_overlap(c)
      awful.placement.no_offscreen(c)
    end
  end
end)

client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)

--rules 
rules.rules = {
    {
      rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        keys = clientkeys,
        buttons = clientbuttons,
        size_hints_honor = false,
        opacity = 1.0
      }
    },
    { rule = { class = "Exe"}, properties = {floating = true} },
    { rule = { class = "Chromium"}, properties = {tag = tags[1][2]} },
    { rule = { class = "MPlayer"}, properties = {floating = true, tag = tags[1][6]} },
    { rule = { class = "URxvt"}, properties = {opacity = 0.9, floating = true, tag = tags[1][1]} },
}
