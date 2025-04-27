return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navegar entre cambios
        map("n", "]h", gs.next_hunk, { desc = "Ir al siguiente cambio (hunk)" })
        map("n", "[h", gs.prev_hunk, { desc = "Ir al cambio anterior (hunk)" })

        -- Ver cambios
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Previsualizar cambio (hunk)" })
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Blame de línea actual" })
        map("n", "<leader>gd", gs.diffthis, { desc = "Comparar buffer con Git" })

        -- Stage cambios
        map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage del cambio actual" })
        map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
          { desc = "Stage bloque seleccionado" })
        map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage de todo el buffer" })

        -- Undo stage
        map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Quitar del stage (hunk)" })

        -- Revertir cambios
        map("n", "<leader>gr", gs.reset_hunk, { desc = "Revertir cambio actual" })
        map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
          { desc = "Revertir bloque seleccionado" })
        map("n", "<leader>gR", gs.reset_buffer, { desc = "Revertir todos los cambios del buffer" })

        -- Opcionales
        map("n", "<leader>gL", gs.toggle_linehl, { desc = "Resaltar líneas cambiadas" })
        map("n", "<leader>gW", gs.toggle_word_diff, { desc = "Diferencias por palabra" })
      end,
    })
  end,
}
