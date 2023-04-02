return {
    {
        "vim-test/vim-test",
        event = "VeryLazy",
        keys = {
            { "<leader>tc", "<cmd>w|TestClass<cr>",   desc = "Class" },
            { "<leader>tf", "<cmd>w|TestFile<cr>",    desc = "File" },
            { "<leader>tl", "<cmd>w|TestLast<cr>",    desc = "Last" },
            { "<leader>tn", "<cmd>w|TestNearest<cr>", desc = "Nearest" },
            { "<leader>ts", "<cmd>w|TestSuite<cr>",   desc = "Suite" },
            { "<leader>tv", "<cmd>w|TestVisit<cr>",   desc = "Visit" },
        },
        config = function()
            vim.g["test#strategy"] = "neovim"
            vim.g["test#neovim#term_position"] = "belowright"
            vim.g["test#neovim#preserve_screen"] = 1
            vim.g["test#python#runner"] = "pytest" -- pytest
        end,
    },
    {
        "nvim-neotest/neotest",
        event = "VeryLazy",
        dependencies = {
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
        },
        config = function()
            local get_python_path = require("utils.python").get_python_path
            require("neotest").setup({
                adapters = {
                    require "neotest-python" {
                        dap = { justMyCode = false },
                        python = get_python_path(),
                        runner = "pytest",
                    },
                    require "neotest-go",
                },
                -- overseer.nvim
                consumers = {
                    overseer = require "neotest.consumers.overseer",
                },
                overseer = {
                    enabled = true,
                    force_default = true,
                },
            })
        end
    },
}
