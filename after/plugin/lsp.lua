--Starting Language servers
local lsp = require('lsp-zero').preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- Autoinstall language servers
lsp.ensure_installed({
    "lua_ls",  -- Lua
    "denols",  -- Deno
    "tsserver",-- Typescript
    "sqlls",   -- SQL
    "rust_analyzer", -- Rust
    "yamlls",  --yaml 
    "lemminx", -- xml
    "pyright", -- python
    "marksman",-- Markdown
    "jdtls",   -- Java
    "html",    -- html
    "gopls",   -- Golang
    "dockerls",-- Docker
    "cssls",   -- CSS
    "bashls",  -- bash
    "angularls",-- Angular

})
lsp.setup()


