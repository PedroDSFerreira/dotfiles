return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup {
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
            i = {
                j = {
                    -- These can all also be functions
                    k = "<Esc>",
                    j = "<Esc>",
                },
                J = {
                    -- These can all also be functions
                    K = "<Esc>",
                    J = "<Esc>",
                },
            },
        },
    }
  end,
}
