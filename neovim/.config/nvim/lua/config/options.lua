vim.opt.number = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.mouse = 'a'           -- enable mouse
vim.opt.ignorecase = true     -- to enable smartcase
vim.opt.smartcase = true      -- case insensitive search in lowercase and sensitive otherwise
vim.opt.expandtab = true      -- fill tabs with spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Stop jumping left gutter from warnings
vim.opt.signcolumn = "yes"

-- Highlight cursor line
vim.opt.cursorline = true
vim.cmd([[set mousescroll=ver:1,hor:6]])
