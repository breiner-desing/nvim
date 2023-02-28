--loadfile('configbasic.init')()

require 'configbasic.init'
require 'atajoteclado.init'
require 'plugin.init'
require 'icons.init'
require 'barraestado.init'
require 'telescopes.init'

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
