local keymap = {}

local nmap = vim.keymap
local builtin = require('telescope.builtin')

function map( estado, atajo, comando)
  nmap.set(estado, atajo, comando)
end

-- General
map('n','<C-s>', '<cmd>write<cr>') -- { desc = 'guardar' }
map('n', '<C-b>', '<cmd>NvimTreeToggle<cr>') -- { desc = 'desplegar menu' }
map('i','<C-z>','<cmd>:u <CR>') -- { desc = 'descartar cambios' } 
map('i','<C-R>','<cmd>:r <CR>') -- { desc = 'descartar cambios' } 

-- Telescope
map('n', '<C-p>', builtin.find_files) -- { desc = 'buscador de archivos' }
map('n', '<C-g>', builtin.live_grep)  -- { desc = 'Buscador de palabras' }
map('n', '<C-d>', builtin.buffers)  -- { desc = 'Buscador cambios git' }
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- java 
function keymap.map_java()  

  map('n', '<C-a>', ":lua require'jdtls'.organize_imports() <CR>")  -- { desc = 'traer importaciones' }

end


return keymap
