-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	-- { 'echasnovski/mini.nvim', version = '*' },

	'goolord/alpha-nvim',
	'nvim-lua/plenary.nvim',
	'navarasu/onedark.nvim',
	'nvim-lualine/lualine.nvim',
	'akinsho/bufferline.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'lukas-reineke/indent-blankline.nvim',
	"kylechui/nvim-surround",
	'folke/which-key.nvim',
	'tpope/vim-sleuth',
	'numToStr/Comment.nvim',
	'windwp/nvim-autopairs',
	'phaazon/hop.nvim',
	'akinsho/toggleterm.nvim',
	'mbbill/undotree',
	"folke/todo-comments.nvim",
	"folke/noice.nvim",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",

	'nvim-telescope/telescope.nvim',
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-project.nvim",
	"ahmedkhalf/project.nvim",
	"cljoly/telescope-repo.nvim",
	"stevearc/aerial.nvim",
	"nvim-telescope/telescope-frecency.nvim",
	"kkharji/sqlite.lua",
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},

	'folke/neodev.nvim',
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	"jose-elias-alvarez/null-ls.nvim",	-- inject LSP diagnostics, code actions, and more
	'j-hui/fidget.nvim',

	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',



	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"leoluz/nvim-dap-go",

	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/nvim-treesitter-textobjects',

	-- 'tpope/vim-fugitive',
	-- 'tpope/vim-rhubarb',
	-- 'lewis6991/gitsigns.nvim',
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		opts = {
			integrations = { diffview = true },
		},
		keys = {
			{ "<leader>gs", "<cmd>Neogit kind=tab<cr>", desc = "Status" },
		},
	},
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
		dependencies = {
			"tpope/vim-rhubarb",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "▍",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = "▸",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = "▾",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "▍",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			-- update_debounce = 100,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
				map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
				map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>ghb", function()
					gs.blame_line { full = true }
				end, { desc = "Blame Line" })
				map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle Line Blame" })
				map("n", "<leader>ghd", gs.diffthis, { desc = "Diff This" })
				map("n", "<leader>ghD", function()
					gs.diffthis "~"
				end, { desc = "Diff This ~" })
				map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle Delete" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk" })
			end,
		},
	},
	{
		"mattn/vim-gist",
		dependencies = { "mattn/webapi-vim" },
		cmd = { "Gist" },
		config = function()
			vim.g.gist_open_browser_after_post = 1
		end,
	},

}


require('lazy').setup(plugins, {})
