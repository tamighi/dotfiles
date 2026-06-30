return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup({
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"vim",
				"javascript",
				"typescript",
				"tsx",
				"c",
				"cpp",
				"lua",
				"dockerfile",
				"bash",
				"json",
				"php",
				"glsl",
			},

			auto_install = false,
			highlight = {
				enable = true,
			},
		})

		vim.treesitter.language.register("glsl", { "vert", "frag" })

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
