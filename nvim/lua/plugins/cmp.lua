return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua"
    },
    config = function()
        local cmp = require("cmp")

        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings =
            cmp.mapping.preset.insert(
            {
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping.confirm({select = true}),
                ["<C-Space>"] = cmp.mapping.complete()
            }
        )

        local cmp_sources =
            cmp.config.sources(
            {
                {name = "nvim_lsp"},
                {name = "luasnip"},
                {name = "buffer"},
                {name = "path"}
            }
        )

        cmp.setup(
            {
                mapping = cmp_mappings,
                sources = cmp_sources
            }
        )
    end
}

