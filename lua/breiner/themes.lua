local themes = {
  catppuccin = "catppuccin",
  tokyonight = "tokyonight",
  gruvbox = "gruvbox",
  onedark = "onedark",
}

vim.api.nvim_create_user_command("Theme", function(opts)
  local theme = opts.args
  if themes[theme] then
    vim.cmd("colorscheme " .. themes[theme])
    vim.notify("🌈 Tema cambiado a: " .. themes[theme], vim.log.levels.INFO)
  else
    vim.notify("❌ Tema no válido. Usa uno de: " .. table.concat(vim.tbl_keys(themes), ", "), vim.log.levels.ERROR)
  end
end, {
  nargs = 1,
  complete = function()
    return vim.tbl_keys(themes)
  end
})

-- Tema inicial
vim.cmd("colorscheme onedark")
