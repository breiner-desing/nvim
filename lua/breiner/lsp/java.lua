local home = os.getenv("HOME")
local mason_registry = require("mason-registry")

local bundles = {}

-- Java test
local java_test_path = mason_registry.get_package("java-test"):get_install_path()
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

-- Java debug
local java_debug_path = mason_registry.get_package("java-debug-adapter"):get_install_path()
vim.list_extend(bundles, vim.split(vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n"))

-- Workspace
local root_dir = require("jdtls.setup").find_root({ "mvnw", "gradlew", ".git" })
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- JDTLS path
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_dir = jdtls_path .. "/config_linux"

-- Opcional: lombok
local lombok_path = jdtls_path .. "/lombok.jar"

-- LSP config
local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. lombok_path,
    "-jar", jar,
    "-configuration", config_dir,
    "-data", workspace_folder
  },
  root_dir = root_dir,
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      inlayHints = {
        parameterNames = {
          enabled = "all"
        }
      },
      signatureHelp = { enabled = true },
    }
  },
  on_attach = function(client, bufnr)
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.java" },
      callback = function()
        pcall(vim.lsp.codelens.refresh)
      end
    })
  end,
}

-- Mostrar los bundles cargados en un mensaje
vim.notify("JDTLS: Se encontraron " .. tostring(#bundles) .. " bundles", vim.log.levels.INFO)

-- Verificar que estamos en un proyecto válido (tiene root_dir)
if not root_dir or root_dir == "" then
  vim.notify("JDTLS: No se pudo determinar el directorio raíz del proyecto (mvnw, gradlew o .git)", vim.log.levels.ERROR)
  return
end

-- Iniciar el cliente LSP
require("jdtls").start_or_attach(config)

