return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
    },
    config = function ()
        require("plugins.dap.dap")
    end
}
