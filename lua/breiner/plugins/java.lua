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

        local Terminal = require("toggleterm.terminal").Terminal

        -- 🧠 Función para detectar el paquete actual desde la línea `package ...;`
        local function detectar_paquete_actual()
            for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
                local paquete = line:match("^%s*package%s+([%w%.]+)%s*;")
                if paquete then return paquete end
            end
            return nil
        end

        -- 🚀 Comando para ejecutar la clase Java actual en la terminal flotante
        vim.api.nvim_create_user_command("JavaRunInTerm", function()
            local class = vim.fn.expand("%:t:r") -- nombre de la clase (sin .java)
            local package = detectar_paquete_actual()
            if not package then
                vim.notify("❌ No se encontró el paquete en el archivo.", vim.log.levels.ERROR)
                return
            end

            local fqcn = package .. "." .. class
            local java_cmd = "java -cp target/classes " .. fqcn .. "; read"

            Terminal:new({ cmd = java_cmd, hidden = false, direction = "horizontal" }):toggle()
        end, {})


        -- 🚀 Aquí abajo ya puedes poner tus Keymaps sin problema
        local map = vim.keymap.set

        -- Test Runner
        map("n", "<leader>tm", "<cmd>JavaTestRunCurrentMethod<CR>", { desc = "Probar método actual" })
        map("n", "<leader>tc", "<cmd>JavaTestRunCurrentClass<CR>", { desc = "Probar clase actual" })
        map("n", "<leader>dm", "<cmd>JavaTestDebugCurrentMethod<CR>", { desc = "Debug método actual" })
        map("n", "<leader>dc", "<cmd>JavaTestDebugCurrentClass<CR>", { desc = "Debug clase actual" })

        -- Ejecutar Aplicación
        map("n", "<leader>rm", "<cmd>JavaRunInTerm<CR>", { desc = "Ejecutar Java Main en Terminal Horizontal" })

        -- Refactorizaciones
        map("n", "<leader>gs", vim.lsp.buf.code_action, { desc = "Organizar imports" })
        map("n", "<leader>ev", "<cmd>JavaRefactorExtractVariable<CR>", { desc = "Extraer Variable" })
        map("v", "<leader>em", "<cmd>JavaRefactorExtractMethod<CR>", { desc = "Extraer Método" })

        -- Configuración
        map("n", "<leader>cf", "<cmd>JavaSettingsChangeRuntime<CR>", { desc = "Cambiar Runtime" })

        -- Resultados de Test
        map("n", "<leader>rt", "<cmd>JavaTestViewLastReport<CR>", { desc = "Ver último reporte de Test" })

        -- Formatear archivo
        map("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
        end, { desc = "Formatear clase" })

        vim.keymap.set("n", "K", function()
            require("dap.ui.widgets").hover()
        end, { desc = "Mostrar valor de variable (DAP)" })

    end,
}
