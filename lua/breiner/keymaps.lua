local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)
vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

map("n", "<leader>f", function() vim.lsp.buf.format() end, { noremap = true, silent = true, desc = "Formatear archivo" })
map("n", "<leader>w", ":w<CR>", opts)

map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

map("n", "<leader>d", "yyp", opts)
map("v", "<leader>d", "y'>p", opts)
map("v", "<leader>dd", "y'>pgv", opts)


-- Atajos relacionados a Trouble
map("n", "<leader>xx", function()
    require("trouble").toggle()
  end, { desc = "Toggle Trouble", noremap = true, silent = true })
  
  map("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
  end, { desc = "Workspace Diagnostics", noremap = true, silent = true })
  
  map("n", "<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
  end, { desc = "Document Diagnostics", noremap = true, silent = true })
  
  -- Atajo para acciones de LSP (como generar getters y setters)
  map("n", "<leader>gs", function()
    vim.lsp.buf.code_action()
  end, { desc = "Generar Getters y Setters", noremap = true, silent = true })
  