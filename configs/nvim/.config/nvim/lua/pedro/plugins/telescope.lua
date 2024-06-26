return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-h>"] = "which_key",
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                        ["\""] = actions.select_horizontal,
                        ["%"] = actions.select_vertical,
                        ["<C-h>"] = "which_key",
                    },
                },
            },
        })

        telescope.load_extension("aerial")
    end,
}
