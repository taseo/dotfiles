return {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.8",
    -- branch = 'master',
    commit = "b4da76be54691e854d3e0e02c36b0245f945c2c7",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

        vim.keymap.set("n", "<C-p>", builtin.git_files, {})

        vim.keymap.set(
            "n",
            "<leader>ps",
            function()
                builtin.grep_string({search = vim.fn.input("Grep > ")})
            end
        )

        local opts = {jump_type = "never"}

        vim.keymap.set(
            "n",
            "gd",
            function()
                builtin.lsp_definitions(opts)
            end
        )

        vim.keymap.set(
            "n",
            "gr",
            function()
                builtin.lsp_references(opts)
            end
        )

        vim.keymap.set(
            "n",
            "gi",
            function()
                builtin.lsp_implementations(opts)
            end
        )

        vim.keymap.set(
            "n",
            "gt",
            function()
                builtin.lsp_type_definitions(opts)
            end
        )
    end
}

