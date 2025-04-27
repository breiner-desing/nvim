return {
  "akinsho/toggleterm.nvim",
  version = "*", -- siempre usar última versión estable
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<leader>t]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      direction = "horizontal",
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    })

    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle Terminal Horizontal" })

    vim.keymap.set("n", "<leader>tf", function()
      require("toggleterm.terminal").Terminal:new({ direction = "float" }):toggle()
    end, { desc = "Toggle Terminal Flotante" })
  end,
}
