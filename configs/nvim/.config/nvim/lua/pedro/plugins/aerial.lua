return {
  'stevearc/aerial.nvim',
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  config = true,
  init = function()
    require("aerial").setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", ",", "<cmd> AerialPrev <CR>", { desc = "Previous code block" })
    keymap.set("n", "m", "<cmd> AerialNext <CR>", { desc = "Next code block" })
    keymap.set("n", "<leader>fc", "<cmd> Telescope aerial <CR>", { desc = "Code block" })
  end
}
