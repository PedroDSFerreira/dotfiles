set nocompatible
set mouse+=a
set number


call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'junegunn/fzf.vim'
	Plug 'romgrk/barbar.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'windwp/nvim-autopairs'
	Plug 'github/copilot.vim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula

lua require("nvim-tree").setup()

" Required to be in one line
lua require'nvim-treesitter.configs'.setup {highlight = {enable = true,disable = {}}, incremental_selection = {enable = true, keymaps = {init_selection = "gnn", node_incremental = "grn", scope_incremental = "grc", node_decremental = "grm"}}, indent = {enable = true, disable = {}}, ensure_installed = {"bash","c","cpp","css","dockerfile","gitignore","html","http","java","javascript","json","lua","make","markdown","php","python","regex","ruby","rust","sql","toml","vim","yaml",}}