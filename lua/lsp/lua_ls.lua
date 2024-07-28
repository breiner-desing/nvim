local lspconfig = require('lspconfig')

local lua_ls_ok, lua_ls = pcall(require, "lua_ls")
if not lua_ls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall lua-language-server`"
  return
end

lua_ls.setup()
