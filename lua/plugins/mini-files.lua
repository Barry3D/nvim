return {
    {
        "echasnovski/mini.icons",
        version = "*",
    },
    {
        "echasnovski/mini.files",
        version = '*',
        lazy = true,
        keys = {
            {
                "<leader>.",
                function()
                    require("mini.files").open(vim.fn.expand("%"))
                end,
                desc = "Open file browser at current file"
            },
        },
        opts = {
            mappings = {
                go_in = "t",
                go_in_plus = "T",
                go_out = "h",
                go_out_plus = "H",
            }
        },
    }
}
