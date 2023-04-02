local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    -- lsp
    'folke/neodev.nvim',
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    "jose-elias-alvarez/null-ls.nvim", -- inject LSP diagnostics, code actions, and more
    "glepnir/lspsaga.nvim",
    'j-hui/fidget.nvim',
}

local plugins_spec = {
    plugins,
    { import = "plugins" },
    { import = "plugins.extra.pde" },
    { import = "plugins.extra.pde.note" },
    { import = "plugins.extra.ui" },
}

require('lazy').setup({ spec = plugins_spec, {} })
