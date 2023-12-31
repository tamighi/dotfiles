local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
  -- A list of parser names, or "all"
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

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "python" }
  },
  disable = { "python" },
  indent = {
    enable = true
  }
}
