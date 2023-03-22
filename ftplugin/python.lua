-- 设置 tab 宽度为 4
vim.opt_local.expandtab = true
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

-- 启用自动缩进
vim.opt_local.autoindent = true
vim.opt_local.smartindent = true

-- 启用语法检查
vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

-- 启用代码折叠
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldlevel = 99


-- 设置蛇形命名风格
vim.api.nvim_command('augroup Python')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType python setlocal iskeyword+=_')
vim.api.nvim_command('augroup END')
