return {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
        {
            'ms-jpq/coq_nvim',
            branch = 'coq',
        }
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = true,
            completion = {
                skip_after = {"{", "}", "[", "]", ";", " "},
            }
        }
    end,
}

