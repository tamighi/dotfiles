return require("packer").startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- Theme
  use({
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" },
  })

  -- Lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })

  -- LSP
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/typescript.nvim") -- LSP utils for typescript

  -- Autocomplete
  use("hrsh7th/nvim-cmp")     -- Completion
  use("hrsh7th/cmp-buffer")   -- Buffer completion
  use("hrsh7th/cmp-path")     -- Path completion
  use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
  use("hrsh7th/cmp-nvim-lua") -- for vim global in lua
  use("onsails/lspkind-nvim") -- Icons

  -- Mason for lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- Autocomplete snippets
  use("L3MON4D3/LuaSnip")             -- Snippet plugin
  use("saadparwaiz1/cmp_luasnip")     -- Add luasnip to cmp
  use("rafamadriz/friendly-snippets") -- Snippet package

  -- Telescope (Fuzzy finder)
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Optimizer
  use("nvim-telescope/telescope-file-browser.nvim")                 -- file browser
  use("nvim-tree/nvim-web-devicons")                                -- Icons
  use("nvim-tree/nvim-tree.lua")                                    -- Tree for a better global view

  -- Syntax highlighting
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

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

  -- Prettier
  use("jose-elias-alvarez/null-ls.nvim")

  -- Harpoon
  use("ThePrimeagen/harpoon")
end)
