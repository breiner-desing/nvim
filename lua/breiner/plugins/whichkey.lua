return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Se carga de forma perezosa
  config = function()
    require("which-key").setup({
      -- Puedes configurar visualmente spacing, ventanas, etc.
    })

    require("which-key").register({
      ["<leader>"] = {
        x = { name = "+Trouble" },     -- <leader>x*
        g = { name = "+Git" },          -- <leader>g*
        r = { name = "+Replace" },      -- <leader>r*
        m = { name = "+Minimap" },      -- <leader>m*
        d = { name = "+DAP Debugging" },-- <leader>d*
        t = { name = "+Terminal" },     -- <leader>t*
        f = { name = "+Find (Telescope)" }, -- <leader>f*
      },
    })
  end,
}
