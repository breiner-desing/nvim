local jdtls_ok, lua_ls = pcall(require, "lua_ls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall lua-language-server`"
  return
end

--local root_markers = {".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"}
lua_ls.setup()
--if root_dir == "" then
--  return
--encoding
--
--local config = {
  -- The command that starts the language server
--  cmd = { 'lua-language-server' },
--  filetypes = { 'lua' }
--}

--require("lua_ls").start_or_attach(config)
