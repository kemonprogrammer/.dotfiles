-- Stop jumping left gutter from warnings vim.opt.signcolumn = "yes"


-- Highlight cursor line
vim.opt.cursorline = true


vim.cmd([[set mousescroll=ver:1,hor:6]])


-- vim.cmd("colorscheme " .. vim.g.colors_name)

-- Needs to be done before plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----  Plugins  ----
local Plug = vim.fn['plug#']
--local Fzf = vim.fn['fzf#']

-- vim.call('plug#begin', '~/.config/nvim/plugged')
vim.call('plug#begin')

-- surround.vim
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

-- colorschemes
-- Plug 'doums/darcula'
-- Plug 'flazz/vim-colorschemes'
Plug 'tomasiser/vim-code-dark'

Plug 'luukvbaal/statuscol.nvim'

-- smooth scrolling
-- Plug 'psliwka/vim-smoothie'

-- comments
-- Plug 'tpope/vim-commentary'
Plug 'numToStr/Comment.nvim'

Plug 'rcarriga/nvim-notify'
-- statusline
-- Plug 'vim-airline/vim-airline'

-- Fuzzy finder
Plug('junegunn/fzf', { ['do'] = './install --all' })
Plug 'junegunn/fzf.vim'

-- Highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Auto-pairs
-- Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'isakbm/gitgraph.nvim'

-- Latex
Plug 'lervag/vimtex'
Plug 'nvim-telescope/telescope-bibtex.nvim'
Plug 'barreiroleo/ltex_extra.nvim' -- add dictionary for latex language server

-- LSP
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- LSP Lua
Plug('folke/lazydev.nvim', { ['for'] = 'lua' })
Plug 'Bilal2453/luvit-meta'

-- Completion manager
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
-- Snippets
Plug 'L3MON4D3/LuaSnip'         -- Snippet engine (required for most cmp setups)
Plug 'saadparwaiz1/cmp_luasnip' -- Bridge between LuaSnip and nvim-cmp
Plug 'rafamadriz/friendly-snippets'

-- speed up
-- Plug 'nvimtools/hydra.nvim'

-- Plug 'gelguy/wilder.nvim'   -- blocks main thread, can't ignore system commands `!`
-- Plug 'ncm2/ncm2'
-- Plug 'roxma/nvim-yarp'

-- NOTE: you need to install completion sources to get completions. Check
-- our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
-- Plug 'ncm2/ncm2-bufword'
-- Plug 'ncm2/ncm2-path'

-- Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio' -- Required by dap-ui
Plug 'rcarriga/nvim-dap-ui'
Plug 'jbyuki/one-small-step-for-vimkind'

Plug 'nvim-neotest/nvim-nio'
Plug 'mfussenegger/nvim-dap'
Plug('Joakker/lua-json5', { ['do'] = './install.sh' })

-- Project based
Plug 'ahmedkhalf/project.nvim'

-- Dashboard & Icons
Plug 'goolord/alpha-nvim'
Plug 'nvim-tree/nvim-web-devicons'

-- File finder
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ['branch'] = 'master' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
-- Plug 'scrooloose/nerdtree-project-plugin'  -- line 45 throws an error
Plug 'ryanoasis/vim-devicons'



-- etc
Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')


----  Settings  ----
vim.opt.number = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.mouse = 'a'           -- enable mouse
vim.opt.ignorecase = true     -- to enable smartcase
vim.opt.smartcase = true      -- case insensitive search in lowercase and sensitive otherwise
vim.opt.expandtab = true      -- fill tabs with spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Status column
require('statuscol').setup({
  -- right align numbers
  relculright = true,

  -- segments = {
  --   { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
  --   {
  --     sign = { namespace = { 'diagnostic/signs' }, maxwidth = 2, auto = true },
  --     click = 'v:lua.ScSa'
  --   },
  --   { text = { builtin.lnumfunc }, click = 'v:lua.ScLa', },
  --   {
  --     sign = { name = { '.*' }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --     click = 'v:lua.ScSa'
  --   },
  -- }
})


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



-- --- Mappings ---
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
---- TODO: try neovims beta feature CTRL+S
--inoremap <silent> <C-S> <C-O>:update<CR>
--imap('<C-s>', '<C-O>:update<CR>')

---- Leader shortcuts
vim.keymap.set('n', '<leader>e', '<cmd>NERDTreeToggle<CR>', { desc = 'Toggle Nerdtree' })
--nnoremap <leader>et :NERDTreeToggle<CR>
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

-- # Notify
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
      -- Source your main init.lua
      vim.cmd("source " .. vim.env.MYVIMRC)

      -- Notify user
      vim.notify("Config reloaded", vim.log.levels.INFO, { title = "Neovim" })
    end
  end,
})


