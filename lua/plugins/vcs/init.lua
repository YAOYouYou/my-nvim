return {
    {
        "TimUntersberger/neogit",
        event = "VeryLazy",
        opts = {
            integrations = { diffview = true },
            disable_commit_confirmation = true,
        },
        config = true,
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.vcs.diffview").setup()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        config = function()
            require("plugins.vcs.gitsigns").setup()
        end
    }
}
