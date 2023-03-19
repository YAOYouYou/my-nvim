vim = vim
-- load config
require("basic")
require("keymaps")
require("plugins")

-- apperance
require("appearance.setup")
require("better.indentline")
require("better.nvim-treesitter")

-- vcs
require("vcs.setup")

-- magic
require("magic.autopairs")
require("magic.comment")
require("magic.surround")
-- require("magic.hop")
require("magic.leap")
require("magic.flit")
require("magic.tabout")

-- better
require("better.nvim-tree")
require("better.whichkey")
require("better.telescope")
require("better.toggleterm")
require("better.aerial")
require("better.undotree")
require("better.trouble")
require("better.todo-comments")
require("better.osc52")
require("better.noice")

-- note
require("note.neorg")
require("note.markdown-preview")

require("usercmd")

-- lsp
require("lsp.setup")

-- dap
require("dap.setup")
-- test
require("test.setup")

require("overseer.setup")
-- cmp
require("cmp.setup")

require("plugin_keymaps")
