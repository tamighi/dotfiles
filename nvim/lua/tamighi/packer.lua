return require("packer").startup(function(use)
  --[[
  --    Core
  --]]

  -- Packer
  use("wbthomason/packer.nvim")
  -- Mason
  use("williamboman/mason.nvim")

  --[[
        UI
  --]]

  -- Theme
  use("oxfist/night-owl.nvim")
  -- Lualine
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  })
  -- Icons
  use("nvim-tree/nvim-web-devicons")

  --[[
  --    LSP
  --]]

  -- LSP
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/typescript.nvim")

  -- LSP servers
  use({ "williamboman/mason-lspconfig.nvim", require = { "williamboman/mason.nvim" } })

  --[[
  --    Syntax
  --]]

  -- Syntax highlighting
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  --[[
  --    Linting & formatting
  --]]

  -- Linting
  use('mfussenegger/nvim-lint')

  -- Formatting
  use('stevearc/conform.nvim')

  --[[
  --    Debugger
  --]]

  -- Dap
  use({ "mfussenegger/nvim-dap", requires = { "wbthomason/packer.nvim" } })
  use("theHamsta/nvim-dap-virtual-text")
  use("jay-babu/mason-nvim-dap.nvim")

  --[[
  --    Mapping & other utilities
  --]]

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

  --[[
  --    Autocomplete
  --]]

  -- CMP
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua") -- VIM globals
  use("onsails/lspkind-nvim") -- Icons

  -- Autocomplete snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  --[[
  --    Navigation
  --]]

  -- Telescope (Fuzzy finder)
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Optimizer
  use("nvim-telescope/telescope-file-browser.nvim")                 -- file browser

  -- Harpoon
  use("ThePrimeagen/harpoon")

  --[[
  --    Git
  --]]

  -- Git
  use("tpope/vim-fugitive")
end)
