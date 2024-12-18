return {
  "nvim-lualine/lualine.nvim",

  config = function()
    local harpoon = require('harpoon')
    local devicons = require('nvim-web-devicons')

    function Harpoon_files()
      local contents = {}

      for idx = 1, harpoon:list():length() do
        local file_path = harpoon:list():get(idx).value
        local file_name
        if file_path == "" then
          file_name = "(empty)"
        else
          file_name = vim.fn.fnamemodify(file_path, ':t')
        end
        local dev = devicons.get_icon(file_name) or ''

        local current_file_path = vim.fn.expand("%:f")

        local prev = ""
        if idx ~= 1 then
          prev = " "
        end
        local next = ""
        if idx < harpoon:list():length() then
          next = " "
        end
        if file_path == current_file_path then
          contents[idx] = string.format("%%#lualine_b_normal#%s%s %s%s", prev, dev, file_name, next)
        else
          contents[idx] = string.format("%%#lualine_b_inactive#%s%s %s%s", prev, dev, file_name, next)
        end
      end

      return table.concat(contents)
    end

    local lualine = require 'lualine'

    lualine.setup {
      options = {
        component_separators = "|",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { { Harpoon_files } },
        lualine_c = { "filename", "branch", "diff", "diagnostics" },
      },
    }
  end
}
