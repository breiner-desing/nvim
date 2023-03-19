
require 'configbasic'
require 'atajoteclado'
require 'plugin'
--require 'icons'
require 'barraestado'
require 'telescopes'
require 'maso'
require 'ftplugin.java'
require 'lzp'
require 'lua-server'
require 'treesitter'

local cmp = require('cmp')

cmp.setup({
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
  end
})

cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})





vim.cmd[[colorscheme tokyonight-night]]
--vim.cmd[[colorscheme tokyonight-storm]]
--vim.cmd[[colorscheme tokyonight-day]]
--vim.cmd[[colorscheme tokyonight-moon]]

--proximamente()
--require("config/treesitter/init.lua")
