local keymap = {}

local builtin = require('telescope.builtin')

function map( estado, atajo, comando)
  vim.keymap.set(estado, atajo, comando)
end

-- General
require("atajoteclado.basico").mapbasico()

-- Telescope
map('n', 'bs', builtin.find_files) -- { desc = 'buscador de archivos' }
map('n', '<leader>g', builtin.live_grep)  -- { desc = 'Buscador de palabras' }
map('n', '<leader>d', builtin.buffers)  -- { desc = 'Buscador cambios git' }
map('n', '<leader>bh', builtin.help_tags)
map('n', 'bc', builtin.git_commits) -- { desc = 'buscar commit' } 
map('n', 'br', builtin.git_branches) -- { desc = 'buscar ramas' } 
map('n', '<leader>bst', builtin.git_status) -- { desc = 'git status' }


-- java 
function keymap.map_java()

  map('n', '<C-a>', function() require'jdtls'.organize_imports() end)  -- { desc = 'traer importaciones' }
  map("n", "<leader>dt", function() require'jdtls'.test_class() end)
  map("n", "<leader>dn", function() require'jdtls'.test_nearest_method() end)
  map("v", "<leader>de", function() require('jdtls').extract_variable(true) end)
  map("n", "<leader>de", function() require('jdtls').extract_variable() end)
  map("v", "<leader>dm", function() require('jdtls').extract_method(true) end)

		map("n", "<F9>", function() require 'atajoteclado.debug-java'.run_spring_boot() end)
  map("n", "<F10>", function() require 'atajoteclado.debug-java'.run_spring_boot(true) end)

		--	iniciar debug	
  map('n', '<leader>da', function() require 'atajoteclado.debug-java'.attach_to_debug() end)

   -- setup debug
  map('n', '<leader>b', function() require"dap".toggle_breakpoint() end)
  map('n', '<leader>B', function() require"dap".set_breakpoint(vim.fn.input("Condition: ")) end)
  map('n', '<leader>bl', function() require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: ")) end)
  map('n', '<leader>dr', function() require"dap".repl.open() end)

  map('n', 'gs',  function() require 'atajoteclado.debug-java'.show_dap_centered_scopes() end)

		 -- move in debug
   map('n', '<F5>', function() require"dap".continue() end)
   map('n', '<F8>', function() require"dap".step_over() end)
   map('n', '<F7>', function() require"dap".step_into() end)
   map('n', '<S-F8>', function() require"dap".step_out() end)

end


function keymap.buffer()

			for i=1,9 do
			   map('n', '<leader>' .. i , function() require("bufferline").go_to_buffer(i, true) end ) -- viajar entre ventanas del 1 al 9
			end

   map('n', '[b', ':BufferLineCycleNext <CR>')
   map('n', 'b]', ':BufferLineCyclePrev <CR>')
   map('n', '<A-S-l>', ':BufferLineMoveNext <CR>')
   map('n', '<A-S-h>', ':BufferLineMovePrev <CR>')
--     nnoremap <silent><mymap> :lua require'bufferline'.move_to(1)<CR>  -- mover a primer lugar
--     nnoremap <silent><mymap> :lua require'bufferline'.move_to(-1)<CR> -- mover a ultimo lugar
--     nnoremap <silent>be :BufferLineSortByExtension<CR>
--     nnoremap <silent>bd :BufferLineSortByDirectory<CR>
--     nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

end


return keymap

