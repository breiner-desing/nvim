
# Mi Configuración de Neovim para Windows

Antes que nada hay que hacer la instalación de la herramienta
de [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=es-co&gl=co), se debería hacer la actualización de [PowerShell](https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D?hl=es-ad&gl=ad) y la instalación de [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

Asegurarse de que la carpeta `Neovim` en `Archivos de programa` exista, de lo contrario crearla. Se debe hacer la instalación del manejador de paquetes [packer.nvim](https://github.com/wbthomason/packer.nvim):

```sh
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

Para poder usar el LSP que ayuda al autocompletado usar:

```sh
scoop install zig
```

Clonar este repositorio que contiene los plugins. Se va a agregar en `APPDATA/local`:

```sh
cd "$env:LOCALAPPDATA" & git clone https://github.com/breiner-desing/neovim-config.git nvim
```

Después de la clonación, entra a la carpeta de `APPDATA/local/neovim`:

```sh
nvim "$env:LOCALAPPDATA"/nvim
```

Al entrar tienes que colocar `:PackerSync`, por favor leer la documentación de [packer.nvim](https://github.com/wbthomason/packer.nvim).

Con eso debería ser capaz de utilizarse, si después de eso no ves reflejado el cambio, ejecuta los siguientes comandos:

```sh
New-Item -ItemType SymbolicLink -Path "$env:PROGRAMFILES\Neovim\bin\lua\lua" -Target "$env:LOCALAPPDATA\nvim\lua"
```

# Neovim Keybindings

| Mode     | Key Binding                | Action                                                     |
|----------|----------------------------|------------------------------------------------------------|
| Normal   | `<leader>1`                | Go to buffer 1                                             |
| Normal   | `<leader>2`                | Go to buffer 2                                             |
| Normal   | `<leader>3`                | Go to buffer 3                                             |
| Normal   | `<leader>4`                | Go to buffer 4                                             |
| Normal   | `<leader>5`                | Go to buffer 5                                             |
| Normal   | `<leader>6`                | Go to buffer 6                                             |
| Normal   | `<leader>7`                | Go to buffer 7                                             |
| Normal   | `<leader>8`                | Go to buffer 8                                             |
| Normal   | `<leader>9`                | Go to buffer 9                                             |
| Normal   | `[b`                       | Cycle to next buffer                                       |
| Normal   | `b]`                       | Cycle to previous buffer                                   |
| Normal   | `<A-S-l>`                  | Move buffer to next position                               |
| Normal   | `<A-S-h>`                  | Move buffer to previous position                           |
| Normal   | `<`                        | Move window to the left                                    |
| Normal   | `>`                        | Move window to the right                                   |
| Normal   | `<C-b>`                    | Toggle Nvim Tree                                           |
| Insert   | `<leader>s`                | Save file                                                  |
| Normal   | `<leader>s`                | Save file                                                  |
| Insert   | `<C-s>`                    | Save file                                                  |
| Insert   | `<C-z>`                    | Undo changes                                               |
| Insert   | `<C-R>`                    | Redo changes                                               |
| Normal   | `gd`                       | Go to definition                                           |
| Normal   | `gD`                       | Go to declaration                                          |
| Normal   | `<leader>k`                | Show hover documentation                                   |
| Normal   | `gi`                       | Go to implementation                                       |
| Normal   | `<leader>ck`               | Show signature help                                        |
| Normal   | `<leader>wa`               | Add workspace folder                                       |
| Normal   | `<leader>wr`               | Remove workspace folder                                    |
| Normal   | `<leader>wl`               | List workspace folders                                     |
| Normal   | `<leader>D`                | Go to type definition                                      |
| Normal   | `<leader>rn`               | Rename                                                     |
| Normal   | `gr`                       | Show references and open quickfix window                   |
| Normal   | `<space>e`                 | Show line diagnostics                                      |
| Normal   | `[d`                       | Go to previous diagnostic                                  |
| Normal   | `]d`                       | Go to next diagnostic                                      |
| Normal   | `<space>q`                 | Set location list                                          |
| Normal   | `<leader>cf`               | Format buffer                                              |
| Normal   | `<leader>hs`               | Stage hunk                                                 |
| Normal   | `<leader>hr`               | Reset hunk                                                 |
| Visual   | `<leader>hs`               | Stage hunk (selected)                                      |
| Visual   | `<leader>hr`               | Reset hunk (selected)                                      |
| Normal   | `<leader>hS`               | Stage buffer                                               |
| Normal   | `<leader>hu`               | Undo stage hunk                                            |
| Normal   | `<leader>hR`               | Reset buffer                                               |
| Normal   | `<leader>hp`               | Preview hunk                                               |
| Normal   | `<leader>hb`               | Blame line                                                 |
| Normal   | `<leader>tb`               | Toggle current line blame                                  |
| Normal   | `<leader>hd`               | Show diff                                                  |
| Normal   | `<leader>hD`               | Show diff (with previous commit)                           |
| Normal   | `<leader>td`               | Toggle deleted lines                                       |
| Operator | `ih`                       | Select hunk                                                |
| Normal   | `<leader>dd`               | Toggle DAP UI                                              |
| Normal   | `<leader>db`               | Toggle breakpoint                                          |
| Normal   | `<leader>dc`               | Continue debugging                                         |
| Normal   | `<leader>di`               | Step into                                                  |
| Normal   | `<leader>do`               | Step over                                                  |
| Normal   | `<leader>du`               | Step out                                                   |
| Normal   | `<leader>ff`               | Find files with Telescope                                  |
| Normal   | `<leader>fg`               | Live grep with Telescope                                   |
| Normal   | `<leader>fb`               | List buffers with Telescope                                |
| Normal   | `<leader>fh`               | Find help tags with Telescope                              |