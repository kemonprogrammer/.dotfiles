-- load all lua files in plugins/
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local files = vim.split(vim.fn.glob(plugins_dir .. "/*.lua"), "\n")

for _, file in ipairs(files) do
  if file ~= "" then
    -- Convert absolute path to a Lua module path (e.g., .../plugins/telescope.lua -> plugins.telescope)
    local module = file:match("lua/(.*)%.lua$"):gsub("/", ".")
    require(module)
  end
end
