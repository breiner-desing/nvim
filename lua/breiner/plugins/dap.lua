return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
     local dapui = require("dapui")

     -- 🖥️ UI de DAP
    dapui.setup()

    -- 🔴 Personalizar Breakpoints visualmente
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticError', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '➔', texthl = 'DiagnosticWarn', linehl = 'Visual', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '✖', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })

    -- ⌨️ Atajos de teclado para debuggear
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continuar (F5)" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over (F10)" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into (F11)" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out (F12)" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Condición para breakpoint: "))
    end, { desc = "Breakpoint condicional" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

    -- 🔥 Auto abrir/cerrar el DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- 🧩 Adaptador Java JDWP
    dap.adapters.java = function(callback)
      callback({
        type = "server",
        host = "127.0.0.1",
        port = 5005,
      })
    end

    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Attach JDWP",
        hostName = "127.0.0.1",
        port = 5005,
      },
    }
  end,
}
