set nocompatible
set mouse+=a
set number


call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'windwp/nvim-autopairs'
	Plug 'github/copilot.vim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" LSP-zero
	" LSP Support
	Plug 'neovim/nvim-lspconfig'                           " Required
	Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
	Plug 'williamboman/mason-lspconfig.nvim'               " Optional
  
	" Autocompletion
	Plug 'hrsh7th/nvim-cmp'         " Required
	Plug 'hrsh7th/cmp-nvim-lsp'     " Required
	Plug 'L3MON4D3/LuaSnip'         " Required
  
	Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

	" Telescope
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }


	Plug 'mbbill/undotree'
	Plug 'tpope/vim-fugitive'
call plug#end()

source $HOME/.config/nvim/vim-plug/plugins/dracula.lua
source $HOME/.config/nvim/vim-plug/plugins/nvim-tree.lua
source $HOME/.config/nvim/vim-plug/plugins/treesitter.lua
source $HOME/.config/nvim/vim-plug/plugins/lsp-zero.lua
source $HOME/.config/nvim/vim-plug/plugins/telescope.lua
source $HOME/.config/nvim/vim-plug/plugins/copilot.lua
source $HOME/.config/nvim/vim-plug/plugins/undotree.lua
source $HOME/.config/nvim/vim-plug/plugins/fugitive.lua