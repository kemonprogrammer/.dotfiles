-- --- LSP ---

vim.keymap.set("n", "<leader>li", "<cmd>checkhealth vim.lsp<CR>")
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
      only = { "source.organizeImports" },
      diagnostics = {},
    },
  })
end, { desc = "Organize / Add Imports" })

-- mouse shortcuts
vim.keymap.set('n', '<C-LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'LSP Definition' })


-- ALT + ENTER: Trigger auto-import for the missing item under cursor
vim.keymap.set('n', '<A-CR>', function()
  vim.lsp.buf.code_action({
    filter = function(a)
      -- todo
      print(a)
      -- Filters for import-related actions (matches common LSP action titles)
      return a.title and a.title:lower():match("Update import from")
    end,
    apply = true, -- Automatically applies the action without showing a menu
  })
end, { desc = "LSP: Import missing item under cursor" })

-- ALT + SHIFT + ENTER: Organize / Import all missing in the file
vim.keymap.set('n', '<A-S-CR>', function()
  -- Try running source.organizeImports code action
  vim.lsp.buf.code_action({
    context = { only = { "source.organizeImports" } },
    apply = true,
  })
end, { desc = "LSP: Import all missing / Organize imports" })


--keymap inspiration

-- from: https://alpha2phi.medium.com/neovim-for-beginners-lsp-part-1-b3a17ddbe611
--
-- local M = {}
--
-- local whichkey = require "which-key"
--
-- local keymap = vim.api.nvim_set_keymap
-- local buf_keymap = vim.api.nvim_buf_set_keymap
--
-- local function keymappings(client, bufnr)
--   local opts = { noremap = true, silent = true }
--
--   -- Key mappings
--   buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
--   keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--   keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
--   keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
--
--   -- Whichkey
--   local keymap_l = {
--     l = {
--       name = "Code",
--       r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
--       a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
--       d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
--       i = { "<cmd>LspInfo<CR>", "Lsp Info" },
--     },
--   }
--   if client.resolved_capabilities.document_formatting then
--     keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
--   end
--
--   local keymap_g = {
--     name = "Goto",
--     d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
--     D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
--     s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
--     I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
--     t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
--   }
--   whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
--   whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
-- end
--
-- function M.setup(client, bufnr)
--   keymappings(client, bufnr)
-- end
--
-- return M

-- Lua Lsp types, needs to be set up before lua-ls
require("lazydev").setup({
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
  },
})

require("mason").setup({
  ensure_installed = {
    "js-debug-adapter"
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "vtsls",
    "emmet_ls",
    "texlab",
    "ltex",
    "html",
    "gopls",
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

if Is_wsl then
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

vim.keymap.set('n', '<C-M-l>', vim.lsp.buf.format, { desc = 'Format whole file' })


-- --- Latex LSP ---

vim.lsp.config['texlab'] = {
  capabilities = capabilities,
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

vim.lsp.config['ltex'] = {
  capabilities = capabilities,
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




-- --- Explorer ---

if Is_wsl then
  vim.keymap.set("n", "<leader>se", "<cmd>silent !explorer.exe $(wslpath -w %:p:h)<CR>",
    { desc = "Open current file in explorer" })
else
  vim.keymap.set("n", "<leader>se", "<cmd>silent !xdg-open %:p:h<CR>",
    { desc = "Open current file in explorer" })
end


-- remove non-line numbers and fill char ~, -
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "bg" })


--- Go

vim.lsp.config['gopls'] = {
  capabilities = capabilities,
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
