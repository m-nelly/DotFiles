local dap, dapui = require('dap'), require('dapui')
dapui.setup()
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('nvim-dap-virtual-text').setup()

-- set default keymaps (:h dap-mappings)
vim.api.nvim_set_keymap("n", "<F5>", ':lua require("dapui").toggle()<CR>', {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>b", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>c", ":DapContinue<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>R", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})

-- mason for installation of dbg providers
require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "python", "stylua", "jq", "codelldb" },
	automatic_installation = true,
	handlers = {},
})

dap.adapters.codelldb = {
	name = "codelldb server",
	type = 'server',
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
		args = { "--port", "${port}" },
	}
}
