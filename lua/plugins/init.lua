return {
    'nvim-lua/plenary.nvim',
    "MunifTanjim/nui.nvim",
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = { relative = "editor" },
            select = {
                backend = { "telescope", "fzf", "builtin" },
            },
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
        dependencies = { "DaikyXendo/nvim-material-icon" },
        config = function()
            require("nvim-web-devicons").setup {
                override = require("nvim-material-icon").get_icons(),
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
}
