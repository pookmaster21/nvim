return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.keymap.set(
			"n",
			"<C-h>",
			":TmuxNavigateLeft<CR>",
			{ noremap = true, silent = true, desc = "tmux move to left pane" }
		)
		vim.keymap.set(
			"n",
			"<C-j>",
			":TmuxNavigateDown<CR>",
			{ noremap = true, silent = true, desc = "tmux move to lower pane" }
		)
		vim.keymap.set(
			"n",
			"<C-k>",
			":TmuxNavigateUp<CR>",
			{ noremap = true, silent = true, desc = "tmux move to upper pane" }
		)
		vim.keymap.set(
			"n",
			"<C-l>",
			":TmuxNavigateRight<CR>",
			{ noremap = true, silent = true, desc = "tmux move to right pane" }
		)
	end,
}
