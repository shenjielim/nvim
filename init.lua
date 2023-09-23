-- setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
require("lazy").setup({
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000
    },
    "dracula/vim",
    "preservim/nerdcommenter",
    "tpope/vim-fugitive",
    "nvim-lualine/lualine.nvim",
    "junegunn/fzf",
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        }
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        keys = {
            {
                '<C-d>',
                ":DBUIToggle<cr>",
                mode = 'n',
            }
        },
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    "brookhong/telescope-pathogen.nvim",
    "ryanoasis/vim-devicons",
    "MunifTanjim/nui.nvim",
    "google/executor.nvim",
    "lewis6991/impatient.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "mfussenegger/nvim-dap",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "mfussenegger/nvim-jdtls",
    "mhinz/vim-startify",
    "L3MON4D3/LuaSnip",
    "kkharji/sqlite.lua",
    "nanotee/sqls.nvim",
    "m4xshen/autoclose.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-refactor",
    "windwp/nvim-ts-autotag",
    "ThePrimeagen/harpoon",
    "ThePrimeagen/refactoring.nvim",
    "nvim-telescope/telescope-project.nvim",
    "prochri/telescope-all-recent.nvim",
    "onsails/lspkind.nvim",
    "mbbill/undotree",
    "Pocco81/auto-save.nvim",
    "xiyaowong/transparent.nvim",
    "VonHeikemen/lsp-zero.nvim",
})


--startup time
require('impatient')

vim.cmd([[
set completeopt=menu,menuone,noselect
]])

require('init')
