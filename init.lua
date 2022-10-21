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
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'mfussenegger/nvim-jdtls'
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
vim.cmd([[
colorscheme gruvbox
highlight! link CmpItemAbbr Fg
highlight! link CmpItemAbbrMatch orange 
highlight! link CmpItemAbbrMatchFuzzy orange 
highlight! link CmpItemAbbrDeprecated Fg
highlight! link CmpItemMenu Fg
highlight! link CmpItemKind Yellow
highlight! link CmpItemKindText Fg
highlight! link CmpItemKindMethod Green
highlight! link CmpItemKindFunction Green
highlight! link CmpItemKindConstructor Green
highlight! link CmpItemKindField Green
highlight! link CmpItemKindVariable Blue
highlight! link CmpItemKindClass Yellow
highlight! link CmpItemKindInterface Yellow
highlight! link CmpItemKindModule Yellow
highlight! link CmpItemKindProperty Blue
highlight! link CmpItemKindUnit Purple
highlight! link CmpItemKindValue Purple
highlight! link CmpItemKindEnum Yellow
highlight! link CmpItemKindKeyword Red
highlight! link CmpItemKindSnippet Aqua
highlight! link CmpItemKindColor Aqua
highlight! link CmpItemKindFile Aqua
highlight! link CmpItemKindReference Blue
highlight! link CmpItemKindFolder Aqua
highlight! link CmpItemKindEnumMember Blue
highlight! link CmpItemKindConstant Blue
highlight! link CmpItemKindStruct Yellow
highlight! link CmpItemKindEvent Orange
highlight! link CmpItemKindOperator Orange
highlight! link CmpItemKindTypeParameter Yellow
]])

require('custom-gruvbox')

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- Cmp = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    view = {
        entries = "custom"
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})


-- Set up lspconfig.
CAPABILITIES = require('cmp_nvim_lsp').default_capabilities()

--Starting Language servers
require("mason").setup({
    log_level = vim.log.levels.DEBUG
})
require("mason-lspconfig").setup({
    ensure_installed = {"sumneko_lua"}
})




