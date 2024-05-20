local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

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
