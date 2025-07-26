return {
  "zbirenbaum/copilot.lua",
  config = function()
    local copilot = require("copilot");

    local suggestion = require("copilot.suggestion");

    copilot.setup({
      suggestion = {
        enabled = true,
      }
    });

    vim.keymap.set("i", "<M-k>", function()
      suggestion.accept()
      suggestion.next()
    end, { desc = "[copilot] accept and next suggestion" })

    vim.keymap.set("i", "<M-l>", suggestion.next);
    vim.keymap.set("i", "<M-j>", suggestion.prev);
  end
}
