return {
    "okuuva/auto-save.nvim",
    version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    config = function()
        require("auto-save").setup({})
        local group = vim.api.nvim_create_augroup('autosave', {})

        vim.api.nvim_create_autocmd('User', {
            pattern = 'AutoSaveWritePost',
            group = group,
            callback = function()
                vim.uv.spawn("idev", {args = {"."}}, function()
                    -- noop
                end)
            end,
        })

        vim.api.nvim_create_autocmd({"BufWritePost", "FileWritePost"}, {
            pattern = {"*"},
            group = group,
            callback = function()
                vim.uv.spawn("idev", {args = {"."}}, function()
                    -- noop
                end)
            end,
        })
    end,
}
