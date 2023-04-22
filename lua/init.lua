require("config.options")
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "config.autocmds"
    require "config.keymaps"
    require 'config.usercmds'
    require 'config.plugin_keymaps'
    -- require "utils.contextmenu"
  end,
})

vim.cmd[[colorscheme onedark]]

require("lsp.setup")


