--loadfile('configbasic.init')()

require 'lua.configbasic.init'
require 'lua.atajoteclado.init'
require 'lua.plugin.init'
require 'lua.icons.init'
require 'lua.barraestado.init'
require 'lua.telescopes.init'

--require("airblade").startup()

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
