return {
	"zbirenbaum/copilot.lua",
	config = function()
		local copilot = require("copilot")

		copilot.setup({
			suggestion = {
				enabled = true,
				keymap = {
					accept = "<M-k>",
					next = "<M-l>",
					prev = "<M-j>",
				},
			},
		})
	end,
}
