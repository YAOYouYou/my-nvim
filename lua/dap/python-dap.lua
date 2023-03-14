local dap = require('dap')
local python_path = vim.fn.trim(vim.fn.system("which python"))

dap.adapters.python = {
  type = 'executable';
  command = python_path;
  args = { '-m', 'debugpy.adapter' };
}

require('dap-python').setup(python_path)
