" Plugins
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'dracula/vim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Mapping config
source mapping.vim

" NERDTree config
runtime nerdTree.vim
lua << END
require('lua/init')
END
