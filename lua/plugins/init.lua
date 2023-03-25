return {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
        "nvim-tree/nvim-web-devicons",
        dependencies = { "DaikyXendo/nvim-material-icon" },
        config = function()
            require("nvim-web-devicons").setup {
                override = require("nvim-material-icon").get_icons(),
            }
        end,
    },
    { "yamatsum/nvim-nonicons", config = true,        enabled = false },
    { "tpope/vim-repeat",       event = "VeryLazy" },
    { "nacro90/numb.nvim",      event = "BufReadPre", config = true },
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
    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        keys = { "gc", "gcc", "gbc" },
        config = function(_, _)
            local opts = {
                ignore = "^$",
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            }
            require("Comment").setup(opts)
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
}
