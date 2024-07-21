vim.o.shell = "pwsh"
require 'plugin'
require 'configbasic'
require 'atajoteclado'
require 'barraestado'
require 'telescopes'
require 'maso'
require 'lzp'
require 'lua-server'
require 'treesitter'
require 'tree'
require 'buffer'
require 'git'

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

require"fidget".setup{}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

require("atajoteclado").mapbasico()
require("atajoteclado").buffer()
require("atajoteclado").map_java()
require("atajoteclado").mapterminales()
