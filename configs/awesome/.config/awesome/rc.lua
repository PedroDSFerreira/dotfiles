-- Structure:
-- ├── theme.lua               # Theme, gaps, and visual settings
-- ├── modules/
-- │   ├── error-handling.lua  # Startup and runtime error handling
-- │   ├── layouts.lua         # Available window layouts
-- │   └── wibar.lua          # Status bar and screen setup
-- ├── keys.lua               # All key bindings and shortcuts
-- ├── rules.lua              # Window rules and properties
-- ├── signals.lua            # Client lifecycle and focus management
-- └── autostart.lua          # Application autostart

-- Load configuration modules
local theme = require("theme")
local error_handling = require("modules.error-handling")
local layouts = require("modules.layouts")
local wibar = require("modules.wibar")
local keys = require("keys")
local rules = require("rules")
local signals = require("signals")
local autostart = require("autostart")

-- Build and apply configuration
local function build_config()
    -- 1. Initialize error handling first
    error_handling.setup()
    
    -- 2. Initialize theme
    theme.init()
    
    -- 3. Setup layouts
    layouts.apply()
    
    -- 4. Setup wibar and screens
    wibar.setup()
    
    -- 5. Setup key bindings
    keys.apply()
    
    -- 6. Setup window rules (needs clientkeys and clientbuttons from keys)
    rules.apply(keys.clientkeys, keys.clientbuttons)
    
    -- 7. Setup client signals
    signals.setup()
    
    -- 8. Run autostart applications
    autostart.run()
end

-- Initialize the configuration
build_config()
