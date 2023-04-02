return {
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    enable = false,
                    separator = " ",
                    ignore_patterns = {},
                    hide_keyword = true,
                    show_file = true,
                    folder_level = 2,
                    respect_root = false,
                    color_mode = true,
                },
            })
        end,
    },
}