local function make_repeatable(key, action)
  return function()
    action()
    vim.fn['repeat#set'](vim.api.nvim_replace_termcodes(key, true, false, true))
  end
end


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

---- Autocenter
----nnoremap G Gzz
--nmap('G', 'Gzz')
----nnoremap g; g;zz
--nmap('g;', 'g;zz')
----nnoremap g, g,zz
--nmap('g,', 'g,zz')
----nnoremap n nzz
--nmap('n', 'nzz')
----nnoremap N Nzz
--nmap('N', 'Nzz')
----nnoremap { {zz
--nmap('{', '{zz')
----nnoremap } }zz
--nmap('}', '}zz')
------ nmap <C-U> <C-U>zz
--nmap('<C-u>', '<C-u>zz')
------ nmap <C-D> <C-D>zz
--nmap('<C-d>', '<C-d>zz')

--- etc
---- Open file under cursor in split window
--nnoremap <F8> :let mycurf=expand("<cfile>")<cr><c-w>p:execute("e ".mycurf)<cr>
vim.keymap.set('n', '<F8>', ':let mycurf=expand("<cfile>")<cr><c-w>p:execute("e ".mycurf)<cr>')

-- Staggering increment start by one,
-- because I only use it to convert 1. 1. ... into 1. 2. ...
--vnoremap g<C-a> g<C-a>gv<C-x><Esc>
-- vmap('g<C-a>', 'g<C-a>gv<C-x><Esc>')
-- vmap('g<C-x>', 'g<C-x>gv<C-a><Esc>')

---- Single insert commands
--
--
---- nmap <Enter> o<ESC>
--nmap('<CR>', 'o<Esc>')
---- nmap <A-Enter> O<ESC>
--nmap('<S-CR>', 'O<Esc>')
--
--
----  Try to jump to next method
---- :map [[ ?{<CR>w99[{
---- :map ][ /}<CR>b99]}
---- :map ]] j0[[%/{<CR>
---- :map [] k$][%?}<CR>


-- # Comments
-- Also use CTRL + / in insert mode to toggle comments

local function toggle_comment()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line_before = vim.api.nvim_get_current_line()

  -- Toggle the comment on the current line
  require('Comment.api').toggle.linewise.current()

  local line_after = vim.api.nvim_get_current_line()

  -- Calculate offset based on line length difference (handles both commenting & uncommenting)
  local diff = #line_after - #line_before
  if vim.bo.filetype == 'html' then
    if diff < 0 then
      diff = diff + 4
    else
      diff = diff - 4
    end
  end
  local new_col = math.max(0, col + diff)

  -- Move cursor to adjust for inserted/removed characters
  vim.api.nvim_win_set_cursor(0, { row, new_col })
end

vim.keymap.set({'n', 'i'}, '<C-/>', toggle_comment, { desc = 'Toggle comment' })

vim.keymap.set('x', '<C-/>', '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>')

-- # Yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      -- higroup = 'Visual',
      timeout = 200,
    })
  end,
})


-- --- Color schemes ---
-- vscode-like colorscheme
-- colorscheme codedark
vim.opt.termguicolors = true
-- vim.cmd([[
-- colorscheme rippedcasts

-- ]])
vim.cmd('colorscheme codedark')

-- jetbrains-like colorscheme
--colorscheme darcula

