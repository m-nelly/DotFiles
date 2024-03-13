vim.opt.signcolumn = "number"

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  rnix = {},
	tsserver = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				workspace = {
					checkThirdParty = false,
					library = {
						'${3rd}/luv/library',
						unpack(vim.api.nvim_get_runtime_file('', true)),
					},
				},
				completion = {
					callSnippet = 'Replace',
				},
			},
		},
	},
}

require('mason').setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	'stylua', 
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	},
}
end,
}
