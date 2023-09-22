-- leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- move lines
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- indent lines
-- in visual mode, keep lines selected
keymap.set("v", "<A-h>", "<gv", { desc = "Indent left" })
keymap.set("v", "<A-l>", ">gv", { desc = "Indent right" })
keymap.set("n", "<A-h>", "<<", { desc = "Indent left" })
keymap.set("n", "<A-l>", ">>", { desc = "Indent right" })

-- page jump keeping cursor position
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- searching words keeping cursor position
keymap.set("n", "n", "nzzv")
keymap.set("n", "N", "Nzzv")

-- clipboard
-- paste from clipboard
keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap.set("n", "<leader>p", '"+P', { desc = "Paste from clipboard" })
-- yank to clipboard
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap.set("n", "<leader>y", '"+Y', { desc = "Yank to clipboard" })
-- delete keeping clipboard
keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete keeping clipboard" })

-- buffer navigation
keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })
