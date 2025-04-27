return {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" }, -- Cargarlo automáticamente cuando abras un archivo
    config = function()
      require("Comment").setup({
        -- Opciones básicas
        padding = true, -- espacio entre comentario y línea
        sticky = true,  -- cursor se queda en la misma posición
        ignore = nil,   -- puedes ignorar líneas vacías si quieres
  
        -- Mappings por defecto
        mappings = {
          basic = true, -- habilita gc, gcc, etc.
          extra = true, -- habilita gco, gcO, gcA
        },
  
        -- Puedes definir tu propio hook si quieres
        pre_hook = nil,
        post_hook = nil,
      })
    end,
  }
  