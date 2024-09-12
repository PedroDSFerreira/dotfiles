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
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors,
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then
            return
        end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err),
        })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.
local terminal = os.getenv("TERM") or "wezterm"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

-- Default super.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local super = "Mod4"
local alt = "Mod1"
local meh = { alt, "Control", "Shift" }

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.max,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.magnifier,
    -- awful.layout.suit.tile.left
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    --awful.layout.suit.floating,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu

-- Adds an empty wibar under my polybar so that the workarea changes
awful.wibar({
    position = "top",
    height = 28,
    opacity = 0,
})

-- }}}

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    awful.spawn_with_shell("xrandr --auto")
end)

awful.screen.connect_for_each_screen(function(s)
    if s.index == 1 then
        -- Main screen: tags 1 to 5
        awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
    elseif s.index == 2 then
        -- Secondary screen: tags 6 to 9
        awful.tag({ "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    end
end)
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
-------------
    awful.key(meh, "Escape", awful.tag.history.restore, { description = "go back", group = "Alt" }),
    -------------
    awful.key({ super }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
    awful.key({ super }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
    awful.key({ alt }, "Tab", function()
        awful.client.focus.byidx(1)
    end, { description = "focus next by index", group = "client" }),
    awful.key({ alt, "Shift" }, "Tab", function()
        awful.client.focus.byidx(-1)
    end, { description = "focus previous by index", group = "client" }),

    -- Layout manipulation
    -------------
    awful.key(meh, "Tab", function()
        awful.screen.focus_relative(1)
    end, { description = "focus the next screen", group = "Alt" }),
    -------------
    awful.key({ super, "Control" }, "Right", function()
        awful.client.swap.byidx(1)
    end, { description = "swap with next client by index", group = "client" }),
    awful.key({ super, "Control" }, "Left", function()
        awful.client.swap.byidx(-1)
    end, { description = "swap with previous client by index", group = "client" }),
    awful.key({ super, "Control" }, "Tab", function()
        awful.screen.focus_relative(1)
    end, { description = "focus the next screen", group = "screen" }),
    awful.key({ super }, "Right", function()
        awful.tag.incmwfact(0.05)
    end, { description = "increase master width factor", group = "layout" }),
    awful.key({ super }, "Left", function()
        awful.tag.incmwfact(-0.05)
    end, { description = "decrease master width factor", group = "layout" }),
    awful.key({ super }, "Up", function(c)
        awful.client.incwfact(0.05, client.focus)
    end, { description = "increase master height factor", group = "layout" }),
    awful.key({ super }, "Down", function(c)
        awful.client.incwfact(-0.05, client.focus)
    end, { description = "decrease master height factor", group = "layout" }),
    awful.key({ super, "Shift" }, "Right", function()
        awful.tag.incnmaster(1, nil, true)
    end, { description = "increase the number of master clients", group = "layout" }),
    awful.key({ super, "Shift" }, "Left", function()
        awful.tag.incnmaster(-1, nil, true)
    end, { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ super, "Shift" }, "Up", function()
        awful.tag.incncol(1, nil, true)
    end, { description = "increase the number of columns", group = "layout" }),
    awful.key({ super, "Shift" }, "Down", function()
        awful.tag.incncol(-1, nil, true)
    end, { description = "decrease the number of columns", group = "layout" }),
    awful.key({ super }, "space", function()
        awful.layout.inc(1)
    end, { description = "select next layout", group = "layout" }),
    awful.key({ super, "Shift" }, "space", function()
        awful.layout.inc(-1)
    end, { description = "select previous layout", group = "layout" }),
    -- awful.key({ super, "Control", "Shift" }, "Tab", function()
    -- 	awful.screen.focus_relative(-1)
    -- end, { description = "focus the previous screen", group = "screen" }),
    -- awful.key({ super }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

    -- Standard program
    -------------
    awful.key(meh, "Delete", function()
        awful.spawn("xkill")
    end, { description = "Kill window", group = "Alt" }),
    -------------
    awful.key({ super }, "Return", function()
        awful.spawn("wezterm")
    end, { description = "Open a terminal", group = "launcher" }),
    awful.key({ super, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
    awful.key({ super, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

    -- Menubar
    -- awful.key({ super }, "p", function()
    --     menubar.show()
    -- end, { description = "show the menubar", group = "launcher" }),
    -- Rofi Launcher
    awful.key({ super }, "r", function()
        awful.util.spawn("rofi -show drun")
    end, { description = "launcher", group = "launcher" }),
    awful.key({ alt, "Control" }, "Delete", function()
        awful.spawn("xkill")
    end, { description = "Kill window", group = "launcher" }),

    -- remap volume keys to volume control
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn("pamixer --increase 10")
    end),
    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn("pamixer --decrease 10")
    end),
    awful.key({}, "XF86AudioMute", function()
        awful.spawn("pamixer --toggle-mute")
    end),
    awful.key({}, "XF86AudioPlay", function()
        awful.spawn("playerctl play-pause")
    end),
    awful.key({}, "F1", function()
        awful.spawn("playerctl play-pause")
    end),

    -- change screen brightness
    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn("brightnessctl set 10%+")
    end),
    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn("brightnessctl set 10%-")
    end),

    -- Shortcuts for applications
    -------------
    -- awful.key(meh, "v", function()
    --     awful.spawn("code")
    -- end, { description = "VScode", group = "Alt" }),
    -- awful.key(meh, "n", function()
    --     awful.spawn("notion-app")
    -- end, { description = "Notion", group = "Alt" }),
    -- awful.key(meh, "o", function()
    --     awful.spawn("obsidian")
    -- end, { description = "Obsidian", group = "Alt" }),
    awful.key(meh, "s", function()
        awful.spawn("spotify")
    end, { description = "Spotify", group = "Alt" }),
    awful.key(meh, "b", function()
        awful.spawn("brave")
    end, { description = "Open browser", group = "Alt" }),
    awful.key(meh, "e", function()
        awful.spawn("thunar")
    end, { description = "Open file explorer", group = "Alt" }),
    awful.key(meh, "s", function()
        awful.util.spawn_with_shell(
            "scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png -s -e 'xclip -selection clipboard -t image/png -i $f'"
        )
        naughty.notify({ text = "Screenshot saved", timeout = 2 })
    end, { description = "Take screenshot", group = "Alt" }),
    -------------
    awful.key({ alt, "Control" }, "v", function()
        awful.spawn("code")
    end, { description = "VScode", group = "Shortcuts" }),
    awful.key({ alt, "Control" }, "n", function()
        awful.util.spawn_with_shell("zsh -i -c 'brave --app=https://www.notion.so/'")
    end, { description = "Notion", group = "Shortcuts" }),
    awful.key({ alt, "Control" }, "c", function()
        awful.util.spawn_with_shell("zsh -i -c 'brave --app=https://calendar.notion.so/'")
    end, { description = "Notion Calendar", group = "Shortcuts" }),
    awful.key({ alt, "Control" }, "s", function()
        awful.spawn("spotify")
    end, { description = "Spotify", group = "Shortcuts" }),
    awful.key({ alt, "Control" }, "b", function()
        awful.spawn("brave")
    end, { description = "Open browser", group = "Shortcuts" }),
    awful.key({ super }, "e", function()
        awful.spawn("wezterm start --always-new-process --class='yazi' yazi")
    end, { description = "Open file explorer", group = "Shortcuts" }),
    awful.key({ super, "Shift" }, "s", function()
        awful.util.spawn_with_shell(
            "scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png -s -e 'xclip -selection clipboard -t image/png -i $f'"
        )
        naughty.notify({ text = "Screenshot saved", timeout = 2 })
    end, { description = "Take screenshot", group = "screen" }),
    awful.key({}, "Print", function()
        awful.util.spawn_with_shell("scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png")
        naughty.notify({ text = "Screenshot saved", timeout = 2 })
    end, { description = "Take screenshot", group = "screen" })
)

clientkeys = gears.table.join(
    awful.key({ super }, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, { description = "toggle fullscreen", group = "client" }),
    awful.key({ super }, "w", function(c)
        c:kill()
    end, { description = "close", group = "client" }),
    awful.key(
        { super, "Control" },
        "space",
        awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }
    ),
    -- awful.key({ super, "Control" }, "Return", function(c)
    --     c:swap(awful.client.getmaster())
    -- end, { description = "move to master", group = "client" }),
    awful.key({ super }, "o", function(c)
        c:move_to_screen()
    end, { description = "move to screen", group = "client" }),
    -- awful.key({ super }, "t", function(c)
    --     c.ontop = not c.ontop
    -- end, { description = "toggle keep on top", group = "client" }),
    awful.key({ super }, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, { description = "minimize", group = "client" }),
    awful.key({ super, "Shift" }, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal("request::activate", "key.unminimize", { raise = true })
        end
    end, { description = "restore minimized", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 5.
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,

        -- View tag only.
        awful.key({ super }, "#" .. (i + 9), function()
            local screen_index, tag_index
            if i <= 5 then
                screen_index = 1 -- Main screen
                tag_index = i
            else
                screen_index = 2 -- Secondary screen
                tag_index = i - 5
            end

            local target_screen = screen[screen_index]
            if target_screen then
                local tag = target_screen.tags[tag_index]
                if tag then
                    tag:view_only()
                    awful.screen.focus(target_screen)
                end
            end
        end, { description = "View tag #" .. i, group = "Tag" }),

        -- Move focused client to tag.
        awful.key({ super, "Shift" }, "#" .. (i + 9), function()
            if client.focus then
                local screen_index, tag_index
                if i <= 5 then
                    screen_index = 1 -- Main screen
                    tag_index = i
                else
                    screen_index = 2 -- Secondary screen
                    tag_index = i - 5
                end

                local target_screen = screen[screen_index]
                if target_screen then
                    local tag = target_screen.tags[tag_index]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end
        end, { description = "Move focused client to tag #" .. i, group = "Tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ super }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ super }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    },

    -- Floating clients.
    {
        rule_any = {
            class = { "Notepadqq", "feh" },
        },
        properties = {
            floating = true,
            maximized = false,

            placement = awful.placement.centered,
        },
    },

    -- Task Manager
    {
        rule_any = {
            instance = {
                "task manager",
                "yazi",
            },
        },
        properties = {
            floating = true,
            ontop = true,
            sticky = true,
            -- placement = awful.placement.centered,
            width = awful.screen.focused().workarea.width * 0.8,
            height = awful.screen.focused().workarea.height * 0.8,
        },
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "Pavucontrol",
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true, position = awful.placement.closest_corner },
    },
    -- Disable default maximized state
    {
        rule_any = {
            class = { "Firefox", "Brave-browser" },
        },
        properties = {
            maximized = false,
        },
    },

    {
        rule_any = {
            class = { "Brave-browser" },
            instance = { "notion.so", "calendar.notion.so" },
        },
        properties = {
            floating = false,
        },
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    c:emit_signal("request::activate", "mouse_enter", {raise = false})
--end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)
-- }}}

-- Gaps
beautiful.useless_gap = 5

-- Autostart
awful.spawn.with_shell("~/.scripts/autostart.sh")

-- Padding on all screens
beautiful.padding = { top = 39 }
--screen[1].padding = { top = 30, bottom = 0, left = 0, right = 0 }
