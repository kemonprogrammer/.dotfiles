
require("nvim-treesitter").setup({
  -- Ensure you have language parsers installed
  ensure_installed = { "lua", "python", "javascript", "go" },
  sync_install = false,
  auto_install = true, -- Automatically install missing parsers when entering buffer
  highlight = { enable = true },
})
-- # Tree-Sitter 
require("nvim-treesitter-textobjects").setup({
  -- Configure textobjects extension
  select = {
    enable = true,
    lookahead = true, -- Automatically jump forward to textobj
    -- keymaps = {
    --   ["af"] = "@function.outer",
    --   ["if"] = "@function.inner",
    --   ["ac"] = "@class.outer",
    --   ["ic"] = "@class.inner",
    -- },
  },
})
local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

-- Object motions

-- function
vim.keymap.set({ "n" }, "[[", function()
  move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Next function" })
vim.keymap.set({ "n" }, "]]", function()
  move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function" })

vim.keymap.set({ "n" }, "[]", function()
  move.goto_previous_end("@function.outer", "textobjects")
end, { desc = "Next function" })
vim.keymap.set({ "n" }, "][", function()
  move.goto_next_end("@function.outer", "textobjects")
end, { desc = "Next function" })

vim.keymap.set({ "n" }, "[f", function()
  move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Next function" })
vim.keymap.set({ "n" }, "]f", function()
  move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function" })

-- class
vim.keymap.set({ "n" }, "[c", function()
  move.goto_previous_start("@class.outer", "textobjects")
end, { desc = "Next function" })

vim.keymap.set({ "n" }, "]c", function()
  move.goto_next_start("@class.outer", "textobjects")
end, { desc = "Next function" })

-- Text objects

-- function
vim.keymap.set({ "x", "o" }, "af", function()
  select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select outer function" })

vim.keymap.set({ "x", "o" }, "if", function()
  select.select_textobject("@function.inner", "textobjects")
end, { desc = "Select inner function" })

-- class
vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end, { desc = "Select outer class" })

vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner class" })

-- conditionals (if / else)
vim.keymap.set({ "x", "o" }, "ai", function()
  select.select_textobject("@conditional.outer", "textobjects")
end, { desc = "Select outer conditional" })

vim.keymap.set({ "x", "o" }, "ii", function()
  select.select_textobject("@conditional.inner", "textobjects")
end, { desc = "Select inner conditional body" })

-- loops (for / while)
vim.keymap.set({ "x", "o" }, "al", function()
  select.select_textobject("@loop.outer", "textobjects")
end, { desc = "Select outer loop" })

vim.keymap.set({ "x", "o" }, "il", function()
  select.select_textobject("@loop.inner", "textobjects")
end, { desc = "Select inner loop body" })
