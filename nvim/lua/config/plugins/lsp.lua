return {
	"neovim/nvim-lspconfig",

	opts = {
		servers = {
			ts_ls = {
				init_options = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						-- other settings
					},
				},
			},
		},
	},

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},

	config = function()
		local lspconfig = require("lspconfig")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

				-- Keymaps
				vim.keymap.set("n", "[d", function()
					-- vim.diagnostic.jump({ count = 1, on_jump = vim.diagnostic.open_float })
					vim.diagnostic.goto_next()
					vim.diagnostic.open_float()
				end, { noremap = true, silent = true })

				vim.keymap.set("n", "]d", function()
					-- vim.diagnostic.jump({ count = -1, on_jump = vim.diagnostic.open_float })
					vim.diagnostic.goto_prev()
					vim.diagnostic.open_float()
				end, { noremap = true, silent = true })

				if client ~= nil and client.name == "ts_ls" then
					vim.keymap.set("n", "<leader>oi", ":OrganizeImports<CR>")
				end
			end,
		})

		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities()

		local function organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
				title = "",
			}
			local clients = vim.lsp.get_clients({ name = "ts_ls" })
			clients[1]:exec_cmd(params)
		end

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			commands = {
				OrganizeImports = { organize_imports },
			},
		})

		-- replace lspconfig.x.setup with vim.lsp.config
		vim.lsp.config("html", {})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})

		vim.lsp.config("jsonls", {})

		vim.lsp.config("clangd", {})

		vim.lsp.config("lua_ls", {})

		vim.lsp.config("tailwindcss", {})

		vim.lsp.config("glsl_analyzer", {})
	end,
}
