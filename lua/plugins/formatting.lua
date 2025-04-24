return {
    "stevearc/conform.nvim",
    lazy = true,
    opts = {
        formatters_by_ft = {
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            json = { "prettierd" },
            yaml = { "prettierd" },
            vue = { "prettierd" },
            less = { "prettierd" },
            css = { "prettierd" },
            scss = { "prettierd" },
            html = { "prettierd" },
            php = { "php_cs_fixer" },
        },
        formatters = {
            php_cs_fixer = {
                stdin = false,
                append_args = function(self, ctx)
                    local cwd = require("conform.util").root_file({ "composer.json", "README.md" })(self, ctx)
                    if cwd == nil then
                        return {}
                    end
                    local app_config = cwd .. "/app/.php-cs-fixer.php"
                    if vim.fn.filereadable(app_config) == 1 then
                        return { "--config=" .. app_config }
                    end
                    local v3_config = cwd .. "/.php-cs-fixer.php"
                    if vim.fn.filereadable(v3_config) == 1 then
                        return { "--config=" .. v3_config }
                    end
                    return {}
                end,
                async = false,
                env = {
                    PHP_CS_FIXER_IGNORE_ENV = "1",
                },
            },
        },
    },
    keys = {
        {
            "<leader>c",
            function()
                local path = vim.api.nvim_buf_get_name(0)
                if path:sub(-4) == ".php" then
                    -- php_cs_fixer has problems with async and temp files I think
                    require("conform").format({ async = false, lsp_fallback = true })
                elseif path:sub(-5) ~= ".twig" then
                    require("conform").format({ async = true, lsp_fallback = true })
                end
            end,
        },
    },
}
