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
vim.call('plug#end')

--colorscheme 
vim.cmd([[colorscheme gruvbox]])
require('custom-gruvbox')
