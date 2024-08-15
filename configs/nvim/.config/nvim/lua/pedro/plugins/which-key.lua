return {
    "folke/which-key.nvim",
    dependencies = {
        { "echasnovski/mini.nvim", version = false },
    },
    event = "VeryLazy",
    opts = {
        -- General options
        plugins = {
            marks = false,
            registers = false,
        },
        window = {
            border = "rounded",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 1, 2, 1, 2 },
            winblend = 0,
            zindex = 1000,
        },
        -- Icons configuration if needed
        icons = {
            -- Icon settings here
        },
        -- Triggers configuration
        triggers = {
            { "<auto>",   mode = "nixsotc" },
            { "<leader>", mode = { "n", "v" } },
        },
        defer = function(ctx)
            -- Defer logic here
        end,
    },
    config = function()
        local wk = require("which-key")

        -- Assuming a new method for registering keys, adapt as necessary
        wk.setup({
            ["<leader>f"] = { name = "+find", icon = "" }, -- Using a file search icon
            ["<leader>e"] = { name = "+explorer", icon = "" }, -- Using a folder icon
            ["<leader>t"] = { name = "+toggle", icon = "" }, -- Using a toggle icon
            ["<leader>g"] = { name = "+git", icon = "" }, -- Using a git icon
            ["<leader>c"] = { name = "+code", icon = "" }, -- Using a code icon
        })
    end,
}