-- Add these lines after: vim.cmd('colorscheme codedark')
vim.api.nvim_set_hl(0, 'Search', { bg = '#264f78', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#61afef', fg = '#282c34', bold = true })



-- Treesitter enable highlight on each new buffer
-- ??
vim.g.NERDTreeShowHidden = 1

-- Check if we are running in WSL
local is_wsl = (function()
  local handle = io.popen("uname -r")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:lower():find("microsoft") ~= nil
  end
  return false
end)()



-- Project based

-- Dashboard
local alpha = require("alpha")
local dashboard = require("alpha.themes.theta")
-- dashboard.file_icons.provider = "devicons"
-- dashboard.buttons.val = {
--     -- dashboard.button("t", "󰈙  Open Thesis Project", function() open_thesis() end),
--     dashboard.button("p", "󱔗  Recent Projects", ":Telescope projects<CR>"),
--     dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
--     dashboard.button("g", "󰊄  Live Grep", ":Telescope live_grep<CR>"),
--     dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
-- }

alpha.setup(dashboard.config)

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



-- --- Telescope ---

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search text in files' })
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

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

require('telescope').setup {
  defaults = {
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
}

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



-- --- LSP ---

require("mason").setup()
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<CR>", { desc = "LSP started" })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "LSP restarted" })
vim.keymap.set("n", "<leader>le", "<cmd>LspStop<CR>", { desc = "LSP stopped" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set('n', '<leader>co', function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports.vtsls" },
      diagnostics = {},
    },
  })
end, { desc = "Organize / Add Imports" })


-- Lua Lsp types, needs to be set up before lua-ls
require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
  },
})


require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "vtsls",
    "emmet_ls"
  },
})



local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config['lua_ls'] = {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/lua-language-server") },
  filetypes = { "lua" },
  capabilities = capabilities,

  root_dir = function()
    return vim.fn.getcwd()
  end,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim' }, -- Fix the "Undefined global 'vim'" warning
      },
      -- workspace = {
      --   -- Make the server aware of Neovim runtime files
      --   library = vim.api.nvim_get_runtime_file("", true),
      --   checkThirdParty = false,
      -- },
      telemetry = { enable = false },
    },
  },
}

vim.lsp.config['lua_ls'] = {
  -- filetypes = { "lua" },
  capabilities = capabilities,
}


-- Fix ltex race condition, by only initializing it once
-- also when opening up telescope immediately it shouldn't throws an error
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LtexExtraSafeSetup", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.name == "ltex" then
      -- Push the setup to the end of the event loop
      vim.schedule(function()
        -- CRITICAL: Abort if Telescope (or anything else) stole focus
        if vim.api.nvim_get_current_buf() == args.buf then
          -- Wrap in pcall to silently swallow any residual plugin panics
          pcall(function()
            require("ltex_extra").setup({
              load_langs = { "de-DE" },
              init_check = true,
              path = vim.fn.expand("~/.config/nvim/spell"), -- dictionary location
              log_level = "error",
            })
          end)
        end
      end)
    end
  end,
})

vim.lsp.enable('lua_ls')


vim.lsp.config['vtsls'] = {
  capabilities = capabilities,
  settings = {
    typescript = {
      suggest = {
        completeFunctionCalls = true,
      },
      -- Enable automatic import additions on completion
      preferences = {
        importModuleSpecifier = "shortest",
        includePackageJsonAutoImports = "auto",
      },
      -- Enable inlay hints if you use them
      inlayHints = {
        parameterNames = { enabled = "all" },
        variableTypes = { enabled = true },
      },
    },
    javascript = {
      suggest = {
        completeFunctionCalls = true,
      },
      preferences = {
        importModuleSpecifier = "shortest",
      },
    },
    vtsls = {
      -- Automatically handle workspace actions
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
    },
  },
}

-- 3. Enable LSPs
vim.lsp.enable("vtsls")

-- --- Completion manager ---
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          -- Pass select = true so selecting an item automatically triggers LSP import edits
          cmp.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          })
        end
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- This makes the snippets show up in the menu
  }, {
    { name = 'buffer' },
  })
})


-- --- Latex ---

if is_wsl then
  -- SumatraPDF path (WSL path to the Windows .exe)
  local sumatra_path = '/mnt/c/Users/MichaelLuu/AppData/Local/SumatraPDF/SumatraPDF.exe'

  vim.g.vimtex_view_general_viewer = sumatra_path
  vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
end


