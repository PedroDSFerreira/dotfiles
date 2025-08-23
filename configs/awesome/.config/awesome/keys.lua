-- Key Bindings Configuration
-- Returns all keyboard shortcuts and mouse bindings

local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local naughty = require("naughty")

-- Configuration constants
local KEYS_CONFIG = {
	terminal = os.getenv("TERMINAL") or "wezterm",
	editor = os.getenv("EDITOR") or "nvim",
	modifiers = {
		super = "Mod4",
		alt = "Mod1",
		meh = { "Mod1", "Control", "Shift" },
	},
	layout_step = 0.05,
}

-- Helper function to create editor command
local function get_editor_cmd()
	return KEYS_CONFIG.terminal .. " -e " .. KEYS_CONFIG.editor
end

-- Awesome system keys
local function create_awesome_keys()
	return gears.table.join(
		awful.key(
			{ KEYS_CONFIG.modifiers.super },
			"s",
			hotkeys_popup.show_help,
			{ description = "show help", group = "awesome" }
		),
		awful.key(
			{ KEYS_CONFIG.modifiers.super, "Control" },
			"r",
			awesome.restart,
			{ description = "reload awesome", group = "awesome" }
		),
		awful.key(
			{ KEYS_CONFIG.modifiers.super, "Shift" },
			"q",
			awesome.quit,
			{ description = "quit awesome", group = "awesome" }
		)
	)
end

-- Tag navigation keys
local function create_tag_keys()
	return gears.table.join(
		awful.key(
			{ KEYS_CONFIG.modifiers.super },
			"Escape",
			awful.tag.history.restore,
			{ description = "go back", group = "tag" }
		)
	)
end

-- Client focus and navigation keys
local function create_client_focus_keys()
	return gears.table.join(
		awful.key({ KEYS_CONFIG.modifiers.alt }, "Tab", function()
			awful.client.focus.byidx(1)
		end, { description = "focus next by index", group = "client" }),

		awful.key({ KEYS_CONFIG.modifiers.alt, "Shift" }, "Tab", function()
			awful.client.focus.byidx(-1)
		end, { description = "focus previous by index", group = "client" })
	)
end

-- Screen navigation keys
local function create_screen_keys()
	return gears.table.join(awful.key({ KEYS_CONFIG.modifiers.super, "Control" }, "Tab", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }))
end

-- Client manipulation keys
local function create_client_manipulation_keys()
	return gears.table.join(
		awful.key({ KEYS_CONFIG.modifiers.super, "Control" }, "Right", function()
			awful.client.swap.byidx(1)
		end, { description = "swap with next client by index", group = "client" }),

		awful.key({ KEYS_CONFIG.modifiers.super, "Control" }, "Left", function()
			awful.client.swap.byidx(-1)
		end, { description = "swap with previous client by index", group = "client" })
	)
end

-- Layout manipulation keys
local function create_layout_keys()
	local step = KEYS_CONFIG.layout_step

	return gears.table.join(
		-- -- Master width adjustment
		-- awful.key({ KEYS_CONFIG.modifiers.super }, "Right", function()
		--     awful.tag.incmwfact(step)
		-- end, { description = "increase master width factor", group = "layout" }),

		-- awful.key({ KEYS_CONFIG.modifiers.super }, "Left", function()
		--     awful.tag.incmwfact(-step)
		-- end, { description = "decrease master width factor", group = "layout" }),

		-- -- Client height adjustment
		-- awful.key({ KEYS_CONFIG.modifiers.super }, "Up", function()
		--     awful.client.incwfact(step, client.focus)
		-- end, { description = "increase master height factor", group = "layout" }),

		-- awful.key({ KEYS_CONFIG.modifiers.super }, "Down", function()
		--     awful.client.incwfact(-step, client.focus)
		-- end, { description = "decrease master height factor", group = "layout" }),

		-- -- Master count adjustment
		-- awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "Right", function()
		--     awful.tag.incnmaster(1, nil, true)
		-- end, { description = "increase the number of master clients", group = "layout" }),

		-- awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "Left", function()
		--     awful.tag.incnmaster(-1, nil, true)
		-- end, { description = "decrease the number of master clients", group = "layout" }),

		-- -- Column count adjustment
		-- awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "Up", function()
		--     awful.tag.incncol(1, nil, true)
		-- end, { description = "increase the number of columns", group = "layout" }),

		-- awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "Down", function()
		--     awful.tag.incncol(-1, nil, true)
		-- end, { description = "decrease the number of columns", group = "layout" }),

		-- Layout switching
		awful.key({ KEYS_CONFIG.modifiers.super }, "l", function()
			awful.layout.inc(1)
		end, { description = "select next layout", group = "layout" }),

		awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "l", function()
			awful.layout.inc(-1)
		end, { description = "select previous layout", group = "layout" })
	)
end

-- Application launcher keys
local function create_launcher_keys()
	return gears.table.join(
		awful.key({ KEYS_CONFIG.modifiers.super }, "Return", function()
			awful.spawn(KEYS_CONFIG.terminal)
		end, { description = "Open a terminal", group = "launcher" }),

		awful.key({ KEYS_CONFIG.modifiers.super }, "space", function()
			awful.util.spawn("rofi -show drun")
		end, { description = "launcher", group = "launcher" }),

		awful.key({ KEYS_CONFIG.modifiers.alt, "Control" }, "Delete", function()
			awful.spawn("xkill")
		end, { description = "Kill window", group = "launcher" })
	)
