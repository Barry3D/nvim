local keys = require("layout")

return {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
        vim.keymap.set({ "n", "x", "o" }, keys.leapf, "<Plug>(leap-forward)")
        vim.keymap.set({ "n", "x", "o" }, keys.leapb, "<Plug>(leap-backward)")
    end
}
