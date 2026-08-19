
-- Project.nvim

require("project_nvim").setup({
  -- Manual mode doesn't change the root automatically unless you tell it to
  -- "pattern" is usually better as it looks for .git
  detection_methods = { "pattern" },
  patterns = { ".git", "Makefile", "package.json" },
  silent_chdir = false, -- Set to true if you don't want a message when the dir changes
})

vim.keymap.set('n', '<leader>fp', function()
  require('telescope').extensions.projects.projects()
end, { desc = "Find Projects" })
