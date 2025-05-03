return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {

        -- Puedes cambiar estos atajos como quieras
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buscar archivos" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Buscar texto (grep)" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Listar buffers" },
        -- { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Buscar ayuda" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>",   desc = "Archivos recientes" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = { width = 0.9 },
                },
                sorting_strategy = "ascending",
                prompt_prefix = "🔍 ",
            },
            pickers = {
                find_files = {
                    hidden = true, -- también muestra archivos ocultos
                },
            },
        })
    end,
}
