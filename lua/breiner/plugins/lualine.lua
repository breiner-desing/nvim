return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Para los íconos bonitos en la barra
    event = "VeryLazy", -- Cargarlo sin afectar el arranque
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark", -- Puedes cambiarlo según tu theme activo
          section_separators = "",
          component_separators = "|",
          icons_enabled = true,
        },
      })
    end,
  }
  