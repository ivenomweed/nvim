local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",

		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local status, lazy = pcall(require, "lazy")

if not status then
	return
end

lazy.setup({
	-- Icons
	{ "nvim-tree/nvim-web-devicons" },

	-- Essential Plugins
	{ "tpope/vim-surround" },
	{ "vim-scripts/ReplaceWithRegister" },

	-- Misc Dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },

	-- Comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("ivenomweed.module.comment")
		end,
	},

	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("ivenomweed.module.colorscheme")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("ivenomweed.module.statusline")
		end,
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		config = function()
			require("ivenomweed.module.dashboard")
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("ivenomweed.module.telescope")
		end,
	},

	-- Tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "NeoTree",
		branch = "v2.x",
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		config = function()
			require("ivenomweed.module.tree")
		end,
	},

	-- Autocompletion & Snippets
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("ivenomweed.module.cmp")
		end,
	},

	-- Managing & Installing LSP Servers, Linters & Formatters
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			require("ivenomweed.module.lsp.mason")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("ivenomweed.module.lsp.lspsaga")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"jose-elias-alvarez/typescript.nvim",
		},
		config = function()
			require("ivenomweed.module.lsp.lspconfig")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("ivenomweed.module.lsp.null-ls")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("ivenomweed.module.treesitter")
		end,
	},

	-- Auto Close Tags & Auto Pair
	{
		"windwp/nvim-autopairs",
		config = function()
			require("ivenomweed.module.autopairs")
		end,
	},

	-- Git Integrations
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("ivenomweed.module.gitsigns")
		end,
	},
})
