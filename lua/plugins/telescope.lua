return {
    {
        "nvim-telescope/telescope.nvim",
        branch="0.1.x",
        dependencies= {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {noremap=true, silent=true, desc="find files"})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {noremap=true, silent=true, desc="live grep"})

            require("telescope").load_extension("ui-select")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
}
