-- 缩进为 2 个空格
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = false
vim.opt_local.autoindent = true

-- 设置语法高亮
vim.cmd('syntax enable')
vim.cmd('syntax on')

-- 注释
vim.opt_local.commentstring = '#\\ %s'

-- 文件类型
vim.bo.filetype = 'dockerfile'
