-- KEYBINDINGS
vim.keymap.set('i', '<C-S-Right>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-S-Left>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-Space>', 'copilot#Accept("<CR>")', {noremap = true, silent = true, expr=true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true