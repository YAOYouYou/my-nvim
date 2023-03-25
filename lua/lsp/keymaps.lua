-- lsp
return {lsp_keymaps = function(bufnr)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "goto definition" })
	vim.keymap.set('n', 'gD', "<cmd>Lspsaga peek_definition<cr>", { buffer = bufnr, desc = "Peek Definition" })
	vim.keymap.set('n', 'gb', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "goto type_definition" })
	vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = "goto implementation" })
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = bufnr, desc = "hover" })
	vim.keymap.set('n', 'gr', "<cmd>Lspsaga lsp_finder<cr>", { buffer = bufnr, desc = "references" })
	vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = bufnr, desc = "format document" })
	-- TODO： 所选内容格式
	-- vim.keymap.set('v', '<leader>lf', vim.lsp.buf.formatting, {buffer=bufnr, desc="format document"})
	vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = bufnr, desc = "rename" })
	vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { buffer = bufnr, desc = "show diagnostic" })
	vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "signature_help" })
	vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = bufnr, desc = "code action" })
end
}