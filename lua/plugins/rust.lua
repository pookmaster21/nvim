return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			local base = require("lspconfig")

			return {
				server = {
					on_attach = base.on_attach,
					capabilities = base.capabilities,
				},
			}
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		dependencies = "hrsh7th/nvim-cmp",
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()

			vim.keymap.set("n", "<leader>rcu", function()
				require("crates").upgrade_all_crates()
			end, { noremap = true, silent = true, desc = "update crates(rust)" })
		end,
	},
}
