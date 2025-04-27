return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  config = function()
    local api = require("nvim-tree.api")
    local Path = require("plenary.path")

    -- 🔍 Detectar package automáticamente
    local function detect_package_from_path(path)
      local package_path = path:match("src/main/java/(.-)/[^/]+%.java$")
      if package_path then
        return package_path:gsub("/", ".")
      else
        return "com.tuempresa"
      end
    end

    -- 📄 Crear plantillas para Java
    local function create_java_template(kind)
      local templates = {
        Class = function(name, package)
          return string.format([[
package %s;

public class %s {

}
]], package, name)
        end,

        Interface = function(name, package)
          return string.format([[
package %s;

public interface %s {

}
]], package, name)
        end,

        Enum = function(name, package)
          return string.format([[
package %s;

public enum %s {

}
]], package, name)
        end,

        Record = function(name, package)
          return string.format([[
package %s;

public record %s() {

}
]], package, name)
        end,
      }

      return templates[kind]
    end

    -- 📦 Crear nuevo archivo Java
    local function new_java_file()
      local kinds = { "Class", "Interface", "Enum", "Record" }
      vim.ui.select(kinds, { prompt = "Nuevo archivo Java:" }, function(kind)
        if not kind then return end
        vim.ui.input({ prompt = kind .. " name:" }, function(input)
          if not input or input == "" then return end

          local node = api.tree.get_node_under_cursor()
          local parent_path = node and node.absolute_path or vim.fn.getcwd()

          if not Path:new(parent_path):is_dir() then
            parent_path = Path:new(parent_path):parent().filename
          end

          local filename = parent_path .. "/" .. input .. ".java"
          local package_name = detect_package_from_path(filename)

          local file = Path:new(filename)
          file:write(create_java_template(kind)(input, package_name), "w")

          vim.cmd("edit " .. filename)
        end)
      end)
    end

    -- 🛠️ Configuración de NvimTree
    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    -- ⌨️ Atajos dentro de config
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
    vim.keymap.set("n", "<leader><Tab>", ":NvimTreeFocus<CR>", { desc = "Enfocar NvimTree" })
    vim.keymap.set("n", "<leader>j", new_java_file, { desc = "Nuevo archivo Java desde plantilla" })
    vim.keymap.set("n", "<leader>n", function() api.fs.create() end, { desc = "Crear archivo o carpeta" })
    vim.keymap.set("n", "<leader>r", function() api.fs.rename() end, { desc = "Renombrar archivo o carpeta" })
    vim.keymap.set("n", "<leader>d", function() api.fs.remove() end, { desc = "Eliminar archivo o carpeta" })
    vim.keymap.set("n", "<leader>c", function() api.fs.copy.node() end, { desc = "Copiar archivo o carpeta" })
    vim.keymap.set("n", "<leader>x", function() api.fs.cut() end, { desc = "Cortar archivo o carpeta" })
    vim.keymap.set("n", "<leader>v", function() api.fs.paste() end, { desc = "Pegar archivo o carpeta" })
    vim.keymap.set("n", "<leader>m", function() api.mark.toggle() end, { desc = "Marcar/Desmarcar archivo" })
    vim.keymap.set("n", "<leader>M", function() api.marks.bulk.move() end, { desc = "Mover archivos marcados" })
    vim.keymap.set("n", "<leader>tt", function() api.node.open.tab() end, { desc = "Abrir archivo en nueva pestaña" })
    vim.keymap.set("n", "<leader>cr", function() api.tree.change_root_to_node() end,
    { desc = "Cambiar raíz al directorio seleccionado" })
  end,
}
