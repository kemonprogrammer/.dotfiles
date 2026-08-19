
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
