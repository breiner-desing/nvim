local map = function(estado, atajo, comando)
  vim.keymap.set(estado, atajo, comando, { noremap = true, silent = true })
end

for i = 1, 9 do
  map('n', '<leader>' .. i, function() require("bufferline").go_to_buffer(i, true) end)
end

map('n', '[b', ':BufferLineCycleNext <CR>')
map('n', 'b]', ':BufferLineCyclePrev <CR>')
map('n', '<A-S-l>', ':BufferLineMoveNext <CR>')
map('n', '<A-S-h>', ':BufferLineMovePrev <CR>')

map('n', '<', ':wincmd < <CR>') -- {  }
map('n', '>', ':wincmd > <CR>') -- {  }

-- atajos para nvim-tree.api
map('n', '<C-b>', function() require 'nvim-tree.api'.tree.toggle() end)

map({ 'i', 'n' }, '<leader>s', '<cmd>write<cr>') -- { desc = 'guardar' }
map('n', '<C-s>', '<cmd>write<cr>')              -- { desc = 'guardar' }
map('i', '<C-z>', '<cmd>:u <CR>')                -- { desc = 'descartar cambios' }
map('i', '<C-R>', '<cmd>:r <CR>')                -- { desc = 'descartar cambios' }

map('n', 'gd', function() vim.lsp.buf.definition() end)
map('n', 'gD', function() vim.lsp.buf.declaration() end)                                        -- {  desc = ''  }
map('n', '<leader>k', function() vim.lsp.buf.hover() end)                                       -- { desc = 'ventana informativa' }  en prueba
map('n', 'gi', function() vim.lsp.buf.implementation() end)                                     -- { desc = 'ir a la funcion declarada' }
map('n', '<leader>ck', function() vim.lsp.buf.signature_help() end)                             -- { desc = 'informacion de la funcion del metodo llamado' }
map('n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end)                       -- { desc = 'agregar espacio de trabajo' }
map('n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end)                    -- { desc = 'eliminar carpet de espacio de trabajo' }
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>') -- { desc = 'ubicacion proyecto raiz' }
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- { renombrar variable }
map('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>')

map('n', '<space>e', vim.diagnostic.open_float) -- { desc = 'descripcion del error' }
map('n', '[d', vim.diagnostic.goto_prev)        -- { desc = 'error anterior' }
map('n', ']d', vim.diagnostic.goto_next)        -- { desc = 'siguiente error' }
map('n', '<space>q', vim.diagnostic.setloclist)

map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")

-- Mappings for telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- Other mappings...

