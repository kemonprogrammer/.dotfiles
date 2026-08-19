-- --- Telescope ---

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function()
  builtin.find_files({ hidden = true, })
end)
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ hidden = true, })
end)
vim.keymap.set('n', '<leader>fi', function()
  builtin.find_files({ hidden = true, no_ignore = true })
end)

vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({ hidden = true, })
end, { desc = 'Search text in files' })

vim.keymap.set('n', '<C-g>', function()
  builtin.live_grep({ hidden = true, })
end, {})

-- -- doesn't work
-- -- custom highlights, regardless of the colorscheme
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     -- Clear the background of the selected line in preview (removes the big blue block)
--     vim.api.nvim_set_hl(0, "TelescopePreviewLine", { bg = "NONE", fg = "NONE" })

--     -- Highlight the exact search match
--     vim.api.nvim_set_hl(0, "TelescopePreviewMatch", { bg = "#e5c07b", fg = "#282c34", bold = true })
--   end,
-- })
-- vim.cmd("doautocmd ColorScheme")

local actions = require("telescope.actions")

require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "^.git/",
      "dist",
      "build",
      "%.lock",
    },
    preview = {
      treesitter = false,
    },
    -- wrap_results = true,
    mappings = {
      i = {
        ["<esc>"] = actions.close, -- Close on first Esc
        ["<C-c>"] = actions.close, -- Close on first
        -- ["<C-c>"] = { "<esc>", type = "command" }, -- Ctrl-C to enter Normal Mode
      },
    },
  },
})

-- disable lsp and search highlight in Telescope prompt
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
    -- vim.opt_local.winhighlight:append("Search:None,IncSearch:None")
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.wrap = true
  end,
})
