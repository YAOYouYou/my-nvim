-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local config = {
  root_folder_modifier = ":t",
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },

  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
}

require("nvim-tree").setup(config)
require("nvim-web-devicons").get_icons()

