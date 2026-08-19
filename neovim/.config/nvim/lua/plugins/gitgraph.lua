
require('gitgraph').setup {
  git_cmd = "git",
  symbols = {
    -- -- default
    -- merge_commit = 'M',
    -- commit = '*',

    -- ghostty or kitty
    merge_commit     = '',
    commit           = '',
    merge_commit_end = '',
    commit_end       = '',

    -- Advanced symbols
    GVER             = '',
    GHOR             = '',
    GCLD             = '',
    GCRD             = '╭',
    GCLU             = '',
    GCRU             = '',
    GLRU             = '',
    GLRD             = '',
    GLUD             = '',
    GRUD             = '',
    GFORKU           = '',
    GFORKD           = '',
    GRUDCD           = '',
    GRUDCU           = '',
    GLUDCD           = '',
    GLUDCU           = '',
    GLRDCL           = '',
    GLRDCR           = '',
    GLRUCL           = '',
    GLRUCR           = '',
  },
  format = {
    timestamp = '%H:%M:%S %d-%m-%Y',
    fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
  },
  hooks = {
    on_select_commit = function(commit)
      print('Opening diff for: ' .. commit.hash)
      require("diffview").open({ commit.hash .. "^!" })
    end,
    on_select_range_commit = function(from, to)
      print('Opening diff from ' .. from.hash .. ' to ' .. to.hash)
      require("diffview").open({ from.hash, '..', to.hash })
    end,
  },
  keys = {
    {
      "<leader>gl",
      function()
        require('gitgraph').draw({}, { all = true, max_count = 5000 })
      end,
      desc = "GitGraph - Draw",
    }
  },
  log_level = 0
}

vim.keymap.set('n', '<leader>gl',
  function()
    require('gitgraph').draw({}, { all = true, max_count = 5000 })
  end,
  { desc = 'GitGraph - Draw' }
)


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitgraph" },
  callback = function(args)
    vim.keymap.set('n', 'j', '2j', { buffer = args.buf, noremap = true })
    vim.keymap.set('v', 'j', '2j', { buffer = args.buf, noremap = true })
    vim.keymap.set('n', 'k', '2k', { buffer = args.buf, noremap = true })
    vim.keymap.set('v', 'k', '2k', { buffer = args.buf, noremap = true })

    vim.keymap.set('n', 'gj', 'j', { buffer = args.buf, noremap = true })
    vim.keymap.set('v', 'gj', 'j', { buffer = args.buf, noremap = true })
    vim.keymap.set('n', 'gk', 'k', { buffer = args.buf, noremap = true })
    vim.keymap.set('v', 'gk', 'k', { buffer = args.buf, noremap = true })
  end,
})
