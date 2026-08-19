-- --- Color schemes ---
-- vscode-like colorscheme
-- colorscheme codedark
vim.opt.termguicolors = true
-- vim.cmd([[
-- colorscheme rippedcasts

-- ]])
vim.cmd('colorscheme codedark')

-- jetbrains-like colorscheme
--colorscheme darcula

-- Add these lines after: vim.cmd('colorscheme codedark')
vim.api.nvim_set_hl(0, 'Search', { bg = '#264f78', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#61afef', fg = '#282c34', bold = true })


vim.api.nvim_set_hl(0, "CursorLine", { bg = "#343434" })
-- Makes the warning a curly undercurl instead of a solid strike
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = muted_warning, undercurl = true })
