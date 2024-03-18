return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			local opts = {
				ensure_installed = {
					-- go
					"gofumpt",
					"goimports-reviser",
					"golines",
					"gomodifytags",
					-- python
					"black",
					"debugpy",
					"mypy",
					"ruff",
					-- c
					"clang-format",
					"codelldb",
					-- js + ts + html
					"prettier",
					-- ruby
					"rubocop",
					-- lua
					"stylua",
				},
				auto_install = true,
			}
			require("mason").setup({
				opts = opts,
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- rust
					"rust_analyzer",
					-- ts + js + html
					"tsserver",
					"eslint",
					-- css
					"tailwindcss",
					"cssls",
					-- docker
					"dockerls",
					-- ruby
					"ruby_ls",
					-- python
					"pyright",
					-- c + cpp
					"clangd",
					-- java
					"jdtls",
					-- lua
					"lua_ls",
					-- go
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			lspconfig.ruby_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "hover" })
			vim.keymap.set(
				"n",
				"<leader>gd",
				vim.lsp.buf.definition,
				{ noremap = true, silent = true, desc = "jump defenition" }
			)
			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ noremap = true, silent = true, desc = "code action" }
			)
		end,
	},
}
