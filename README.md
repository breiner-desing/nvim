
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

## Atajos de Teclado

| Función                          | Atajo de Teclado                |
|----------------------------------|---------------------------------|
| Mover ventana hacia la izquierda | `<`                             |
| Mover ventana hacia la derecha   | `>`                             |
| Alternar `nvim-tree`             | `<C-b>`                         |
| Guardar archivo                  | `<leader>s`, `<C-s>`            |
| Deshacer cambios en modo insert  | `<C-z>`                         |
| Rehacer cambios en modo insert   | `<C-R>`                         |
| Ir a la definición               | `gd`                            |
| Ir a la declaración              | `gD`                            |
| Mostrar ventana informativa      | `<leader>k`                     |
| Ir a la implementación           | `gi`                            |
| Mostrar ayuda de firma           | `<leader>ck`                    |
| Agregar carpeta al espacio de trabajo | `<leader>wa`               |
| Eliminar carpeta del espacio de trabajo | `<leader>wr`             |
| Listar carpetas del espacio de trabajo | `<leader>wl`             |
| Mostrar definición del tipo      | `<leader>D`                     |
| Renombrar símbolo                | `<leader>rn`                    |
| Listar referencias               | `gr`                            |
| Mostrar información del error    | `<space>e`                      |
| Ir al error anterior             | `[d`                            |
| Ir al siguiente error            | `]d`                            |
| Abrir lista de diagnósticos      | `<space>q`                      |
| Formatear código                 | `<leader>cf`                    |

### Mapeos de Java

| Función                          | Atajo de Teclado                |
|----------------------------------|---------------------------------|
| Organizar importaciones          | `<C-a>`                         |
| Ejecutar prueba de clase         | `<leader>dt`                    |
| Ejecutar prueba del método más cercano | `<leader>dn`             |
| Extraer variable (modo visual)   | `<leader>de`                    |
| Extraer variable                 | `<leader>de`                    |
| Extraer método (modo visual)     | `<leader>dm`                    |
| Ejecutar `Spring Boot`           | `<F9>`                          |
| Ejecutar `Spring Boot` con depuración | `<F10>`                   |
| Adjuntar al depurador            | `<leader>da`                    |
| Alternar punto de interrupción   | `<leader>b>`                    |
| Establecer punto de interrupción con condición | `<leader>B>`     |
| Establecer punto de interrupción con registro | `<leader>bl>`     |
| Abrir REPL de depuración         | `<leader>dr>`                   |
| Mostrar alcances centrados de DAP | `gs`                           |
| Continuar en depuración          | `<F5>`                          |
| Paso por encima en depuración    | `<F8>`                          |
| Paso dentro en depuración        | `<F7>`                          |
| Paso fuera en depuración         | `<S-F8>`                        |

### Buffer

| Función                          | Atajo de Teclado                |
|----------------------------------|---------------------------------|
| Navegar entre buffers            | `<leader>1` a `<leader>9`       |
| Siguiente buffer                 | `[b`                            |
| Buffer anterior                  | `b]`                            |
| Mover buffer hacia la derecha    | `<A-S-l>`                       |
| Mover buffer hacia la izquierda  | `<A-S-h>`                       |

### Terminal

| Función                          | Atajo de Teclado                |
|----------------------------------|---------------------------------|
| Abrir terminal en split abajo    | `<leader>tJ`                    |
| Abrir terminal en split a la derecha | `<leader>tL`               |
| Abrir terminal flotante          | `<leader>ft`                    |
| Buscar y abrir archivo `terminal.lua` | `<leader>rr`              |

### Telescope

| Función                          | Atajo de Teclado                |
|----------------------------------|---------------------------------|
| Buscar archivos                  | `bs`                            |
| Buscar texto en el proyecto      | `<leader>g`                     |
| Listar buffers                   | `<leader>d`                     |
| Listar etiquetas de ayuda        | `<leader>bh`                    |
| Buscar commits                   | `bc`                            |
| Buscar ramas                     | `br`                            |
| Estado de Git                    | `<leader>bst`                   |
