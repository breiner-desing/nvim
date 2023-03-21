
require 'plugin'
require 'configbasic'
require 'atajoteclado'
require 'barraestado'
require 'telescopes'
require 'maso'
require 'ftplugin.java'
require 'lzp'
require 'lua-server'
require 'treesitter'
require 'tree'
require 'buffer'


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


--require'lspconfig'.sumneko_lua.setup {}


-- Define la clase CSS DapStoppedLine para la línea donde se encuentra la señal DapStopped
--vim.cmd('highlight DapStoppedLine cterm=bold ctermfg=green guifg=green gui=underline')

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

--vim.fn.sign_define('DapStopped', {text='→', texthl='', linehl='DapStoppedLine', numhl=''})

-- `DapBreakpoint` for breakpoints (default: `B`)
-- `DapBreakpointCondition` for conditional breakpoints (default: `C`)
-- `DapLogPoint` for log points (default: `L`)
-- `DapStopped` to indicate where the debugee is stopped (default: `→`)
-- `DapBreakpointRejected` to indicate breakpoints rejected by the debug


--
--
--proximamente()
--require("config/treesitter/init.lua")
--

-- ===============================================================================
-- MAPPINGS                                                   *gitgutter-mappings*
--
-- You can disable all these mappings with:
--  
--     let g:gitgutter_map_keys = 0
--  
--
-- Hunk operations: 
--
-- These can be repeated with `.` if you have vim-repeat installed.
--
--                                                          *gitgutter-<Leader>hp*
-- <Leader>hp              Preview the hunk under the cursor.
--
--                                                          *gitgutter-<Leader>hs*
-- <Leader>hs              Stage the hunk under the cursor.
--
--                                                          *gitgutter-<Leader>hu*
-- <Leader>hu              Undo the hunk under the cursor.
--
-- You can change these mappings like this:
--  
--     nmap ghp <Plug>(GitGutterPreviewHunk)
--     nmap ghs <Plug>(GitGutterStageHunk)
--     nmap ghu <Plug>(GitGutterUndoHunk)
--  
--
-- Hunk jumping: 
--
--                                                                  *gitgutter-]c*
-- ]c                      Jump to the next [count] hunk.
--
--                                                                  *gitgutter-[c*
-- [c                      Jump to the previous [count] hunk.
--
-- You can change these mappings like this:
--  
--     nmap [c <Plug>(GitGutterPrevHunk)
--     nmap ]c <Plug>(GitGutterNextHunk)
--  
--
-- Hunk text object: 
--
--                           *gitgutter-ic* *gitgutter-ac* *gitgutter-text-object*
-- "ic" operates on the current hunk's lines.  "ac" does the same but also includes
-- trailing empty lines.
--  
--     omap ic <Plug>(GitGutterTextObjectInnerPending)
--     omap ac <Plug>(GitGutterTextObjectOuterPending)
--     xmap ic <Plug>(GitGutterTextObjectInnerVisual)
--     xmap ac <Plug>(GitGutterTextObjectOuterVisual)
--  






