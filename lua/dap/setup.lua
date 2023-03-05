local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({})
dapui.setup({
	-- Expand lines larger than the window
	-- Requires >= 0.7
	-- expand_lines = vim.fn.has("nvim-0.7") == 1,
	-- expand_lines = false,
	-- layouts = {
	-- 	-- {
	-- 	-- 	elements = {
	-- 	-- 		-- Elements can be strings or table with id and size keys.
	-- 	-- 		{ id = "scopes", size = 0.25 },
	-- 	-- 		"breakpoints",
	-- 	-- 		"stacks",
	-- 	-- 		"watches",
	-- 	-- 	},
	-- 	-- 	size = 30, -- 30 columns
	-- 	-- 	position = "right",
	-- 	-- },
	-- 	{
	-- 		elements = {
	-- 			"repl",
	-- 			"console",
	-- 		},
	-- 		size = 0.3, -- 25% of total lines
	-- 		position = "bottom",
	-- 	},
	-- },
	-- floating = {
	-- 	border = "rounded", -- Border style. Can be "single", "double" or "rounded"
	-- },
})

--dap-ui config
--  use nvim-dap events to open and close the windows automatically
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt *dap-extensions*  *dap.repl.open()*   *dap-api*
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({ reset = true })
	vim.cmd("stopinsert")
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close({})
	local repl = dap.repl
	repl.close()
	-- close the remaining windows
	-- vim.api.nvim_command([[exe "normal \<c-w>o"]])
	vim.cmd("stopinsert")
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close({})
	local repl = dap.repl
	repl.close()
	-- vim.api.nvim_command([[exe "normal \<c-w>o"]])
	vim.cmd("stopinsert")
end

vim.fn.sign_define("DapBreakpoint", {
	text = "🚧",
	texthl = "LspDiagnosticsSignError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	-- text = "🤔",
	text = "🧪",
	texthl = "LspDiagnosticsSignInformation",
	linehl = "DiagnosticUnderlineInfo",
	numhl = "LspDiagnosticsSignInformation",
})

vim.fn.sign_define("DapBreakpointRejected", {
	-- text = "😢",
	text = "👀",
	texthl = "LspDiagnosticsSignHint",
	linehl = "",
	numhl = "",
})


require("dap.python-dap")
require("dap.golang-dap")

-- keymap
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_out()<CR>", opts)
vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set(
	"n",
	"<Leader>B",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts
)
vim.keymap.set(
	"n",
	"<Leader>lp",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts
)
vim.keymap.set("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", opts)
