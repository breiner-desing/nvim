local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

-- Load specific LSP configurations
require('lsp.jdtls')
require('lsp.lua_ls')
