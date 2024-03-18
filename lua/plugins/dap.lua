return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set(
				"n",
				"<leader>db",
				dap.toggle_breakpoint,
				{ noremap = true, silent = true, desc = "breakpoint" }
			)
			vim.keymap.set("n", "<leader>dr", dap.continue, { noremap = true, silent = true, desc = "continue/run" })
			vim.keymap.set("n", "<leader>dus", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end, { noremap = true, silent = true, desc = "open sidebar" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, _)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)

			vim.keymap.set("n", "<leader>dpr", function()
				require("dap-python").test_method()
			end, { noremap = true, silent = true, desc = "test method(python)" })
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)

			vim.keymap.set("n", "<leader>dgt", function()
				require("dap-go").debug_test()
			end, { noremap = true, silent = true, desc = "run test(go)" })

			vim.keymap.set("n", "<leader>dgl", function()
				require("dap-go").debug_last()
			end, { noremap = true, silent = true, desc = "run latest test(go)" })
		end,
	},
}
