local nmap = vim.keymap

nmap.set('','<C-s>', '<cmd>write<cr>', {desc = 'guardar'})
nmap.set('n', '<C-b>', '<cmd>NvimTreeToggle<cr>', { desc = 'desplegar menu' } )

-- telescope

nmap.set('n', '<C-P>', '<cmd>:Telescope find_files hidden=true <CR>', { desc = 'buscador de archivos' })
nmap.set('n', '<C-T>', '<cmd>:Telescope live_grep <CR>', { desc = 'Buscador de palabras' })


--Coc autocompletado
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

nmap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
nmap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
nmap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
nmap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
nmap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
nmap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
nmap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
nmap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
nmap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
nmap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
