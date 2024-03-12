-- lazy 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- neovim configuration
local opt = vim.opt
local map = vim.keymap.set

-- basic options
opt.compatible = false
opt.cursorline = true
opt.mouse = 'a'
vim.cmd 'syntax enable'
opt.showmatch = true
opt.showcmd = true
opt.clipboard = "unnamedplus"
opt.timeoutlen = 1000
opt.ttimeoutlen = 5

-- telescope 
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

-- note taking
local notes_path = vim.env.HOME .. "/notes/"
local journal_path = notes_path .. "Personal/Journal/"
local templates_path = notes_path .. "Admin/Templates/"
local daily = os.date("%Y-%m-%d") .. ".md"

map("n", "wf", "vi[gf")
map("n", "<leader>z", ":lua require'zen-mode'.toggle({window={backdrop=1,width=90},options={cursorline=false}})<cr>")


vim.g["pencil#wrapModeDefault"] = "soft"

opt.conceallevel = 0
opt.path:append (notes_path .. "**")
opt.suffixesadd = '.md'

vim.cmd('autocmd FileType markdown,mkd call pencil#init()')
vim.cmd('autocmd FileType markdown,mkd setlocal spell')
vim.cmd('autocmd FileType markdown,mkd setlocal nonumber')
vim.cmd('autocmd FileType markdown,mkd setlocal nocursorline')

-- indentation
local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.shiftround = true
opt.smartindent = true

-- text appearance
opt.wrap = true
opt.list = false
opt.linebreak = true
opt.listchars = 'tab:⎢ '

-- line numbers
opt.number = true
opt.numberwidth = 2

-- status line
opt.laststatus = 0

-- split
opt.splitbelow = true
opt.splitright = true

-- cursor line
vim.cmd('hi cursorline cterm=none term=none')
vim.cmd('autocmd WinEnter * setlocal cursorline')
vim.cmd('autocmd WinLeave * setlocal nocursorline')

-- color scheme
vim.cmd([[colorscheme tokyonight-moon]])

-- lsp
vim.opt.signcolumn = "number"
--lua
  require'lspconfig'.lua_ls.setup {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
-- nix 
require'lspconfig'.rnix.setup{}

-- python
require'lspconfig'.pylsp.setup{
    settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}

-- rust
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}
