vim.notify = require("notify")

-- Create an autocmd group for hot-reloading
local nvim_reload_grp = vim.api.nvim_create_augroup("NvimReload", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = nvim_reload_grp,
  -- Match any lua file saved anywhere to pass it to the callback
  pattern = "*.lua",
  callback = function(args)
    -- Get the absolute path of the file that triggered the event
    local filepath = vim.api.nvim_buf_get_name(args.buf)

    -- Check if the path contains ".config/nvim/" anywhere
    if filepath:match("%.config/nvim/") then
      Reload_config()
    end
  end,
})


vim.keymap.set('n', '<leader>nc', function()
  require("notify").dismiss({ pending = true, silent = true })
end, { desc = "Dismiss all notifications" })
