--loadfile('configbasic.init')()

require 'lua.configbasic.init'
require 'lua.atajoteclado.init'
require 'lua.plugin.init'
require 'lua.icons.init'
require 'lua.barraestado.init'
require 'lua.telescopes.init'
require 'lua.maso.init'
require 'ftplugin.java'

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

--require("airblade").startup()
--lombok_path
vim.cmd[[colorscheme tokyonight]]

--proximamente
--require("config/treesitter/init.lua")
--
--implementation the COC 
local x = 'Breiner Andres Rojas Angulo'


--local configuracion = {
--"java.configuration.runtimes": [
--  {
--    "name": "JavaSE-1.8",
--    "path": "/path/to/jdk-8",
--  }]
--}
