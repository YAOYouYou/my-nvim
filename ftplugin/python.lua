-- 设置 tab 宽度为 4
vim.op_local.expandtab = true
vim.op_local.tabstop = 4
vim.op_local.softtabstop = 4
vim.op_local.shiftwidth = 4

-- 启用自动缩进
vim.op_local.autoindent = true
vim.op_local.smartindent = true

-- 启用语法检查
vim.op_local.spell = true
vim.op_local.spelllang = "en"

-- 启用代码折叠
vim.op_local.foldmethod = "expr"
vim.op_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.op_local.foldlevel = 99


-- 设置蛇形命名风格
vim.api.nvim_command('augroup Python')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType python setlocal iskeyword+=_')
vim.api.nvim_command('augroup END')
