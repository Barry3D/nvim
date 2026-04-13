local keys = require("layout")

return {
    "ggandor/leap.nvim",
    keys = {
        { keys.leapf, "<Plug>(leap-forward)",  mode = { "n", "x", "o" } },
        { keys.leapb, "<Plug>(leap-backward)", mode = { "n", "x", "o" } },
    },
}
