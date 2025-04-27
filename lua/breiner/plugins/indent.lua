return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- muy importante desde v3+
  event = { "BufReadPre", "BufNewFile" }, -- cargarlo solo cuando abras archivos
  config = function()
    require("ibl").setup({
      indent = { char = "┆" }, -- Puedes cambiar a "▏" si prefieres
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      },
      exclude = {
        filetypes = { "help", "terminal", "dashboard", "nvimtree" },
        buftypes = { "terminal" },
      },
    })
  end,
}
