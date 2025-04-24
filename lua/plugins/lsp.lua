return {
    {
        "aznhe21/actions-preview.nvim",
        lazy = true,
        opts = {
            telescope = {
                sorting_strategy = "ascending",
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.8,
                    height = 0.9,
                    prompt_position = "top",
                    preview_cutoff = 20,
                    preview_height = function(_, _, max_lines)
                        return max_lines - 15
                    end,
                },
            },
        },
    },
    {
        'williamboman/mason.nvim',
        cmd = {
            "Mason",
			"MasonInstall",
			"MasonUpdate",
			"MasonUninstall",
			"MasonList",
			"MasonSearch",
			"MasonInstallAll",
			"MasonUpdateAll",
			"MasonUninstallAll",
        },
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        lazy = false,
        opts = {
            ensure_installed = {
                'lua_ls',
                'volar',
                'intelephense',
                'ts_ls',
                'psalm',
                'twiggy',
                'vue-language-server',
                'typos_lsp',
                'html',
                'cssls',
                'eslint',
                'bashls',
            },
        },
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")

            -- Everywhere utilities
            lspconfig.typos_lsp.setup({})

            -- PHP
            -- lspconfig.phpactor.setup({
            --    root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
            -- })
            lspconfig.twiggy_language_server.setup({})
			lspconfig.intelephense.setup({
				settings = {
					intelephense = {
						stubs = {
							"ds",
							"apache",
							"bcmath",
							"bz2",
							"calendar",
							"com_dotnet",
							"Core",
							"ctype",
							"curl",
							"date",
							"dba",
							"dom",
							"enchant",
							"exif",
							"FFI",
							"fileinfo",
							"filter",
							"fpm",
							"ftp",
							"gd",
							"gettext",
							"gmp",
							"hash",
							"iconv",
							"imap",
							"intl",
							"json",
							"ldap",
							"libxml",
							"mbstring",
							"meta",
							"mysqli",
							"oci8",
							"odbc",
							"openssl",
							"pcntl",
							"pcre",
							"PDO",
							"pdo_ibm",
							"pdo_mysql",
							"pdo_pgsql",
							"pdo_sqlite",
							"pgsql",
							"Phar",
							"posix",
							"pspell",
							"readline",
							"Reflection",
							"session",
							"shmop",
							"SimpleXML",
							"snmp",
							"soap",
							"sockets",
							"sodium",
							"SPL",
							"sqlite3",
							"standard",
							"superglobals",
							"sysvmsg",
							"sysvsem",
							"sysvshm",
							"tidy",
							"tokenizer",
							"xml",
							"xmlreader",
							"xmlrpc",
							"xmlwriter",
							"xsl",
							"Zend OPcache",
							"zip",
							"zlib",
						},
						environment = {
							phpVersion = "8.2",
						},
					},
				},
			})

            -- JS/Vue
            local mason_registry = require("mason-registry")
            local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
            .. "/node_modules/@vue/language-server"
            lspconfig.ts_ls.setup({
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_language_server_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                settings = {
                    javascript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                    typescript = {
                        inlayHints = {
                            includeInlayEnumMemberValueHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
            })
            lspconfig.volar.setup({})
            lspconfig.html.setup({
                filetypes = { "html", "vue", "twig" },
            })
            lspconfig.cssls.setup({
                filetypes = { "css", "less", "scss", "vue" },
            })
            lspconfig.eslint.setup({})

            -- Custom element lsp
            -- lspconfig.custom_elements_ls.setup({
            -- cmd = {
            --		"node",
            --		"~/node/custom-elements-language-server/lib/server/dist/server.js",
            --		"--stdio",
            --	},
            --	filetypes = { "html", "vue", "typescript", "twig" },
            --})

            -- Lua
            lspconfig.lua_ls.setup({})

            -- Bash
            lspconfig.bashls.setup({})

            -- Swift
            lspconfig.sourcekit.setup({
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            })
		end,
    },
}
