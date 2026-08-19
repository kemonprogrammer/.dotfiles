-- ## Diffview
local muted_fg = "#434c5e" -- blue/grey


vim.opt.fillchars:append({ diff = "╱", eob = " " })


-- Colors

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- add and change filler characters
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2d4f34" })    -- dark green
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#2b3a4a" }) -- dark blue

    -- Deletion
    -- right side (filler characters)
    vim.api.nvim_set_hl(0, "DiffviewDiffFill", { fg = muted_fg, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = muted_fg, bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = muted_fg, bg = "NONE" })
    -- left side
    vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#522b2b" }) -- dark red
  end,
})
vim.cmd("doautocmd ColorScheme")


vim.api.nvim_create_autocmd("User", {
  pattern = "DiffviewDiffBufWinEnter",
  callback = function()
    if vim.wo.diff then
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#522b2b" })
    end
  end,
})

-- Keymaps

vim.keymap.set('v', '<leader>gh', ':DiffviewFileHistory<CR>', {
  desc = 'Diffview: Selected lines history',
  silent = true,
})

-- diff view close with 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "DiffviewFiles", "DiffviewFileHistory" },
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>DiffviewClose<CR>', { buffer = args.buf, silent = true })
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "DiffviewDiffBufWinEnter",
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>DiffviewClose<CR>', { buffer = args.buf, silent = true })
  end,
})


