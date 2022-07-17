local sumneko_root_path = "/Users/john/personal/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local cmp = require("cmp")
local lspkind = require("lspkind")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

cmp.setup({
    snippet = {
        expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
    },

    formatting = {
        format = lspkind.cmp_format()
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
            vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
        end,
    }, _config or {})
end

require'lspconfig'.ansiblels.setup(config())

require'lspconfig'.dockerls.setup(config())

require'lspconfig'.tsserver.setup(config())

require'lspconfig'.eslint.setup(config())

require'lspconfig'.cssls.setup(config())

require'lspconfig'.sumneko_lua.setup(config())
