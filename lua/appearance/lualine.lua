local function fg(name)
  return function()
    local hl = vim.api.nvim_get_hl_by_name(name, true)
    return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
  end
end

local lsp_client = {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    -- first LSP
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        if client.name ~= "null-ls" and client.name ~= "copilot" then
          return client.name
        end
      end
    end
    -- if don't have LSP then null-ls
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        if client.name == "null-ls" then
          return client.name
        end
      end
    end
    -- if don't have null-ls then orthers
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = "👻 :",
  color = { --[[ fg = "#ffffff", ]]
    gui = "bold",
  },
  on_click = function()
    vim.cmd("LspInfo")
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


local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic', 'nvim_lsp' },
  sections = { 'error', 'warn', 'info', 'hint' },
  colored = true, -- Displays diagnostics status in color if set to true.
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = false, -- Show diagnostics even if there are none.
  on_click = function()
    vim.cmd("TroubleToggle document_diagnostics")
  end
}

local fileformat = {
  'fileformat',
  symbols = {
    unix = '', -- e712
    dos = '', -- e70f
    mac = '', -- e711
  }
}

local resource_used = {
  function()
    -- local mem_used = math.ceil(vim.fn.system('ps -o rss= -p ' .. tostring(vim.fn.getpid())) / 1024)
    -- local buffers = vim.fn.bufnr('$')
    -- local file_type = vim.bo.filetype:upper()
    -- return string.format('%s %sMB %s', file_type, mem_used, buffers)
  end,
  color = { fg = '#FFFFFF', bg = '#444444' },
  padding = { left = 0, right = 0 },
}


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
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
    lualine_b = { 'branch', 'diff', diagnostics },
    lualine_c = { lsp_client, noice_mode, noice_command },
    lualine_x = { 'encoding', fileformat, 'filetype' },
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
  extensions = { "fzf", "quickfix", "nvim-tree", "nvim-dap-ui", "aerial" },
}
