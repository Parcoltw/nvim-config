return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local function command_exists(cmd)
      local handle = io.popen("which " .. cmd .. " 2>/dev/null")
      if handle then
        local result = handle:read("*a")
        handle:close()
        return result ~= ""
      end
      return false
    end
    local function get_fortune()
      if command_exists("fortune") and command_exists("cowsay") then
        local handle = io.popen("fortune -s | cowsay")
        if handle then
          local result = handle:read("*a")
          handle:close()
          return result
        end
      end
      return [[
             ╭─────────────────────────────╮
             │         Welcome back!       │
             ╰─────────────────────────────╯
      ]]
    end
    dashboard.section.header.val = vim.split(get_fortune(), "\n")
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.val = {
      dashboard.button("e",        "󰈔   New File",        ":ene <BAR> startinsert<CR>"),
      dashboard.button("SPC f f",  "󰈞   Find File",       ":Telescope find_files<CR>"),
      dashboard.button("SPC f r",  "󰄉   Recent Files",    ":Telescope oldfiles<CR>"),
      dashboard.button("SPC f g",  "󰊄   Grep Text",       ":Telescope live_grep<CR>"),
      dashboard.button("p",        "󰒲   Plugins",         ":Lazy<CR>"),
      dashboard.button("c",        "󰒓   Config",          ":Telescope find_files cwd=~/.config/nvim/<CR>"),
      dashboard.button("q",        "󰈆   Quit",            ":qa<CR>"),
    }
    local function get_day_of_week()
      return os.date("%A")
    end
    dashboard.section.footer.val = {
      get_day_of_week(),
    }
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }
    alpha.setup(dashboard.config)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