-- Auto-compile on save (Vimtex does this by default with latexmk)
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_quickfix_open_on_warning = 0

vim.keymap.set('n', '<leader>lw', function()
  -- Check if the quickfix window is currently open
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  local action = qf_winid > 0 and 'cclose' or 'copen'

  -- Execute open or close silently
  pcall(vim.cmd, action)
end, { desc = 'Toggle Quickfix (Vimtex Errors)', silent = true })

-- -- Can't do that, because of quotes inside code listings
-- -- Create an augroup to manage LaTeX-specific settings
-- local tex_group = vim.api.nvim_create_augroup("TexFormat", { clear = true })

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "tex",
--     group = tex_group,
--     callback = function()
--         vim.keymap.set('n', '<C-M-l>', function()
--             -- -- 1. Save current view (cursor position and scroll)
--             -- local view = vim.fn.winsaveview()

--             -- 2. Run the quote replacement (silent 'e' flag to avoid errors if no quotes found)
--             vim.cmd([[silent! %s/"\(.\{-}\)"/\\enquote{\1}/g]])

--             -- -- 4. Restore the view
--             -- vim.fn.winrestview(view)

--             print("LaTeX quotes replaced")
--         end, { buffer = true, desc = "Fix quotes" })
--     end,
-- })
vim.keymap.set('n', '<C-M-l>', vim.lsp.buf.format, { desc = 'Format whole file' })


-- --- Latex LSP ---

vim.lsp.config['texlab'] = {
  settings = {
    texlab = {
      completion = {
        matcher = "prefix",
        -- Allow vimtex to handle completions if you prefer
        vimtex = { enabled = true }
      }
    }
  }
}


vim.lsp.enable('texlab')


-- Writing

vim.lsp.config['ltex'] = {
  filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "tex", "pandoc" },
  flags = {
    debounce_text_changes = 300,
    exit_timeout = false,
  },
  settings = {
    ltex = {
      language = "de-DE",
      additionalRules = {
        enablePickyRules = true,
      },
      langauge = {
        commands = {
          svgsetup = "ignore",
          svgpath = "ignore",
          hyphenation = "ignore",
          usepackage = "ignore",
        },
      }
    }
  }
}


vim.lsp.enable('ltex')


-- --- Git ---

-- --- Fugitive ---
vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>")
vim.keymap.set("n", "<leader>gdd", "<cmd>Gvdiffsplit HEAD<CR>")
vim.keymap.set("n", "<leader>gds", "<cmd>Gvdiffsplit !<CR>")
vim.keymap.set("n", "<leader>gcc", "<cmd>Git commit<CR>")
vim.keymap.set("n", "<leader>gcam", function()
  vim.cmd('Git add --all')
  vim.cmd('Git commit --amend --no-edit')
end, { desc = 'Git amend and force-with-lease' })
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>")
vim.keymap.set("n", "<leader>gps", "<cmd>Git push<CR>")
vim.keymap.set('n', '<leader>gpf', function()
  vim.cmd('Git commit --amend --no-edit')
  vim.cmd('Git push --force-with-lease')
end, { desc = 'Git amend and force-with-lease' })
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>")

vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>")  -- git checkout .
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>") -- git add %

-- --- Git signs ---

-- Define the Hunk Navigation Logic (Fixed)
local function nav_hunk(dir)
  local gitsigns = require('gitsigns')
  if vim.wo.diff then
    vim.cmd('normal! ' .. (dir == 'next' and ']h' or '[h'))
  else
    gitsigns.nav_hunk(dir)
  end

  -- Force synchronous screen centering and redraw
  -- so Hydra doesn't batch the visual updates until exit
  -- vim.cmd("normal! zz")
  -- vim.cmd("redraw")
end

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

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', make_repeatable(']h', function()
      nav_hunk('next')
    end), { desc = "Next hunk (repeatable)" })

    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[h', bang = true })
      else
        gitsigns.nav_hunk('prev')
        -- autocenter after
        vim.defer_fn(function()
          vim.cmd("normal! zz")
        end, 10) -- 10ms
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end
}

-- o only adds indentation, and not a comment
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- 'o' removes comment leader insertion on 'o'/'O'
    -- 'r' removes comment leader insertion on <Enter> in Insert mode
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})


