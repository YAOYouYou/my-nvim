return {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-project.nvim",
        "cljoly/telescope-repo.nvim",
        "stevearc/aerial.nvim",
        "nvim-telescope/telescope-frecency.nvim",
        "nvim-telescope/telescope-dap.nvim",
        "benfowler/telescope-luasnip.nvim",
        "kkharji/sqlite.lua",
    },
    config = function()
        require("plugins.telescope.telescope").setup()
    end
}
