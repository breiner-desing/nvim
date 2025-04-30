-- lua/breiner/lsp/init.lua
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jdtls",        -- Java
        "vtsls",     -- TypeScript / JS / Angular / React
        "pyright",      -- Python
        "lua_ls",       -- Lua 
    }
})

local lspconfig = require("lspconfig")

require("breiner.lsp.ts")
require("breiner.lsp.python")
require("breiner.lsp.lua_ls")
