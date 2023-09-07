--Starting Language servers
local lsp = require('lsp-zero').preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', { buffer = true })
    vim.keymap.set('n', 'gl', '<cmd>Telescope diagnostics<cr>', { buffer = true })
end)

-- (Optional) Configure lua language server for neovim
local nvim_lsp = require('lspconfig')
nvim_lsp.lua_ls.setup(lsp.nvim_lua_ls())

nvim_lsp.denols.setup({
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonrc"),
    single_file_support = true
})
nvim_lsp.tsserver.setup {
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    single_file_support = false
}

-- Configuration for denols
vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
-- Autoinstall language servers
lsp.ensure_installed({
    "lua_ls",        -- Lua
    "denols",        -- Deno
    "tsserver",      -- Typescript
    "sqlls",         -- SQL
    "rust_analyzer", -- Rust
    "yamlls",        --yaml
    "lemminx",       -- xml
    "pyright",       -- python
    "marksman",      -- Markdown
    "jdtls",         -- Java
    "html",          -- html
    "gopls",         -- Golang
    "dockerls",      -- Docker
    "cssls",         -- CSS
    "angularls",     -- Angular
    "beautysh"       -- bash, sh, zsh   

})

lsp.setup()

require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
    },
})
