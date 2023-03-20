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

	'folke/tokyonight.nvim',
	'goolord/alpha-nvim',
	'nvim-lua/plenary.nvim',
	'navarasu/onedark.nvim',
	'nvim-lualine/lualine.nvim',
	'akinsho/bufferline.nvim',
	'nvim-tree/nvim-tree.lua',
	"utilyre/barbecue.nvim", "SmiteshP/nvim-navic",
	'nvim-tree/nvim-web-devicons',
	'lukas-reineke/indent-blankline.nvim',

	"kylechui/nvim-surround",
	'windwp/nvim-autopairs',
	'ggandor/leap.nvim',
	'ggandor/flit.nvim',
	'numToStr/Comment.nvim',
	'abecodes/tabout.nvim',

	"folke/trouble.nvim",
	'folke/which-key.nvim',
	'tpope/vim-sleuth',
	'akinsho/toggleterm.nvim',
	'mbbill/undotree',
	"folke/todo-comments.nvim",
	"folke/noice.nvim",
	"MunifTanjim/nui.nvim",
	"rcarriga/nvim-notify",
	'ojroques/nvim-osc52',

	'nvim-telescope/telescope.nvim',
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-project.nvim",
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
	"jose-elias-alvarez/null-ls.nvim", -- inject LSP diagnostics, code actions, and more
	'j-hui/fidget.nvim',

	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-path',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"leoluz/nvim-dap-go",
	"mfussenegger/nvim-dap-python",

	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/nvim-treesitter-textobjects',

	"nvim-neotest/neotest",
	"antoinemadec/FixCursorHold.nvim",
	"nvim-neotest/neotest-python",
	"nvim-neotest/neotest-go",

	'stevearc/overseer.nvim',
	-- 'tpope/vim-fugitive',
	-- 'tpope/vim-rhubarb',
	-- 'lewis6991/gitsigns.nvim',

	"TimUntersberger/neogit",
	"sindrets/diffview.nvim",
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
		dependencies = {
			"tpope/vim-rhubarb",
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
	"lewis6991/gitsigns.nvim",

	"iamcco/markdown-preview.nvim",
	"dhruvasagar/vim-table-mode",
	"nvim-neorg/neorg",
}


require('lazy').setup(plugins, {})
