return {
  "nvim-treesitter/nvim-treesitter",

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

      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true
      }
    }
  end
}
