return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "tsx",    -- React
        "html",
        "css",
        "json",
        "java",   -- Java backend
        "yaml",   -- Configuración yml
        "xml",    -- Archivos POM Maven
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true }, -- Auto-indentación mejorada
      playground = {
        enable = true,  -- ✅ ACTIVA el Playground nativo
        updatetime = 25, -- Tiempo de actualización al mover el cursor
        persist_queries = false, -- No guarda las consultas entre sesiones
      },
    })
  end,
}
