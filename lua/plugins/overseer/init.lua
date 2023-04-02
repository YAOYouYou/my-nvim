return {
    'stevearc/overseer.nvim',
    event = "VeryLazy",
    config = function()
        require("overseer").setup({
            templates = { "builtin", "user.run_script" },
        })
    end
}
