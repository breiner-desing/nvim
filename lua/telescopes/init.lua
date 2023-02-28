require("telescope").setup{
defaults = {
				file_ignore_patterns = {
								"./node_modules/*",
								"node_modules",
								"^node_modules/*",
								"node_modules/*",
				        "./.git/*",
				        ".git",
				        ".git/*"}
				}
}
