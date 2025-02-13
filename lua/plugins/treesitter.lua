return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },            
            sync_install = true,
        })
    end,
}