-- --- Explorer ---
if is_wsl then
  vim.keymap.set("n", "<leader>se", "<cmd>silent !explorer.exe $(wslpath -w %:p:h)<CR>",
    { desc = "Open current file in explorer" })
else
  vim.keymap.set("n", "<leader>se", "<cmd>silent !xdg-open %:p:h<CR>",
    { desc = "Open current file in explorer" })
end

-- --- Filetype specific ---
-- autocmd keymap overrides have to be AFTER global overrides
-- .tex files visual jk
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "markdown", "plaintex", },
  callback = function()
    vim.keymap.set('n', 'j', 'gj', { buffer = true })
    vim.keymap.set('n', 'k', 'gk', { buffer = true })
    vim.keymap.set('n', '<leader>ca', function()
      -- This triggers the code action specifically for ltex
      vim.lsp.buf.code_action({
        filter = function(a) return a.title:match("Add .* to dictionary") end,
        apply = true,
      })
    end, { desc = "LTeX: Add word to dictionary" })
  end,
})

-- Autocommand to make specific buffers closeable with 'q'
-- find out file type using `:set filetype?`

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "fugitive", "lspinfo", "git", "help", "man", "gitsigns.diff", "gitgraph", "qf" },
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>bwipeout!<CR>', { buffer = args.buf, silent = true })
  end,
})

-- fugitive diff view
vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Map 'q' to close Fugitive diff windows",
  callback = function(args)
    -- Check if this buffer was generated by Fugitive (e.g., "blob", "index")
    local fugitive_type = vim.b[args.buf].fugitive_type

    if fugitive_type then
      vim.keymap.set("n", "q", "<cmd>diffoff | close<CR>", {
        buffer = args.buf,
        silent = true,
        nowait = true,
      })
    end
  end,
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

-- close q:, q/ and  q? with q
vim.api.nvim_create_autocmd("CmdWinEnter", {
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>close!<CR>', { buffer = args.buf, silent = true })
  end,
})

-- remove non-line numbers and fill char ~, -
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "bg" })


-- ## Diffview
local muted_fg = "#434c5e" -- blue/grey


vim.opt.fillchars:append({ diff = "╱", eob = " " })

-- colors
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
  callback = function(args)
    if vim.wo.diff then
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#522b2b" })
    end
  end,
})

vim.keymap.set('v', '<leader>gh', ':DiffviewFileHistory<CR>', {
  desc = 'Diffview: Selected lines history',
  silent = true,
})


-- gitgraph

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


--- Go

vim.lsp.config['gopls'] = {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

vim.lsp.enable('gopls')

-- Create an augroup to prevent duplicate autocmds on config reload
local go_fmt_group = vim.api.nvim_create_augroup("GoFormatAndImports", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  group = go_fmt_group,
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }

    -- buf_request_sync defaults to a 1000ms timeout.
    -- Set to 3000ms here to ensure slower machines/codebases don't drop the write.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)

    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          -- Updated for Neovim 0.11: get_clients replaces get_client_by_id
          local client = vim.lsp.get_clients({ id = cid })[1]
          local enc = (client and client.offset_encoding) or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end

    -- Format the buffer synchronously
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_set_hl(0, "CursorLine", { bg = "#343434" })
-- Makes the warning a curly undercurl instead of a solid strike
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = muted_warning, undercurl = true })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2e3440" })

-- set statusline+=%{get(b:,'gitsigns_status','')}

-- # Hydra
-- local Hydra = require("hydra")

-- 1. WINDOW NAVIGATION & RESIZING (<C-w>lhjk><)
-- Hydra({
--   name = "Window Management",
--   mode = "n",
--   body = "<C-w>", -- The native window prefix is your entry point
--   config = { color = "red" },
--   heads = {
--     -- { "h",     "<C-w>h" },
--     -- { "j",     "<C-w>j" },
--     -- { "k",     "<C-w>k" },
--     -- { "l",     "<C-w>l" },
--     { ">",     "5<C-w>>", { desc = "Resize +" } },
--     { "<",     "5<C-w><", { desc = "Resize -" } },
--     { "<Esc>", nil,       { exit = true } },
--   }
-- })

