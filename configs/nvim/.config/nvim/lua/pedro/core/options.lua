local opt = vim.opt

opt.mouse = nil
opt.nu = true
opt.relativenumber = true

opt.spr = true

-- opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.showtabline = 0
opt.termguicolors = true

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevel = 99

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})
