return require("packer").startup(function(use)
  --[[
  --    Core
  --]]

  use("wbthomason/packer.nvim")
  use("williamboman/mason.nvim")
  use "nvim-lua/plenary.nvim" -- Coroutines for other plugins

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
  use({ "rcarriga/nvim-dap-ui", requires = { "nvim-neotest/nvim-nio" } })
  use("theHamsta/nvim-dap-virtual-text")

  --[[
  --    Mapping & other utilities
  --]]

  -- Pairs/tags
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
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
  use("saadparwaiz1/cmp_luasnip")
  use("onsails/lspkind-nvim") -- Icons

  -- Snippets
  use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp", dependencies = { "rafamadriz/friendly-snippets" } })
  use("aca/emmet-ls")

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

  use({ "stevearc/oil.nvim", requires = { "nvim-tree/nvim-web-devicons" } })

  -- Harpoon
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  --[[
  --    Git
  --]]

  -- Git
  use("tpope/vim-fugitive")

  --[[
  --    Others
  --]]

  use("tjdevries/vlog.nvim")
end)
