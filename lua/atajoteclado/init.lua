local keymap = {}

local nmap = vim.keymap
local builtin = require('telescope.builtin')

function map( estado, atajo, comando)
  nmap.set(estado, atajo, comando)
end

-- General

map('n', '<', ':wincmd < <CR>') -- {  }
map('n', '>', ':wincmd > <CR>') -- {  }

--También puedes ejecutar gt para ir a la siguiente pestaña (con gT vas a la pestaña previa). 
--También puedes pasar un número como argumento a gt, donde el número corresponde al número de la pestaña. 
--Para ir a la tercera pestaña, ejecuta 3gt.

map({'i','n'},'<leader>s', '<cmd>write<cr>') -- { desc = 'guardar' }
map('n','<C-s>', '<cmd>write<cr>') -- { desc = 'guardar' }
--map('n', '<C-b>', '<cmd>:NvimTreeToggle<cr>') -- { desc = 'desplegar menu' }
map('i','<C-z>','<cmd>:u <CR>') -- { desc = 'descartar cambios' } 
map('i','<C-R>','<cmd>:r <CR>') -- { desc = 'descartar cambios' } 
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>') -- {  desc = ''  }
map('n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>') -- { desc = 'ventana informativa' }  en prueba
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>') -- { desc = 'ir a la funcion declarada' }
map('n', '<leader>ck', '<cmd>lua vim.lsp.buf.signature_help()<CR>')  -- { desc = 'informacion de la funcion del metodo llamado' }
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>') -- { desc = 'agregar espacio de trabajo' } 
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>') -- { desc = 'eliminar carpet de espacio de trabajo' }
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')  -- { desc = 'ubicacion proyecto raiz' }
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')  -- { renombrar variable }
map('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>')
map('n', '<space>e', vim.diagnostic.open_float) -- { desc = 'descripcion del error' }
map('n', '[d', vim.diagnostic.goto_prev) -- { desc = 'error anterior' }
map('n', ']d', vim.diagnostic.goto_next) -- { desc = 'siguiente error' }
map('n', '<space>q', vim.diagnostic.setloclist)
--map('n', '<leader>e', '<cmd>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>') -- { desc = 'deprecate' }
--map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')  -- { desc = 'deprecate' }
--map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')  -- { desc = 'deprecate' }
--map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')  -- { desc = 'deprecate' }
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")

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

  map('n', '<C-a>', ":lua require'jdtls'.organize_imports() <CR>")  -- { desc = 'traer importaciones' }
  map("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>")
  map("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
  map("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
  map("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>")
  map("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")

		map("n", "<F9>", function() require 'atajoteclado.debug-java'.run_spring_boot() end)
  map("n", "<F10>", function() require 'atajoteclado.debug-java'.run_spring_boot(true) end)
--		debug()

end


--function debug()

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

--end

function keymap.buffer()

			for i=1,9 do
			   map('n', '<leader>' .. i , function() require("bufferline").go_to_buffer(i, true) end )
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

