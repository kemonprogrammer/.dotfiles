-- --- Mappings ---

-- Copy to system clipboard using ALT+c
vim.keymap.set('n', '<M-c>', '"+yy', { desc = 'Copy line to system clipboard' })
vim.keymap.set('v', '<M-c>', '"+y', { desc = 'Copy selection to system clipboard' })
vim.keymap.set('c', '<M-c>', function()
  local cmd = vim.fn.getcmdline()
  vim.fn.setreg('+', cmd)
end, { desc = 'Copy current command line to clipboard' })

-- Copy command output to system clipboard using `:CopyOutput SomeVimCommand`
-- Could also do `:let @+ = execute(@:)`
vim.api.nvim_create_user_command('CopyOutput', function(opts)
  local obj = vim.api.nvim_exec2(opts.args, { output = true })
  vim.fn.setreg('+', obj.output)
end, { nargs = 1 })

-- Paste from system clipboard, maybe CTRL+SHIFT+v is faster
vim.keymap.set('i', '<C-r>+', '<C-r><C-o>+')

vim.keymap.set('i', '<C-r>"', '<C-r><C-o>"')



-- todo back key to CTRL-o and forward key to CTRL-i
-- vim.keymap.set({ 'n', 'i', 'v' }, '<X1Mouse>', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', '<F13>', '<C-o>')
vim.keymap.set('n', '<F14>', '<C-i>')

-- Disable CTRL + c message
vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })

-- CTRL-S to save
vim.keymap.set('n', '<C-s>', function()
  vim.cmd('update')
  print("Written")
end, { desc = 'Save' })
vim.api.nvim_set_keymap('v', '<C-s>', '<cmd>update<CR>', { desc = 'Save' })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o><cmd>update<CR>', { desc = 'Save and return to insert mode' })

---- Leader shortcuts
vim.keymap.set('n', '<leader>e', function()
  -- Evaluate the Vimscript dictionary method directly
  local is_open = vim.api.nvim_eval('g:NERDTree.IsOpen()') == 1

  if is_open then
    vim.cmd('NERDTreeToggle')
  else
    vim.cmd('NERDTreeFind')
  end
end, { desc = 'Find or Close NERDTree' })
-- vim.keymap.set('n', '<leader>er', '<cmd>NERDTreeFind<CR>', { desc = 'Toggle Nerdtree' })

---- nmap <Leader>fzf :Files<CR>
--nmap <Leader>f :GFiles<CR>

vim.keymap.set('n', '<leader>pc', '<cmd>PlugClean<CR>', { desc = 'Plug Clean' })
vim.keymap.set('n', '<leader>pi', '<cmd>PlugInstall<CR>', { desc = 'Plug Install' })
vim.keymap.set('n', '<leader>pu', '<cmd>PlugUpdate<CR>', { desc = 'Plug Update' })
vim.keymap.set('n', '<leader>so', function()
  vim.cmd('source ' .. vim.env.MYVIMRC)
  print("Sourced")
end, { desc = 'Source init.lua' })


local maximize_session = nil
local maximize_hidden_save = nil

local function maximize_toggle()
  if maximize_session then
    vim.cmd("source " .. maximize_session)
    vim.fn.delete(maximize_session)
    maximize_session = nil
    vim.o.hidden = maximize_hidden_save
    maximize_hidden_save = nil
  else
    maximize_hidden_save = vim.o.hidden
    maximize_session = vim.fn.tempname()
    vim.o.hidden = true
    vim.cmd("mksession! " .. maximize_session)
    vim.cmd("only")
  end
end

vim.keymap.set("n", "<C-W>O", maximize_toggle, { desc = "Maximize toggle" })
vim.keymap.set("n", "<C-W>o", maximize_toggle, { desc = "Maximize toggle" })
vim.keymap.set("n", "<C-W><C-O>", maximize_toggle, { desc = "Maximize toggle" })

vim.keymap.set('n', '<F8>', ':let mycurf=expand("<cfile>")<cr><c-w>p:execute("e ".mycurf)<cr>')
