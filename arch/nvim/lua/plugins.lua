return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vimdoc", "query", "javascript", "html", "rust", "python", "go" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
	"nvim-treesitter/nvim-treesitter",
  "folke/zen-mode.nvim",
  "folke/tokyonight.nvim",
  "hrsh7th/nvim-cmp",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "Bekaboo/dropbar.nvim",
  "preservim/vim-pencil",
	"williamboman/mason.nvim",
}
