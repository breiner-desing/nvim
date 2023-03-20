local basico = {}

function basico.mapbasico()

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

end

return basico
