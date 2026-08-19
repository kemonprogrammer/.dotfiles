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

