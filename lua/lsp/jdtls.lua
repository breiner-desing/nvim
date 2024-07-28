local map = function(estado, atajo, comando)
    vim.keymap.set(estado, atajo, comando, { noremap = true, silent = true })
end

local home = os.getenv('HOME')
local jdtls_dir = home .. '/jdtls'
local jdtls_installed = vim.fn.isdirectory(jdtls_dir) == 1

if not jdtls_installed then
    vim.fn.system({
        'bash', '-c', [[
      mkdir -p ]] .. jdtls_dir .. [[ &&
      cd ]] .. jdtls_dir .. [[ &&
      curl -LO http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz &&
      tar -xvzf jdt-language-server-latest.tar.gz
    ]]
    })
end

local lspconfig = require('lspconfig')

local function on_attach(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- Configuración de atajos de teclado para LSP
    map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

    -- Configuración de comandos autocompletado y otros
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
    end
end

local workspace_dir = home .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

lspconfig.jdtls.setup {
    cmd = { jdtls_dir .. '/jdtls.sh', workspace_dir },
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
            },
        },
    },
    init_options = {
        bundles = {}
    },
}

-- Configuración de nvim-dap
local dap = require('dap')

dap.adapters.java = function(callback, config)
    local jdtls_path = vim.fn.expand(jdtls_dir .. '/config_linux/eclipse.jdt.ls_*.jar')
    callback({
        type = 'server',
        host = '127.0.0.1',
        port = 8000,
        executable = {
            command = 'java',
            args = {
                '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,quiet=y,address=*:8000',
                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-Xms1g',
                '-Xmx2G',
                '-jar', jdtls_path,
                '-configuration', jdtls_dir .. '/config_linux',
                '-data', workspace_dir
            },
        },
    })
end

dap.configurations.java = {
    {
        type = 'java',
        request = 'launch',
        name = "Launch Java",
        mainClass = function()
            return vim.fn.input('Path to Main class > ', '', 'file')
        end,
        projectName = function()
            return vim.fn.input('Path to project > ', '', 'file')
        end,
        args = function()
            return vim.fn.input('Program arguments > ')
        end,
    },
}

-- Configuración de nvim-dap-ui
require("dapui").setup()

-- Integrar nvim-dap con nvim-jdtls
local dap, dapui = require('dap'), require('dapui')
require('jdtls').setup_dap({ hotcodereplace = 'auto' })

-- Opcional: Configuración de atajos de teclado para nvim-dap
map('n', '<leader>dd', '<cmd>lua require"dapui".toggle()<CR>')
map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>')
map('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>')
map('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>')
map('n', '<leader>du', '<cmd>lua require"dap".step_out()<CR>')

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
