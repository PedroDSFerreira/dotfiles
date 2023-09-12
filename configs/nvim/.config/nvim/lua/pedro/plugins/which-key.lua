return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local wk = require("which-key")

    wk.register({
      ["<leader>f"] = { name = "+find" },
      ["<leader>e"] = { name = "+explorer" },
      ["<leader>t"] = { name = "+toggle" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>c"] = { name = "+code" },
    })
  end,
  opts = {
    plugins = {
      marks = false,
      registers = false,
    },
    window = {
      border = "rounded",       -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
      zindex = 1000,            -- positive value to position WhichKey above other floating windows.
    },
  }
}
