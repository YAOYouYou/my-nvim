-- load config
require("basic")
require("keymaps")
require("plugins")

-- apperance
require("appearance.theme")
require("appearance.statusline")
require("appearance.tabline")
require("appearance.dashboard")

-- magic
require("magic.autopairs")
require("magic.comment")
require("magic.surround")
require("magic.hop")

-- better
require("better.nvim-tree")
require("better.whichkey")
require("better.telescope")
require("better.toggleterm")
require("better.noice")
require("better.undotree")
require("better.indentline")
require("better.nvim-treesitter")

-- vcs
require("vcs.vcs")

require("usercmd")

-- lsp
require("lsp.mason")
require("lsp.fidget")
require("lsp.setup")

-- dap
require("dap.setup")

-- cmp
require("cmp.setup")

