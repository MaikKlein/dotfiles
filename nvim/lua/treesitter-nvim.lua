local config = require("nvim-treesitter.configs")

config.setup({
	ensure_installed = {
		"javascript",
		"html",
		"css",
		"bash",
		"lua",
		"json",
		"python",
		"rust",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
})
