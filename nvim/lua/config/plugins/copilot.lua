return {
  "zbirenbaum/copilot.lua",
  config = function()
    local copilot = require("copilot");
    local cmp = require("cmp");

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

    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)

    vim.keymap.set("i", "<M-k>", suggestion.accept);
    vim.keymap.set("i", "<M-l>", suggestion.next);
    vim.keymap.set("i", "<M-j>", suggestion.prev);
  end
}
