# 📦 Configuración Neovim Modularizada con Lazy.nvim

## 🔐 Requisitos previos (llave SSH para GitHub)

Algunos plugins requieren estar autenticado con una llave SSH para ser descargados correctamente desde GitHub. Sigue estos pasos antes de abrir Neovim:

1. Asegúrate de tener tu llave SSH:
   ```bash
   ls ~/.ssh/id_ed25519
   ```

2. Agrega la llave al agente SSH:
   ```bash
   ssh-add ~/.ssh/id_ed25519
   ```

3. Verifica la conexión con GitHub:
   ```bash
   ssh -T git@github.com
   ```

4. Consulta la documentación oficial para más detalles:
   👉 https://docs.github.com/es/authentication/connecting-to-github-with-ssh

---

## 📂 Estructura de carpetas

```
.config/nvim/
└── lua/
    ├── init.lua           (carga principal)
    └── breiner/
        ├── options.lua        (opciones generales)
        ├── keymaps.lua         (atajos de teclado)
        ├── lazy.lua           (configuración Lazy.nvim)
        ├── plugins/
            ├── cmp.lua
            ├── comment.lua
            ├── dap.lua
            ├── devicons.lua
            ├── dressing.lua
            ├── gitsigns.lua
            ├── indent.lua
            ├── luasnip.lua
            ├── lualine.lua
            ├── minimap.lua
            ├── terminal.lua
            ├── themes.lua
            ├── tree.lua
            ├── treesitter.lua
            ├── trouble.lua
            ├── whichkey.lua
```

## 🌟 Lazy.nvim Plugins (declarados en lazy.lua)

- `nvim-lua/plenary.nvim`
- `nvim-telescope/telescope.nvim`
- `wiliamboman/mason.nvim`
- `neovim/nvim-lspconfig`
- Plugins personalizados importados de `breiner/plugins/`

## ⌨️ Atajos de Teclado Configurados

### Básicos
- `<Space>`: Leader key
- `<leader>w`: Guardar archivo
- `<leader>e`: Abrir/cerrar NvimTree
- `<leader>ff`: Buscar archivos (Telescope)
- `<leader>fg`: Buscar texto (Telescope)
- `<leader>f`: Formatear archivo (LSP)

### Movimiento de líneas y bloques
- `<A-j>` / `<A-k>`: Mover línea o bloque hacia abajo/arriba
- `<leader>d`: Duplicar línea o bloque
- `<leader>dd`: Duplicar bloque y mantener selección

### Trouble.nvim
- `<leader>xx`: Abrir/Cerrar Trouble general
- `<leader>xw`: Diagnósticos del workspace
- `<leader>xd`: Diagnósticos del documento actual

### GitSigns.nvim
- `<leader>gu`: Revertir cambio (hunk)
- `<leader>gU`: Revertir todos los cambios del archivo

### Debugging (DAP)
- `<F5>`: Continuar ejecución
- `<F10>`: Step Over
- `<F11>`: Step Into
- `<F12>`: Step Out
- `<leader>b`: Toggle breakpoint
- `<leader>B`: Breakpoint condicional
- `<leader>du`: Toggle interfaz de DAP UI

### Terminal (Toggleterm)
- `<leader>t`: Abrir terminal horizontal
- `<leader>tf`: Abrir terminal flotante

### Minimap (Codewindow)
- `<leader>mm`: Mostrar/Ocultar minimapa

### LSP
- `<leader>gs`: Ejecutar code action (ej: generar getters/setters)

## 📦 Plugins configurados

- `nvim-cmp`
- `luasnip`
- `nvim-dap`
- `nvim-tree`
- `treesitter`
- `themes`
- `lualine`
- `dressing`
- `codewindow`
- `indent-blankline`
- `comment.nvim`
- `trouble.nvim`
- `which-key.nvim`
- `gitsigns`

## 🚀 Estado Actual

Configuración modularizada, optimizada para Neovim con Lazy.nvim.

---
❤️ Configuración creada por Breiner + ChatGPT 🚀
