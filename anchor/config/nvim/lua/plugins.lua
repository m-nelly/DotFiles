return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "bash", "c", "cpp", "lua", "vimdoc", "query", "javascript", "html", "rust", "python", "go" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	-- language support
	{"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"nvim-treesitter/nvim-treesitter",
	-- debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	"jay-babu/mason-nvim-dap.nvim",
	"mfussenegger/nvim-dap-python",
	-- workflow
	"folke/zen-mode.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzf-native.nvim",
	"preservim/vim-pencil",
	"nvim-lua/plenary.nvim",
	"nvim-neo-tree/neo-tree.nvim",
	"nvim-tree/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	-- installers
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- colorscheme  
	"folke/tokyonight.nvim",
}
