local map = vim.keymap.set

-- 🔑 Líder y navegación básica
map("n", "<Space>", "", { noremap = true, silent = true })
vim.g.mapleader = " "

-- 📁 Árbol de archivos y búsqueda
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir/cerrar árbol de archivos", noremap = true, silent = true })
-- 💾 Guardar y formatear
map("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo", noremap = true, silent = true })
map("n", "<leader>F", function() vim.lsp.buf.format() end, { desc = "Formatear archivo", noremap = true, silent = true })

-- 🔼🔽 Mover líneas
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Mover línea abajo", noremap = true, silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Mover línea arriba", noremap = true, silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover bloque abajo", noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover bloque arriba", noremap = true, silent = true })

-- 📋 Duplicar línea o bloque
map("n", "<leader>d", "yyp", { desc = "Duplicar línea", noremap = true, silent = true })
map("v", "<leader>d", "y'>p", { desc = "Duplicar bloque", noremap = true, silent = true })
map("v", "<leader>dd", "y'>pgv", { desc = "Duplicar bloque y seleccionar", noremap = true, silent = true })

-- 🧠 Navegación LSP (para todos los lenguajes)
map("n", "gd", vim.lsp.buf.definition, { desc = "Ir a definición", noremap = true, silent = true })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Ir a implementación", noremap = true, silent = true })
map("n", "gr", vim.lsp.buf.references, { desc = "Ver referencias", noremap = true, silent = true })
map("n", "k", vim.lsp.buf.hover, { desc = "Ver información flotante", noremap = true, silent = true })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar símbolo", noremap = true, silent = true })

-- 🛠️ Acciones de código
map("n", "<leader>gs", vim.lsp.buf.code_action, { desc = "Acciones de código (Getters/Setters, etc.)", noremap = true, silent = true })

-- 🚨 Diagnóstico con Trouble
map("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Abrir Trouble", noremap = true, silent = true })
map("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Diagnóstico del workspace", noremap = true, silent = true })
map("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Diagnóstico del documento actual", noremap = true, silent = true })

map("n", "<Tab>", ":bn<CR>", { desc = "Siguiente buffer", noremap = true, silent = true })
map("n", "<S-Tab>", ":bp<CR>", { desc = "Buffer anterior", noremap = true, silent = true })


