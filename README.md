
# Mi Configuracion de Neovim para Windows

Antes que nada hay que haver instalacion de la herramienta
de [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=es-co&gl=co), se deberia hacer actualizacion de [PowerShell](https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D?hl=es-ad&gl=ad) y la installacion de [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

Asegurarse si la carpeta `Neovim` en `archivos de programa`  existe de lo contrario crearla. Se debe hacer la instalacion de manejador de paquetes [packer.nvim](https://github.com/wbthomason/packer.nvim)

    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

para poder usar el lsp que ayuda a el auto completado usar 

    scope install zig


clonar este repositorio que contiene los plugins 
se va a agregar en `appdata/local`

    cd "$env:LOCALAPPDATA" & git clone https://github.com/breiner-desing/neovim-config.git nvim

despues de la clonacion entra a la carpeta de `APPDAT/local/neovim`

    nvim "$env:LOCALAPPDATA"/nvim

al entrar tienes que colocar `:PackerSync`, porfavor leer la documentacion de [packer.nvim](https://github.com/wbthomason/packer.nvim)

con eso deberia ser capaz de utilizarse, si despues de eso no vez reflejado el cambio ejecuta los siguientes comandos

    New-Item -ItemType SymbolicLink -Path "$env:PROGRAMFILES\Neovim\bin\lua\lua" -Target "$env:LOCALAPPDATA\nvim\lua"




