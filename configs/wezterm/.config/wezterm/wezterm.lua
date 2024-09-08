local wezterm = require 'wezterm'
local act = wezterm.action

local config_modules = {}

function config_modules.set_font(config)
  config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = 'Medium' })
  config.font_size = 18.0
end

function config_modules.set_color_scheme(config)
  config.color_scheme = 'Catppuccin Mocha'
end

function config_modules.set_window_appearance(config)
  config.background = {
    {
      source = {
        Color = '#191819'
      },
      width = "100%",
      height = "100%",
      opacity = 0.80
    },
  }
  config.macos_window_background_blur = 20
  config.window_decorations = "RESIZE"
end

function config_modules.set_window_behavior(config)
  config.enable_tab_bar = false
  config.audible_bell = "Disabled"
end

function config_modules.set_keybindings(config)
  config.disable_default_key_bindings = true
  config.keys = {
    {key="c", mods="CMD", action=act.CopyTo("Clipboard")},
    {key="v", mods="CMD", action=act.PasteFrom("Clipboard")},
    {key="c", mods="CTRL", action=act.SendString("\x03")}, -- Reverse search
    {key="r", mods="CTRL", action=act.SendString("\x12")}, -- SIGINT signal
    {key="d", mods="CTRL", action=act.SendString("\x04")}, -- Send EOF signal
    {key="v", mods="CTRL", action=act.SendString("\x16")},
    {key="+", mods="CTRL", action=act.IncreaseFontSize},
    {key="-", mods="CTRL", action=act.DecreaseFontSize},
    {key="t", mods="CMD", action=act.SpawnWindow},         -- Command + T: New Window
    {key="w", mods="CMD", action=act.CloseCurrentPane{confirm=true}}, -- Command + W: Close Window
  }
end

function config_modules.set_cursor_appearance(config)
  config.default_cursor_style = "BlinkingBlock"
  config.cursor_blink_rate = 1000
end

local config = wezterm.config_builder()

for _, module in pairs(config_modules) do
  module(config)
end

return config
