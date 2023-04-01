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
Plug 'scrooloose/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'nvim-telescope/telescope.nvim'
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
Plug 'mfussenegger/nvim-jdtls'
Plug 'L3MON4D3/LuaSnip' 
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

--colorscheme 
vim.o.background = "dark" -- or "light" for light mode
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
require('custom-gruvbox')

