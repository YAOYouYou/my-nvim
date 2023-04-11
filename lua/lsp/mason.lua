require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

local servers =require("lsp.servers") 

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

