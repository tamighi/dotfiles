return require("packer").startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- Theme
  use("oxfist/night-owl.nvim")

  -- Lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  -- LSP
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/typescript.nvim") -- LSP utils for typescript

  -- Linting
  use('mfussenegger/nvim-lint')

  -- Formatting
  use('stevearc/conform.nvim')

  -- Autocomplete
  use("hrsh7th/nvim-cmp")     -- Completion
  use("hrsh7th/cmp-buffer")   -- Buffer completion
  use("hrsh7th/cmp-path")     -- Path completion
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/cmp-nvim-lua") -- for vim global in lua
  use("onsails/lspkind-nvim") -- Icons

  -- Mason for lsp servers
  use("williamboman/mason.nvim")
  use({ "williamboman/mason-lspconfig.nvim", require = { "williamboman/mason.nvim" } })

  -- Autocomplete snippets
  use("L3MON4D3/LuaSnip")         -- Snippet plugin
  use("saadparwaiz1/cmp_luasnip") -- Add luasnip to cmp

  -- Telescope (Fuzzy finder)
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Optimizer
  use("nvim-telescope/telescope-file-browser.nvim")                 -- file browser

  -- Tree
  use("nvim-tree/nvim-web-devicons") -- Icons
  use("nvim-tree/nvim-tree.lua")     -- Tree for a better global view

  -- Syntax highlighting
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  -- Debuger
  use({ "mfussenegger/nvim-dap", requires = { "wbthomason/packer.nvim" } })
  use("theHamsta/nvim-dap-virtual-text")
  use("jay-babu/mason-nvim-dap.nvim")

  -- Pairs/tags
  use("windwp/nvim-autopairs")
  use({ "windwp/nvim-ts-autotag", requires = { "nvim-treesitter/nvim-treesitter" } })
  use("tpope/vim-surround")

  -- Comments
  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  })

  -- Zen mode
  use("folke/zen-mode.nvim")

  -- Git
  use("tpope/vim-fugitive")

  -- Harpoon
  use("ThePrimeagen/harpoon")
end)
