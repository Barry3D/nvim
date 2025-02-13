return {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim"},
    keys = {
        {
            "<leader>f",
            function()
                require("telescope.builtin").find_files()
            end;
        },
        {
            "<leader>sf",
            function()
                require("telescope.builtin").live_grep()
            end;
        },
    },
}
