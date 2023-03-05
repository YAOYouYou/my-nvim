-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local config = {
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
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


-- keymap
vim.keymap.set('n', '<Leader>nt', function() require("nvim-tree").toggle() end, { desc = "NvimTree Toggle" })

