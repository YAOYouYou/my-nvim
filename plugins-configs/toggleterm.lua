local status, toggleterm = pcall(require, "toggleterm")
if not status then
	---@diagnostic disable-next-line: param-type-mismatch
	vim.notify("没有找到 toggleterm", "error")
	return
end
-- local Term = require("toggleterm.terminal")
-- local Terminal = Term.Terminal

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.35
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.3
		end
	end,
	start_in_insert = true,
	persist_size = false,
	highlights = {
		FloatBorder = {
			link = "FloatBorder",
		},
		NormalFloat = {
			link = "Normal",
		},
	},
})

