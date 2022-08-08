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
call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula

lua require("nvim-tree").setup()

