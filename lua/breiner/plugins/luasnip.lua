return {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Usa una versión estable
    event = "InsertEnter", -- Solo cargar cuando empieces a escribir
    dependencies = {
      "rafamadriz/friendly-snippets", -- Snippets predefinidos para LuaSnip
    },
    config = function()
      local luasnip = require("luasnip")
  
      luasnip.config.set_config({
        history = true, -- Recordar los últimos snippets expandidos
        updateevents = "TextChanged,TextChangedI", -- Actualizar dinámicamente
        enable_autosnippets = true, -- Permitir snippets automáticos
      })
  
      -- 🔥 Carga los snippets tipo VSCode
      require("luasnip.loaders.from_vscode").lazy_load()
  
      -- Opcional: Puedes agregar tu propia carpeta de snippets personalizados
      -- require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
    end,
  }
  