return {
    "nvim-java/nvim-java",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = { "java" },
    config = function()
      -- Setup nvim-java
      require("java").setup()
  
      -- Setup lspconfig para jdtls
      require("lspconfig").jdtls.setup({})
  
      -- 🚀 Aquí abajo ya puedes poner tus Keymaps sin problema
      local map = vim.keymap.set
  
      -- Test Runner
      map("n", "<leader>tm", "<cmd>JavaTestRunCurrentMethod<CR>", { desc = "Probar método actual" })
      map("n", "<leader>tc", "<cmd>JavaTestRunCurrentClass<CR>", { desc = "Probar clase actual" })
      map("n", "<leader>dm", "<cmd>JavaTestDebugCurrentMethod<CR>", { desc = "Debug método actual" })
      map("n", "<leader>dc", "<cmd>JavaTestDebugCurrentClass<CR>", { desc = "Debug clase actual" })
  
      -- Ejecutar Aplicación
      map("n", "<leader>rm", "<cmd>JavaRunnerRunMain<CR>", { desc = "Run Main (Aplicación)" })
  
      -- Refactorizaciones
      map("n", "<leader>im", vim.lsp.buf.code_action, { desc = "Organizar imports" })
      map("n", "<leader>ev", "<cmd>JavaRefactorExtractVariable<CR>", { desc = "Extraer Variable" })
      map("v", "<leader>em", "<cmd>JavaRefactorExtractMethod<CR>", { desc = "Extraer Método" })
  
      -- Configuración
      map("n", "<leader>cf", "<cmd>JavaSettingsChangeRuntime<CR>", { desc = "Cambiar Runtime" })
  
      -- Resultados de Test
      map("n", "<leader>rt", "<cmd>JavaTestViewLastReport<CR>", { desc = "Ver último reporte de Test" })
    end,
  }
  