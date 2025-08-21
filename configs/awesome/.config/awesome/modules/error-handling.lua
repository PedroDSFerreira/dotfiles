-- Error Handling Configuration
-- Returns startup errors and runtime error notifications setup

local naughty = require("naughty")

-- Configuration constants
local ERROR_CONFIG = {
    notification_timeout = 0, -- 0 means no auto-hide
    critical_preset = naughty.config.presets.critical
}

-- Handle startup errors
local function handle_startup_errors()
    if awesome.startup_errors then
        naughty.notify({
            preset = ERROR_CONFIG.critical_preset,
            title = "Oops, there were errors during startup!",
            text = awesome.startup_errors,
            timeout = ERROR_CONFIG.notification_timeout
        })
    end
end

-- Handle runtime errors
local function handle_runtime_errors()
    local in_error = false
    
    awesome.connect_signal("debug::error", function(err)
        -- Prevent infinite error loops
        if in_error then 
            return 
        end
        in_error = true

        naughty.notify({
            preset = ERROR_CONFIG.critical_preset,
            title = "Oops, an error happened!",
            text = tostring(err),
            timeout = ERROR_CONFIG.notification_timeout
        })
        
        in_error = false
    end)
end

-- Return error handling configuration
return {
    config = ERROR_CONFIG,
    
    -- Setup function to be called by rc.lua
    setup = function()
        handle_startup_errors()
        handle_runtime_errors()
    end
}
