local wezterm = require 'wezterm'

local config = wezterm.config_builder()


-- config.background = {
--   {
--     source = {
--       Color = '#000000'
--     },
--     width = "100%",
--     height = "100%",
--     -- opacity = 0.30
--   },
-- }
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = 'Medium' })
config.font_size = 18.0
config.color_scheme = 'Catppuccin Mocha'
-- config.window_background_opacity = 0.7
config.macos_window_background_blur = 20
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.disable_default_key_bindings = true

return config
