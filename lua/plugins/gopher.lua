return {
	"olexsmir/gopher.nvim",
	ft = "go",
	config = function(_, opts)
		require("gopher").setup(opts)

		vim.keymap.set(
			"n",
			"<leader>gsj",
			"<cmd> GoTagAdd json <CR>",
			{ noremap = true, silent = true, desc = "add json(go)" }
		)
		vim.keymap.set(
			"n",
			"<leader>gsy",
			"<cmd> GoTagAdd yaml <CR>",
			{ noremap = true, silent = true, desc = "add yaml(go)" }
		)
	end,
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
