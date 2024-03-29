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

local config = {
    defaults = {
        mappings = mappings,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        -- initial_mode = 'normal'
    },
    pickers = {
        find_files = {
            -- theme = "dropdown",
            -- previewer = false,
            -- hidden = true,
            no_ignore = true,
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
            hidden = true,
            theme = "dropdown",
        },
    },
}

return {
    setup = function()
        telescope.setup(config)

        -- Enable telescope fzf native, if installed
        telescope.load_extension "fzf"
        telescope.load_extension "file_browser"
        telescope.load_extension "project"
        telescope.load_extension "aerial"
        telescope.load_extension "dap"
        telescope.load_extension "frecency"
        telescope.load_extension "luasnip"
    end
}
