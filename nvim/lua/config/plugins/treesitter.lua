return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    ---@diagnostic disable-next-line: missing-fields
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
        "glsl"
      },

      auto_install = false,
      highlight = {
        enable = true
      }
    }

    vim.treesitter.language.register('glsl', { 'vert', 'frag' })
  end
}
