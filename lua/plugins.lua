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
	'nvim-telescope/telescope.nvim',
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

	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',
}


require('lazy').setup(plugins, {})

