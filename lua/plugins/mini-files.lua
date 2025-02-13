return {
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
    }
}
