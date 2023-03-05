local nmap = vim.keymap
local fn = vim.fn

nmap.set('n','<C-s>', '<cmd>write<cr>', {desc = 'guardar'})
nmap.set('n', '<C-b>', '<cmd>NvimTreeToggle<cr>', { desc = 'desplegar menu' } )


-- telescope

nmap.set('n', '<C-P>', '<cmd>:Telescope find_files hidden=true <CR>', { desc = 'buscador de archivos' })
nmap.set('n', '<C-T>', '<cmd>:Telescope live_grep <CR>', { desc = 'Buscador de palabras' })

vim.opt.signcolumn = "yes"

nmap.set('n', '<C-a>', ":lua require'jdtls'.organize_imports() <CR>")
