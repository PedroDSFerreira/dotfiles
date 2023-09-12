return {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
    }
}
