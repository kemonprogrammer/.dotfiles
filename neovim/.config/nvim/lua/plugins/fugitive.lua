-- --- Fugitive ---
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>gdd", "<cmd>Gvdiffsplit HEAD<CR>")
vim.keymap.set("n", "<leader>gds", "<cmd>Gvdiffsplit !<CR>")
vim.keymap.set("n", "<leader>gcc", "<cmd>Git commit<CR>")
vim.keymap.set("n", "<leader>gcam", "<cmd>Git commit --amend --no-edit<CR>")
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>")
vim.keymap.set("n", "<leader>gps", "<cmd>Git push<CR>")
vim.keymap.set('n', '<leader>gpf', "<cmd>Git push --force-with-lease<CR>")
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>")

vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>")  -- git checkout .
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>") -- git add %
