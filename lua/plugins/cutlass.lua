return {
    "svermeulen/vim-cutlass",
    event = "VeryLazy",
    config = function ()
        vim.keymap.set("n", "x", "d", { noremap = true })
        vim.keymap.set("x", "x", "d", { noremap = true })
        vim.keymap.set("n", "xx", "dd", { noremap = true })
        vim.keymap.set("n", "X", "D", { noremap = true })
        vim.keymap.set("v", "p", '"_p', { noremap = true })
    end
}
