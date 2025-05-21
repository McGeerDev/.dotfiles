-- use pcall to safely require lualine
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("Could not load lualine", lualine)
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      {'mode'},
    },
    lualine_b = {
      {'branch', 'diff','diagnostics'},
    },
    lualine_c = {
      {
        'buffers',
      }
    },
    lualine_y = {
      {
        'datetime',
        style = 'default'
      }
    },
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" }
      }
    },
  }
}
