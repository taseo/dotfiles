-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr)
    local method_name = "textDocument/switchSourceHeader"
    local client = vim.lsp.get_clients({bufnr = bufnr, name = "clangd"})[1]

    if not client then
        return vim.notify(
            ("method %s is not supported by any servers active on the current buffer"):format(method_name)
        )
    end

    local params = vim.lsp.util.make_text_document_params(bufnr)

    client.request(
        method_name,
        params,
        function(err, result)
            if err then
                error(tostring(err))
            end

            if not result then
                vim.notify("corresponding file cannot be determined")
                return
            end

            vim.cmd.edit(vim.uri_to_fname(result))
        end,
        bufnr
    )
end

return {
    cmd = {"clangd"},
    filetypes = {"c", "cpp"},
    root_markers = {
        "compile_commands.json",
        ".clangd",
        ".git"
    },
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true
            }
        },
        offsetEncoding = {"utf-8", "utf-16"}
    },
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(
            bufnr,
            "LspClangdSwitchSourceHeader",
            function()
                switch_source_header(bufnr)
            end,
            {desc = "Switch between source and header files"}
        )

        local bufopts = {noremap = true, silent = true, buffer = bufnr}

        vim.keymap.set("n", "<leader>sh", "<cmd>LspClangdSwitchSourceHeader<CR>", bufopts)
    end
}

