-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope = require("telescope")

local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"
local mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["?"] = actions_layout.toggle_preview,
  },
}
telescope.setup {
  defaults = {
    mappings = mappings,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
      -- previewer = false,
      -- hidden = true,
      find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
    },
    git_files = {
      -- theme = "dropdown",
      -- previewer = false,
    },
    buffers = {
      -- theme = "dropdown",
      -- previewer = false,
    },
  },
  extensions = {
    -- file_browser = {
    --   theme = "dropdown",
    --   previewer = false,
    --   hijack_netrw = true,
    --   mappings = mappings,
    -- },
    project = {
      hidden_files = true,
      theme = "dropdown",
      -- sync_with_nvim_tree = true, 
    },
  },
}

-- Enable telescope fzf native, if installed
telescope.load_extension "fzf"
telescope.load_extension "file_browser"
telescope.load_extension "project"
telescope.load_extension "aerial"
-- telescope.load_extension "dap"
telescope.load_extension "frecency"

vim.keymap.set('n', "<leader>pp", function()
  require("telescope").extensions.project.project { display_stype = "full" }
end, { desc = "List Project" })
