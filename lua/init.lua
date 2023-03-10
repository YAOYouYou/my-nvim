-- load config
require("basic")
require("keymaps")
require("plugins")

-- apperance
require("appearance.setup")

-- vcs
require("vcs.setup")

-- magic
require("magic.autopairs")
require("magic.comment")
require("magic.surround")
require("magic.hop")
require("magic.tabout")

-- better
require("better.nvim-tree")
require("better.whichkey")
require("better.telescope")
require("better.toggleterm")
require("better.aerial")
require("better.noice")
require("better.undotree")
require("better.indentline")
require("better.nvim-treesitter")
require("better.trouble")
require("better.todo-comments")


require("usercmd")

-- lsp
require("lsp.setup")

-- dap
require("dap.setup")

-- cmp
require("cmp.setup")

require("plugin_keymaps")
