-- Key replacements for custom/qwerty layout
local keys = require("layout")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Engramm remappings
local function full_keymap(key, action)
	if key == action then
		return
	end
	if type(key) == "table" then
		vim.keymap.set({ "n", "v", "o" }, key[1], action, { noremap = true })
		vim.keymap.set({ "n", "v", "o" }, key[2], action:upper(), { noremap = true })
	else
		vim.keymap.set({ "n", "v", "o" }, key, action, { noremap = true })
		vim.keymap.set({ "n", "v", "o" }, key:upper(), action:upper(), { noremap = true })
	end
end

-- movement
full_keymap(keys.h, "h")
full_keymap(keys.j, "j")
full_keymap(keys.k, "k")
full_keymap(keys.l, "l")

full_keymap(keys.n, "n")
full_keymap({ keys.t, keys.T }, "t")

-- window navigation
vim.keymap.set("n", "<C-" .. keys.h .. ">", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-" .. keys.j .. ">", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-" .. keys.k .. ">", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-" .. keys.l .. ">", "<C-w>l", { noremap = true })

vim.keymap.set("n", "<C-b>", ":%bd|e#<cr>")

-- system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste after from system clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- LSP mappings
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspGroup", {}),
    callback = function (ev)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "gr", function ()
            require("telescope.builtin").lsp_references({})
        end, opts)

        vim.keymap.set("n", "gi", function ()
            require("telescope.builtin").lsp_implementations({})
        end, opts)

        vim.keymap.set({"i", "n", "v"}, "<C-a>", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "T", vim.lsp.buf.hover, opts)
    end,
});

vim.keymap.set("n", "<Leader>do", vim.diagnostic.open_float)

