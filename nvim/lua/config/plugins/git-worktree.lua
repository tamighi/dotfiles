return {
  "polarmutex/git-worktree.nvim",

  version = '^2',

  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim"
  },

  config = function()
    local telescope = require("telescope");
    telescope.load_extension('git_worktree');

    vim.keymap.set("n", "gwc", telescope.extensions.git_worktree.create_git_worktree);
    vim.keymap.set("n", "gws", telescope.extensions.git_worktree.git_worktree);

    local Hooks = require("git-worktree.hooks");
    local config = require('git-worktree.config');
    local update_on_switch = Hooks.builtins.update_current_buffer_on_switch;

    Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
      vim.notify("Moved from " .. prev_path .. " to " .. path);
      update_on_switch(path, prev_path);
    end)

    Hooks.register(Hooks.type.DELETE, function()
      vim.cmd(config.update_on_change_command);
    end)
  end
}