end

-- Media control keys
local function create_media_keys()
	return gears.table.join(
		-- Volume control
		awful.key({}, "XF86AudioRaiseVolume", function()
			awful.spawn("pamixer --increase 10")
		end, { description = "increase volume", group = "media" }),

		awful.key({}, "XF86AudioLowerVolume", function()
			awful.spawn("pamixer --decrease 10")
		end, { description = "decrease volume", group = "media" }),

		awful.key({}, "XF86AudioMute", function()
			awful.spawn("pamixer --toggle-mute")
		end, { description = "toggle mute", group = "media" }),

		-- Media playback
		awful.key({}, "XF86AudioPlay", function()
			awful.spawn("playerctl play-pause")
		end, { description = "play/pause", group = "media" }),

		awful.key({}, "F1", function()
			awful.spawn("playerctl play-pause")
		end, { description = "play/pause", group = "media" }),

		-- Brightness control
		awful.key({}, "XF86MonBrightnessUp", function()
			awful.spawn("brightnessctl set 10%+")
		end, { description = "increase brightness", group = "media" }),

		awful.key({}, "XF86MonBrightnessDown", function()
			awful.spawn("brightnessctl set 10%-")
		end, { description = "decrease brightness", group = "media" })
	)
end

-- Application shortcut keys
local function create_application_keys()
	local screenshot_cmd =
		"scrot --freeze ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png -s -e 'xclip -selection clipboard -t image/png -i $f'"

	return gears.table.join(
		-- Application shortcuts (Alt+Ctrl modifier)
		awful.key({ KEYS_CONFIG.modifiers.alt, "Control" }, "v", function()
			awful.spawn("code")
		end, { description = "VS Code", group = "applications" }),

		awful.key({ KEYS_CONFIG.modifiers.alt, "Control" }, "s", function()
			awful.spawn("spotify")
		end, { description = "Spotify", group = "applications" }),

		awful.key({ KEYS_CONFIG.modifiers.alt, "Control" }, "b", function()
			awful.spawn("brave")
		end, { description = "Open browser", group = "applications" }),

		-- File manager with yazi
		awful.key({ KEYS_CONFIG.modifiers.super }, "e", function()
			awful.spawn("wezterm start --always-new-process --class='yazi' yazi")
		end, { description = "Open file explorer", group = "applications" }),

		-- Screenshot functionality
		awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "s", function()
			awful.util.spawn_with_shell(screenshot_cmd)
			naughty.notify({ text = "Screenshot saved", timeout = 2 })
		end, { description = "Take screenshot", group = "screen" }),

		awful.key({}, "Print", function()
			awful.util.spawn_with_shell("scrot ~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png")
			naughty.notify({ text = "Screenshot saved", timeout = 2 })
		end, { description = "Take screenshot", group = "screen" })
	)
end

-- Client-specific key bindings
local function create_client_keys()
	return gears.table.join(
		awful.key({ KEYS_CONFIG.modifiers.super }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),

		awful.key({ KEYS_CONFIG.modifiers.super }, "w", function(c)
			c:kill()
		end, { description = "close", group = "client" }),

		awful.key(
			{ KEYS_CONFIG.modifiers.super, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),

		awful.key({ KEYS_CONFIG.modifiers.super }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),

		awful.key({ KEYS_CONFIG.modifiers.super }, "n", function(c)
			c.minimized = true
		end, { description = "minimize", group = "client" }),

		awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "n", function()
			local c = awful.client.restore()
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, { description = "restore minimized", group = "client" })
	)
end

-- Create tag switching keys (1-9)
local function create_tag_number_keys()
	local keys = {}

	for i = 1, 9 do
		keys = gears.table.join(
			keys,
			-- View tag only
			awful.key({ KEYS_CONFIG.modifiers.super }, "#" .. (i + 9), function()
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
			end, { description = "View tag #" .. i, group = "tag" }),

			-- Move focused client to tag
			awful.key({ KEYS_CONFIG.modifiers.super, "Shift" }, "#" .. (i + 9), function()
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
			end, { description = "Move focused client to tag #" .. i, group = "tag" })
		)
	end

	return keys
end

-- Mouse button bindings for clients
local function create_client_buttons()
	return gears.table.join(
		awful.button({}, 1, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
		end),
		awful.button({ KEYS_CONFIG.modifiers.super }, 1, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({ KEYS_CONFIG.modifiers.super }, 3, function(c)
			c:emit_signal("request::activate", "mouse_click", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)
end

-- Create client keys and buttons
local clientkeys = create_client_keys()
local clientbuttons = create_client_buttons()

-- Assemble all global keys
local globalkeys = gears.table.join(
	create_awesome_keys(),
	create_tag_keys(),
	create_client_focus_keys(),
	create_screen_keys(),
	create_client_manipulation_keys(),
	create_layout_keys(),
	create_launcher_keys(),
	create_media_keys(),
	create_application_keys(),
	create_tag_number_keys()
)

-- Return key configuration
return {
	config = KEYS_CONFIG,
	globalkeys = globalkeys,
	clientkeys = clientkeys,
	clientbuttons = clientbuttons,

	-- Apply function to be called by rc.lua
	apply = function()
		root.keys(globalkeys)
	end,
}
