return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "vim",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "lua",
        "dockerfile",
        "bash",
        "json",
        "php",
      },

      auto_install = false,
      highlight = {
        enable = true
      }
    }
  end
}
