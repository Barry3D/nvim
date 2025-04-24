return {
    'svermeulen/vim-subversive',
    event = "VeryLazy",
    config = function ()
        vim.keymap.set({ "n" }, "s", "<Plug>(SubversiveSubstitute)")
        vim.keymap.set({ "n" }, "ss", "<Plug>(SubversiveSubstituteLine)")
        vim.keymap.set({ "n" }, "S", "<Plug>(SubversiveSubstituteToEndOfLine)")
    end
}
