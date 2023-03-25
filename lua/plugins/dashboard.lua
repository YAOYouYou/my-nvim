return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function ()
        local dashboard = require "alpha.themes.dashboard"
        dashboard.section.header.val = {
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }
        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
        }

        -- for _, button in ipairs(dashboard.section.buttons.val) do
        --     button.opts.hl = "AlphaButtons"
        --     button.opts.hl_shortcut = "AlphaShortcut"
        --   end
        --   dashboard.section.footer.opts.hl = "Constant"
        --   dashboard.section.header.opts.hl = "AlphaHeader"
        --   dashboard.section.buttons.opts.hl = "AlphaButtons"
        --   dashboard.opts.layout[1].val = 0
      
        --   -- close Lazy and re-open when the dashboard is ready
        --   if vim.o.filetype == "lazy" then
        --     vim.cmd.close()
        --     vim.api.nvim_create_autocmd("User", {
        --       pattern = "AlphaReady",
        --       callback = function()
        --         require("lazy").show()
        --       end,
        --     })
        --   end
      
          require("alpha").setup(dashboard.opts)
      
        --   vim.api.nvim_create_autocmd("User", {
        --     pattern = "LazyVimStarted",
        --     callback = function()
        --       local stats = require("lazy").stats()
        --       local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      
        --       -- local now = os.date "%d-%m-%Y %H:%M:%S"
        --       local version = "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        --       local fortune = require "alpha.fortune"
        --       local quote = table.concat(fortune(), "\n")
        --       local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        --       local footer = "\t" .. version .. "\t" .. plugins .. "\n" .. quote
        --       dashboard.section.footer.val = footer
        --       pcall(vim.cmd.AlphaRedraw)
        --     end,
        --   })
    end
}