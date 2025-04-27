return {
  "gorbit99/codewindow.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local codewindow = require("codewindow")

    codewindow.setup({
      auto_enable = true,                        -- Auto mostrar minimap
      exclude_filetypes = { "NvimTree", "toggleterm" }, -- No mostrar en estos tipos de buffer
      minimap_width = 15,
      width_multiplier = 3,
      use_lsp = true,                            -- Resaltar errores desde LSP
      use_git = true,                            -- Mostrar cambios git en el minimap
    })

    -- ⌨️ Atajo para mostrar/ocultar minimap manualmente
    vim.keymap.set("n", "<leader>mm", function()
      codewindow.toggle_minimap()
    end, { desc = "Toggle Minimap" })
  end,
}
