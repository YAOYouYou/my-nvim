-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ 'n'}, '<C-s>', ':w<CR>', { desc = "Save File" })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'dap continue' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'dap step_over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'dap step_into' })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'dap step_out' })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'dap toggle_breakpoint' })
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, { desc = 'dap set_breakpoint' })
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = 'dap open repl' })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = 'dap run_last' })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostic Goto Prev" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostic Goto Next" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Diagnostic Open Float" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostic Setloclist" })


-- NvimTree
vim.keymap.set('n', '<Leader>nt', function() require("nvim-tree").toggle() end, { desc = "NvimTree Toggle" })
