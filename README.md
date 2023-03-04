
# Mi Configuracion de Neovim para Windows

Antes que nada hay que hacer instalacion de [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=es-co&gl=co), se deberia hacer actualizacion de [PowerShell](https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D?hl=es-ad&gl=ad) y la installacion de [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim).

Asegurarse si la carpeta `Neovim` en `archivos de programa`  existe de lo contrario crearla.

clonar el repositorio donde tengo mis configuraciones y plugins 
se va a agregar en `appdata/local`

    cd "$env:LOCALAPPDATA" & git clone https://github.com/breiner-desing/neovim-config.git nvim

con eso deberia ser capaz de utilizarse, si despues de eso no vez reflejado el cambio ejecuta los siguientes comandos

    Move-Item -Path "$env:LOCALAPPDATA\nvim\lua" -Destination "$env:PROGRAMFILES/Neovim/bin" # movilizar la carpeta

    New-Item -ItemType SymbolicLink -Path "$env:PROGRAMFILES\Neovim\bin\lua\lua" -Target "$env:LOCALAPPDATA\nvim\lua"




