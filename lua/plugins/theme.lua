return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({ variant = "light" })
        vim.cmd("colorscheme cyberdream")
    end,
}
