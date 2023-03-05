local function fg(name)
  return function()
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
  end
end

local lsp_client = {
  function(msg)
    msg = msg or ""
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }

    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return ""
      end
      return msg
    end

    local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    -- add formatter
    local lsp_utils = require "plugins.lsp.utils"
    local formatters = lsp_utils.list_formatters(buf_ft)
    vim.list_extend(buf_client_names, formatters)

    -- add linter
    local linters = lsp_utils.list_linters(buf_ft)
    vim.list_extend(buf_client_names, linters)

    -- add hover
    local hovers = lsp_utils.list_hovers(buf_ft)
    vim.list_extend(buf_client_names, hovers)

    -- add code action
    local code_actions = lsp_utils.list_code_actions(buf_ft)
    vim.list_extend(buf_client_names, code_actions)

    local hash = {}
    local client_names = {}
    for _, v in ipairs(buf_client_names) do
      if not hash[v] then
        client_names[#client_names + 1] = v
        hash[v] = true
      end
    end
    table.sort(client_names)
    return icons.ui.Code .. " " .. table.concat(client_names, ", ") .. " " .. icons.ui.Code
  end,
  -- icon = icons.ui.Code,
  colored = true,
  on_click = function()
    vim.cmd [[LspInfo]]
  end,
}

local noice_mode = {
  function()
    return require("noice").api.status.mode.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.mode.has()
  end,
  color = fg "Constant",
}

local noice_command = {
  function()
    return require("noice").api.status.command.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.command.has()
  end,
  color = fg "Statement",
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { lsp_client, noice_mode, noice_command },
    lualine_x = { 'filename', 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
