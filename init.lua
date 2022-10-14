local Plug = vim.fn['plug#']
vim.call('plug#begin','~/AppData/Local/nvim/plugged')
Plug 'dracula/vim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox' 
Plug 'lewis6991/impatient.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
vim.call('plug#end')

--startup time
require('impatient')
--Starting Language servers
require("mason").setup()
require("mason-lspconfig").setup()
--colorscheme 
vim.cmd([[colorscheme gruvbox]])
require('custom-gruvbox')
