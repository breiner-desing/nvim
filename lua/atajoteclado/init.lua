local keymap = {}

local builtin = require('telescope.builtin')

function map(estado, atajo, comando)
  vim.keymap.set(estado, atajo, comando, { noremap = true, silent = true })
end

-- General
require("atajoteclado.basico").mapbasico()
require("atajoteclado.terminal").mapterminales()

-- Telescope
map('n', 'bs', builtin.find_files)
map('n', '<leader>g', builtin.live_grep)
map('n', '<leader>d', builtin.buffers)
map('n', '<leader>bh', builtin.help_tags)
map('n', 'bc', builtin.git_commits)
map('n', 'br', builtin.git_branches)
map('n', '<leader>bst', builtin.git_status)

-- Java specific mappings
function keymap.map_java()
  map('n', '<C-a>', function() require 'jdtls'.organize_imports() end)
  map("n", "<leader>dt", function() require 'jdtls'.test_class() end)
  map("n", "<leader>dn", function() require 'jdtls'.test_nearest_method() end)
  map("v", "<leader>de", function() require('jdtls').extract_variable(true) end)
  map("n", "<leader>de", function() require('jdtls').extract_variable() end)
  map("v", "<leader>dm", function() require('jdtls').extract_method(true) end)

  map("n", "<F9>", function() require 'atajoteclado.debug-java'.run_spring_boot() end)
  map("n", "<F10>", function() require 'atajoteclado.debug-java'.run_spring_boot(true) end)

  -- Iniciar debug
  map('n', '<leader>da', function() require 'atajoteclado.debug-java'.attach_to_debug() end)

  -- Setup debug
  map('n', '<leader>b', function() require "dap".toggle_breakpoint() end)
  map('n', '<leader>B', function() require "dap".set_breakpoint(vim.fn.input("Condition: ")) end)
  map('n', '<leader>bl', function() require "dap".set_breakpoint(nil, nil, vim.fn.input("Log: ")) end)
  map('n', '<leader>dr', function() require "dap".repl.open() end)

  map('n', 'gs', function() require 'atajoteclado.debug-java'.show_dap_centered_scopes() end)

  -- Move in debug
  map('n', '<F5>', function() require "dap".continue() end)
  map('n', '<F8>', function() require "dap".step_over() end)
  map('n', '<F7>', function() require "dap".step_into() end)
  map('n', '<S-F8>', function() require "dap".step_out() end)
end

-- Buffer mappings
function keymap.buffer()
  for i = 1, 9 do
    map('n', '<leader>' .. i, function() require("bufferline").go_to_buffer(i, true) end)
  end

  map('n', '[b', ':BufferLineCycleNext <CR>')
  map('n', 'b]', ':BufferLineCyclePrev <CR>')
  map('n', '<A-S-l>', ':BufferLineMoveNext <CR>')
  map('n', '<A-S-h>', ':BufferLineMovePrev <CR>')
end

return keymap
