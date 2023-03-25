vim = vim
require "config.options"
require "config.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "config.autocmds"
    require "config.keymaps"
    -- require "utils.contextmenu"
  end,
})
-- load config
-- require("basic")
-- require("keymaps")
-- require("plugins")

-- -- apperance
-- require("appearance.setup")

-- vim.cmd[[colorscheme tokyonight-storm]]
-- -- " colorscheme tokyonight-storm
-- require("better.indentline")
-- require("better.nvim-treesitter")

-- -- vcs
-- require("vcs.setup")

-- -- magic
-- require("magic.autopairs")
-- require("magic.comment")
-- require("magic.surround")
-- -- require("magic.leap")
-- -- require("magic.flit")
-- require("magic.tabout")

-- -- better
-- require("better.nvim-tree")
-- -- require("better.whichkey")
-- require("better.toggleterm")
-- require("better.aerial")
-- require("better.undotree")
-- require("better.trouble")
-- require("better.todo-comments")
-- require("better.osc52")
-- require("better.noice")

-- require('telescope.setup')

-- -- note
-- require("note.neorg")
-- require("note.markdown-preview")

-- require("usercmd")

-- require("lsp.setup")

-- -- dap
-- require("dap.setup")
-- -- test
-- require("test.setup")

-- require("overseer.setup")
-- -- cmp
-- require("cmp.setup")

-- require("plugin_keymaps")
