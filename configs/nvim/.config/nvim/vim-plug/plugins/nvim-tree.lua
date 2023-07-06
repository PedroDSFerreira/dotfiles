require("nvim-tree").setup()

-- KEYBINDINGS
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', {silent = true})
