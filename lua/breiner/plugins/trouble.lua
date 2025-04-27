return {
    "folke/trouble.nvim",
    cmd = "TroubleToggle", -- cargar solo cuando llames Trouble
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- para los iconos bonitos
    config = function()
      require("trouble").setup({})
  
      -- ⌨️ Atajos rápidos
      vim.keymap.set("n", "<leader>xx", function()
        require("trouble").toggle()
      end, { desc = "Toggle Trouble" })
  
      vim.keymap.set("n", "<leader>xw", function()
        require("trouble").toggle("workspace_diagnostics")
      end, { desc = "Workspace Diagnostics (Trouble)" })
  
      vim.keymap.set("n", "<leader>xd", function()
        require("trouble").toggle("document_diagnostics")
      end, { desc = "Document Diagnostics (Trouble)" })
  
      vim.keymap.set("n", "<leader>xr", function()
        require("trouble").toggle("lsp_references")
      end, { desc = "LSP References (Trouble)" })
  
      vim.keymap.set("n", "<leader>xt", function()
        require("trouble").toggle("todo")
      end, { desc = "TODOs en Trouble" })
    end,
  }
  