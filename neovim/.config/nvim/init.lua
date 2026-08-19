
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
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- Auto-pairs
-- Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'

-- Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'isakbm/gitgraph.nvim'

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
Plug 'nvim-tree/nvim-tree.lua'


-- LSP
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

-- LSP Lua
Plug('folke/lazydev.nvim', { ['for'] = 'lua' })
Plug 'Bilal2453/luvit-meta'

-- Latex
Plug 'lervag/vimtex'
Plug 'nvim-telescope/telescope-bibtex.nvim'
Plug 'barreiroleo/ltex_extra.nvim' -- add dictionary for latex language server


-- etc
Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')



-- Check if we are running in WSL
Is_wsl = (function()
  local handle = io.popen("uname -r")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result:lower():find("microsoft") ~= nil
  end
  return false
end)()


require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.colors")
require("plugins")

