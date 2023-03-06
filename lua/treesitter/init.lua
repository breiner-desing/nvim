require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "lua", "json", "python", "typescript", "java", "markdown" },--{ "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "java", "yaml", "markdown", "markdown_inline" }
		sync_install = true,
  auto_install = false,

		highlight = {
  		enable = true, -- false will disable the whole extension
	   additional_vim_regex_highlighting = false
	}
}
