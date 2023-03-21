vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4


-- 在保存Go文件时，自动运行gofmt命令格式化代码
vim.api.nvim_command('augroup go_autocmds')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd BufWritePre *.go lua go_fmt()')
vim.api.nvim_command('augroup END')

function go_fmt()
  vim.api.nvim_command('%!goimports')
end
