-- Package plugins

local Plug = vim.fn['plug#']
-- change directory depending on OS
local pluginPath
if vim.fn.has("win32") == 1 then
  pluginPath = vim.loop.os_homedir() .. '\\AppData\\Local\\nvim\\plugged'
else
  pluginPath = vim.loop.os_homedir() .. '/.config/nvim/plugged'
end
vim.call('plug#begin', pluginPath)
Plug 'dracula/vim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lualine/lualine.nvim'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'brookhong/telescope-pathogen.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'williamboman/mason.nvim'
Plug('williamboman/mason-lspconfig.nvim', {['do'] = ':MasonUpdate'})
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mhinz/vim-startify'
Plug 'L3MON4D3/LuaSnip'
Plug 'kkharji/sqlite.lua'
Plug 'm4xshen/autoclose.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'windwp/nvim-ts-autotag'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'prochri/telescope-all-recent.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'mbbill/undotree'
Plug 'Pocco81/auto-save.nvim'
Plug('VonHeikemen/lsp-zero.nvim', {['branch'] = 'v2.x'})

vim.call('plug#end')

--auto download plugins if missing
vim.cmd([[
autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif
]])
--startup time
require('impatient')

vim.cmd([[
set completeopt=menu,menuone,noselect
]])

require('init')
