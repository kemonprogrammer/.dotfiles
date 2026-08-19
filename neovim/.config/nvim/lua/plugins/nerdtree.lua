-- ----  File Explorer  ----
-- --- NERDTree ---
--
-- -- Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
--
-- -- Exit Vim if NERDTree is the only window remaining in the only tab.
-- -- autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
--
-- -- Close the tab if NERDTree is the only window remaining in it.
-- autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
--
-- -- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
-- autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
--     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

vim.g.NERDTreeColorMapCustom = {
  Modified  = { "#4FF0FF", "Cyan", "NONE", "NONE" },
  Staged    = { "#62CC47", "Green", "NONE", "NONE" },
  Untracked = { "#D1675A", "Red", "NONE", "NONE" },
  Dirty     = { "#4FF0FF", "Cyan", "NONE", "NONE" },
  Clean     = { "#A9B837", "Grey", "NONE", "NONE" }
}


-- Treesitter enable highlight on each new buffer
-- ??
vim.g.NERDTreeShowHidden = 1

