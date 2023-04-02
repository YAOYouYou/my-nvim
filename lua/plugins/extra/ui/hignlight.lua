return {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = {
        delay = 200,
        under_cursor = true,
        filetypes_denylist = {
            "NvimTree",
            "undotree",
            "dbui",
            "toggleterm",
            "notify",
            "packer",
            "lsp-installer",
            "help",
            "terminal",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "dashboard",
            "",
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end
}
