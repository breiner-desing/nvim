local basico = {}

local buf = vim.lsp.buf

function map( estado, atajo, comando)
  vim.keymap.set(estado, atajo, comando)
end


function basico.mapbasico()

  map('n', '<', ':wincmd < <CR>') -- {  }
  map('n', '>', ':wincmd > <CR>') -- {  }

  -- atajos para nvim-tree.api 
		map('n', '<C-b>', function() require 'nvim-tree.api'.tree.toggle() end )

		map({'i','n'},'<leader>s', '<cmd>write<cr>') -- { desc = 'guardar' }
  map('n','<C-s>', '<cmd>write<cr>') -- { desc = 'guardar' }
  map('i','<C-z>','<cmd>:u <CR>') -- { desc = 'descartar cambios' } 
  map('i','<C-R>','<cmd>:r <CR>') -- { desc = 'descartar cambios' } 

		map('n', 'gd', function() buf.definition() end )
  map('n', 'gD', function() buf.declaration() end ) -- {  desc = ''  }
  map('n', '<leader>k', function() buf.hover() end) -- { desc = 'ventana informativa' }  en prueba
  map('n', 'gi', function() buf.implementation() end) -- { desc = 'ir a la funcion declarada' }
  map('n', '<leader>ck', function() buf.signature_help() end)  -- { desc = 'informacion de la funcion del metodo llamado' }
  map('n', '<leader>wa', function() buf.add_workspace_folder() end) -- { desc = 'agregar espacio de trabajo' } 
  map('n', '<leader>wr', function() buf.remove_workspace_folder() end) -- { desc = 'eliminar carpet de espacio de trabajo' }
  map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')  -- { desc = 'ubicacion proyecto raiz' }
  map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')  -- { renombrar variable }
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>')

		map('n', '<space>e', vim.diagnostic.open_float) -- { desc = 'descripcion del error' }
  map('n', '[d', vim.diagnostic.goto_prev) -- { desc = 'error anterior' }
  map('n', ']d', vim.diagnostic.goto_next) -- { desc = 'siguiente error' }
  map('n', '<space>q', vim.diagnostic.setloclist)

  map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")

end

return basico

-- `gcA` - Insert comment to end of the current line and enters INSERT mode 
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment


--*:NvimTreeOpen*

--     Opens the tree. See |nvim-tree.api.tree.open()|
--
--     Calls: `api.tree.open({ path = "<arg>" })`
--
-- *:NvimTreeClose*
--
--     Closes the tree. See |nvim-tree.api.tree.close()|
--
--     Calls: `api.tree.close()`
--
-- *:NvimTreeToggle*
--
--     Open or close the tree. See |nvim-tree.api.tree.toggle()|
--
--     Calls: `api.tree.toggle({ path = "<arg>" })`
--
-- *:NvimTreeFocus*
--
--     Open the tree if it is closed, and then focus on the tree.
--
--     See |nvim-tree.api.tree.toggle()|
--
--     Calls: `api.tree.focus()`
--
-- *:NvimTreeRefresh*
--
--     Refresh the tree. See |nvim-tree.api.tree.reload()|
--
--     Calls: `api.tree.reload()`
--
-- *:NvimTreeFindFile*
--
--     The command will change the cursor in the tree for the current bufname.
--
--     It will also open the leafs of the tree leading to the file in the buffer
--     (if you opened a file with something else than the NvimTree, like `fzf` or
--     `:split`)
--
--     Invoke with a bang `:NvimTreeFindFile!` to update the root.
--
--     See |nvim-tree.api.tree.find_file()|
--
--     Calls: `api.tree.find_file { open = true, update_root = <bang> }`
--
-- *:NvimTreeFindFileToggle*
--
--     close the tree or change the cursor in the tree for the current bufname,
--     similar to combination of |:NvimTreeToggle| and |:NvimTreeFindFile|. Takes an
--     optional path argument.
--
--     Invoke with a bang `:NvimTreeFindFileToggle!` to update the root.
--
--     See |nvim-tree.api.tree.toggle()|
--
--     Calls: `api.tree.toggle { find_file = true, focus = true, path = "<arg>", update_root = <bang> }`
--
-- *:NvimTreeClipboard*
--
--     Print clipboard content for both cut and copy
--
--     See |nvim-tree.api.fs.print_clipboard()|
--
--     Calls: `api.fs.print_clipboard()`
--
-- *:NvimTreeResize*
--
--     Resize the NvimTree window to the given size. Example: `:NvimTreeResize 50`
--     resizes the window to the width of 50. If the size starts with "+" or "-" it
--     adds or removes the given value to the current window width.
--     Example `:NvimTreeResize -20` removes the value 20 from the current width. And
--     `:NvimTreeResize +20` adds the value 20 to the current width.
--
-- *:NvimTreeCollapse*
--
--     Collapses the nvim-tree recursively.
--
--     See |nvim-tree.api.tree.collapse_all()|
--
--     Calls: `api.tree.collapse_all(false)`
--
-- *:NvimTreeCollapseKeepBuffers*
--
--     Collapses the nvim-tree recursively, but keep the directories open, which are
--     used in an open buffer.
--
--     See |nvim-tree.api.tree.collapse_all()|
--
--     Calls: `api.tree.collapse_all(true)`
--
-- *:NvimTreeGenerateOnAttach*
--
--     Creates and opens a new file `/tmp/my_on_attach.lua` containing an
--     |nvim-tree.on_attach| function based on your |nvim-tree.view.mappings|,
--     |nvim-tree.remove_keymaps| as well as the defaults.
--     See https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach


-- Colours
--
--     Syntax highlighting uses g:terminal_color_ from colorschemes, falls back to
--     ugly colors otherwise.
--
-- Git Integration
--
--     Icon indicates when a file is:
--     - ✗  unstaged or folder is dirty
--     - ✓  staged
--     - ★  new file
--     - ✓ ✗ partially staged
--     - ✓ ★ new file staged
--     - ✓ ★ ✗ new file staged and has unstaged modifications
--     - ═  merging
--     - ➜  renamed




