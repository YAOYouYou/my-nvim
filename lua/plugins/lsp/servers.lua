local M = {}

local masonconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local lsp_utils = require("plugins.lsp.utils")
local icons = require("config.icons")

local function lsp_init()
	local signs = {
		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- LSP handlers configuration
	local config = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},

		diagnostic = {
			-- virtual_text = false,
			-- virtual_text = { spacing = 4, prefix = "●" },
			virtual_text = {
				severity = {
					min = vim.diagnostic.severity.ERROR,
				},
			},
			signs = {
				active = signs,
			},
			underline = false,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			-- virtual_lines = true,
		},
	}

	-- Diagnostic configuration
	vim.diagnostic.config(config.diagnostic)

	-- Hover configuration
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)

	-- Signature help configuration
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

local servers = {
    "pyright",
    "gopls",
    "lua_ls",
}

local masonsetup = function()
	masonconfig.setup({
		ensure_installed = servers,
		automatic_installation = true,
	})
end

local lspsetup = function()
    local opts = {
        capabilities = lsp_utils.capabilities()
    }
    for _, server in pairs(servers) do
        lspconfig[server].setup(opts)
    end
end


function M.setup(_, _)
    lsp_utils.on_attach(function(client, buffer)
		require("plugins.lsp.format").on_attach(client, buffer)
		require("plugins.lsp.keymaps").on_attach(client, buffer)
	end)

	lsp_init() -- diagnostics, handlers

    masonsetup()
    lspsetup()
end

return M