-- -- 2. VIEWPORT SCROLLING & CENTERING (zzbtb)
-- Hydra({
--   name = "Viewport Scroll",
--   mode = "n",
--   body = "z", -- Typing 'z' starts the hydra
--   config = { color = "red" },
--   heads = {
--     { "z",     "zz" }, -- 'zz' centers screen and keeps hydra open
--     { "t",     "zt" }, -- 't' now means 'zt'
--     { "b",     "zb" }, -- 'b' now means 'zb'
--     { "<Esc>", nil, { exit = true } },
--   }
-- })
--
-- -- 3. FORWARD NAVIGATION (]hch]m)
-- Hydra({
--   name = "Forward Jumps",
--   mode = "n",
--   body = "]", -- Typing ']' starts the hydra
--   config = { color = "red" },
--   heads = {
--     { "h",     function() nav_hunk('next') end, { desc = "Next Hunk" } },
--     { "c",     "]c",                            { desc = "Next Change" } },
--     { "]",     "]]",                            { desc = "Next Class/Method start" } },
--     { "m",     "]m",                            { desc = "Next Method start" } },
--     { "<Esc>", nil,                             { exit = true } },
--   }
-- })
--
-- -- 4. BACKWARD NAVIGATION ([hch]m)
-- Hydra({
--   name = "Backward Jumps",
--   mode = "n",
--   body = "[", -- Typing '[' starts the hydra
--   config = { color = "red" },
--   heads = {
--     { "h",     function() nav_hunk('prev') end, { desc = "Prev Hunk" } },
--     { "c",     "[c",                            { desc = "Prev Change" } },
--     { "[",     "[[",                            { desc = "Prev Class/Method start" } },
--     { "m",     "[m",                            { desc = "Prev Method start" } },
--     { "<Esc>", nil,                             { exit = true } },
--   }
-- })


-- # Debugger
-- ==========================================
-- 1. Initialize the UI Panels
-- ==========================================
require("dapui").setup()

-- ==========================================
-- 2. Configure the Lua Debug Server
-- ==========================================
local dap = require("dap")

dap.adapters.nlua = function(callback, config)
  callback({
    type = 'server',
    host = config.host or "127.0.0.1",
    port = config.port or 8086
  })
end

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}
dap.configurations.javascript = {
}
-- (See `:h dap-configuration`)

-- ==========================================
-- 3. Set Up Keymaps
-- ==========================================
-- Toggle a visual breakpoint dot on the current line
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

-- Start debugging or jump to the next breakpoint
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = "Continue/Start" })

-- Open or close the visual debug windows (Variables, Watch, Stack)
vim.keymap.set('n', '<leader>du', function() require('dapui').toggle() end, { desc = "Toggle Debugger UI" })

-- Launch the server 
vim.keymap.set('n', '<leader>os', function()
  require('osv').launch({ port = 8086 })
end, { desc = "Server Launch & Attach (OSV)" })


local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}

-- 1. Register the adapter directly
-- local vscode_js_path = vim.fn.stdpath("data") .. "/plugged/vscode-js-debug"


for _, adapter_type in ipairs({ "pwa-node", "pwa-chrome" }) do
  dap.adapters[adapter_type] = {
    type = "server",
    host = "localhost",
    port = "8123",
    executable = {
      command = "js-debug-adapter",
    },
  }
end

-- Setup nvim-dap signs & highlights
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

local dap_signs = {
  Breakpoint = { "B", "DiagnosticSignError" },
  BreakpointCondition = { "C", "DiagnosticSignWarn" },
  BreakpointRejected = { "R", "DiagnosticSignHint" },
  LogPoint = { "L", "DiagnosticSignInfo" },
  Stopped = { "➔", "DiagnosticSignWarn", "DapStoppedLine" },
}

for name, sign in pairs(dap_signs) do
  vim.fn.sign_define(
    "Dap" .. name,
    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
  )
end

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    -- Debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
    -- Debug nodejs processes
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },
    -- Debug web applications (client side)
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch & Debug Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = vim.fn.getcwd(),
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
    },
    -- Divider for launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
