return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- js + ts
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				-- lua
				lua = { "stylua" },
				-- python
				python = { "black" },
				-- c + cpp
				c = { "clang_format" },
				cpp = { "clang_format" },
				-- go
				go = { "gofumpt", "goimports_reviser", "golines" },
				-- ruby
				ruby = { "rubocop" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
