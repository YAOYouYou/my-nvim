
-- 设置缩进为4个空格，并且关闭自动缩进
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.autoindent = false

-- 开启代码折叠
vim.op_local.foldmethod = "expr"
vim.op_local.foldexpr = "nvim_treesitter#foldexpr()"

-- 在保存文件时自动运行rustfmt命令
vim.api.nvim_command('augroup rust_autocmds')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd BufWritePre *.rs RustFmt')
vim.api.nvim_command('augroup END')
