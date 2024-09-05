-- wikilink follow
local notes_path = vim.env.HOME .. "/notes/"
vim.opt.path:append (notes_path .. "**")
vim.opt.suffixesadd = '.md'
vim.keymap.set("n", "wf", "vi[gf")


-- vim pencil
vim.g["pencil#wrapModeDefault"] = "soft"
vim.cmd('autocmd FileType markdown,mkd call pencil#init()')
vim.cmd('autocmd FileType markdown,mkd setlocal spell')


-- daily notes
local journal_path = notes_path .. "Personal/Journal/"
local daily = os.date("%Y-%m-%d") .. ".md"
vim.keymap.set("n", "<leader>d", ":edit " .. journal_path .. daily .. "<cr>")

