return {
    "stevearc/dressing.nvim",
    event = "VeryLazy", -- Cargar cuando sea necesario (no ralentiza el inicio)
    opts = {
      input = {
        -- Mejoras para vim.ui.input
        enabled = true,
        default_prompt = "➤ ",
        win_options = {
          winblend = 0, -- No hacer transparente (puedes cambiarlo si quieres)
        },
      },
      select = {
        -- Mejoras para vim.ui.select
        enabled = true,
        backend = { "telescope", "fzf_lua", "fzf", "builtin" }, -- Prioridad de backends
        trim_prompt = true,
        builtin = {
          win_options = {
            winblend = 0,
          },
        },
      },
    },
  }
  