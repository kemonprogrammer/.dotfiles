-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  sort = {
    sorter = "name",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    highlight_git = "name", -- Options: "name", "icon", or "all" (true acts as "name")

    icons = {
      show = {
        git = false, -- Disables git status icons (✓, ✗, ★, etc.)
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    git_ignored = false,
  },
})

vim.keymap.set('n', '<leader>e', function()
  vim.cmd('NvimTreeFindFileToggle')
end, { desc = 'toggle tree with finding file' })

vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { fg = "#E5C07B" })   -- Modified / Unstaged
vim.api.nvim_set_hl(0, "NvimTreeGitFileStagedHL", { fg = "#98C379" })  -- Staged
vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { fg = "#56B6C2" })     -- Untracked / New
vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL", { fg = "#5C6370" }) -- Ignored
vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL", { fg = "#E06C75" }) -- Deleted
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { link = "Normal", force = true })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { link = "Normal", force = true })

-- vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#434c5e" })
