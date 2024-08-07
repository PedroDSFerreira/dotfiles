-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.font_size = 16.0
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.7
config.macos_window_background_blur = 20
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.disable_default_key_bindings = true


return config
