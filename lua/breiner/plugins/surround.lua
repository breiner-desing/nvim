return {
    "kylechui/nvim-surround",
    event = "VeryLazy", -- Se carga cuando Neovim ya está inicializado
    config = function()
      require("nvim-surround").setup({
        -- Puedes dejarlo vacío o configurar más adelante
        -- Por ahora usamos los valores predeterminados
      })
    end,
  }
  