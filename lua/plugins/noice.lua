return {
	"folke/noice.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	event = "VimEnter",
	config = function()
		require("noice").setup()
	end,
}
