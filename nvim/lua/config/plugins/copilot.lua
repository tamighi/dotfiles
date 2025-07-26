return {
  "zbirenbaum/copilot.lua",
  config = function()
    local copilot = require("copilot");

    local suggestion = require("copilot.suggestion");

    copilot.setup({
      suggestion = {
        enabled = true,
        keymap = {
          accept = "<M-k>",
          next = "<M-l>",
          prev = "<M-j>"
        }
      }
    });

    vim.keymap.set("i", "<M-k>", suggestion.accept);
    vim.keymap.set("i", "<M-l>", suggestion.next);
    vim.keymap.set("i", "<M-j>", suggestion.prev);
  end
}
