return {
    'akinsho/toggleterm.nvim',
    event = "VeryLazy",
    config = function()
        require("plugins.toggleterm.toggleterm")
    end
}
