local M = {}

local opts = { noremap = true, silent = true }

-- NvimTree
vim.keymap.set('n', 'tt', require('nvim-tree.api').tree.toggle, { desc = "NvimTree Toggle" })

-- neogit
vim.keymap.set("n", "<leader>gs", "<cmd>Neogit kind=tab<cr>", { desc = "Open Neogit" })

-- telescope
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
vim.keymap.set('n', '<leader>fr', "<cmd>Telescope file_browser<cr>", { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>pp', require('telescope').extensions.project.project, { desc = 'Open Project List' })
vim.keymap.set('n', '<leader>fu', function() require('telescope').extensions.frecency.frecency({ workspace = 'CWD' }) end,
    { desc = "Find frecency opened files" })
vim.keymap.set("n", "<leader>zc", function() require("telescope.builtin").colorscheme({ enable_preview = true }) end,
    { desc = "Colorscheme" })
-- todo-comments
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- undotree
vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })

-- lsp
M.lsp_keymaps = function(bufnr)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "goto definition" })
    vim.keymap.set('n', 'gD', "<cmd>Lspsaga peek_definition<cr>", { buffer = bufnr, desc = "Peek Definition" })
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "goto type_definition" })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = "goto implementation" })
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = bufnr, desc = "hover" })
    vim.keymap.set('n', 'gr', "<cmd>Lspsaga lsp_finder<cr>", { buffer = bufnr, desc = "references" })
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = bufnr, desc = "format document" })
    -- TODO： 所选内容格式
    -- vim.keymap.set('v', '<leader>lf', vim.lsp.buf.formatting, {buffer=bufnr, desc="format document"})
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = bufnr, desc = "rename" })
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { buffer = bufnr, desc = "show diagnostic" })
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "signature_help" })
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = bufnr, desc = "code action" })
end

-- toggleterm
M.toggleterm_keymaps = function()
    opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- dap
vim.keymap.set('n', '<F5>', require('dap').continue, opts)
vim.keymap.set("n", "<F9>", require 'dap'.step_into, opts)
vim.keymap.set("n", "<F10>", require 'dap'.step_over, opts)
vim.keymap.set("n", "<F11>", require 'dap'.step_out, opts)
vim.keymap.set("n", "<Leader>b", require 'dap'.toggle_breakpoint, opts)
vim.keymap.set(
    "n",
    "<Leader>B",
    ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    opts
)
vim.keymap.set(
    "n",
    "<Leader>lp",
    ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    opts
)
vim.keymap.set("n", "<Leader>dr", require 'dap'.repl.open, opts)
vim.keymap.set("n", "<Leader>dl", require 'dap'.run_last, opts)

-- overseer
vim.keymap.set("n", "<leader>ct", require("overseer").toggle, opts)
vim.keymap.set('n', "<leader>cr", function() require('overseer').run_template({ name = "run script" }) end, opts)

vim.keymap.set('n', "<leader>vo", "<cmd>SymbolsOutline<cr>", { desc = "Code Outline" })

-- trouble
vim.keymap.set('n', "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, desc = "toggle workspace_diagnostics" })
vim.keymap.set('n', "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, desc = "toggle workspace_diagnostics" })

-- test
vim.keymap.set("n", "<leader>tNF", "<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
    { desc = "Debug File" })
vim.keymap.set("n", "<leader>tNL", "<cmd>w|lua require('neotest').run.run_last({strategy = 'dap'})<cr>",
    { desc = "Debug Last" })
vim.keymap.set("n", "<leader>tNa", "<cmd>w|lua require('neotest').run.attach()<cr>", { desc = "Test Attach" })
vim.keymap.set("n", "<leader>tNf", "<cmd>w|lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
    { desc = "Test File" })
vim.keymap.set("n", "<leader>tNl", "<cmd>w|lua require('neotest').run.run_last()<cr>", { desc = "Test Run Last" })
vim.keymap.set("n", "<leader>tNn", "<cmd>w|lua require('neotest').run.run()<cr>", { desc = "Test Nearest" })
vim.keymap.set("n", "<leader>tNN", "<cmd>w|lua require('neotest').run.run({strategy = 'dap'})<cr>",
    { desc = "Debug Nearest" })
vim.keymap.set("n", "<leader>tNo", "<cmd>w|lua require('neotest').output.open({ enter = true })<cr>",
    { desc = "Test Output" })
vim.keymap.set("n", "<leader>tNs", "<cmd>w|lua require('neotest').run.stop()<cr>", { desc = "Test Stop" })
vim.keymap.set("n", "<leader>tNS", "<cmd>w|lua require('neotest').summary.toggle()<cr>", { desc = "Test Summary" })


-- stylua: ignore
vim.keymap.set("n", "<leader>toR", "<cmd>OverseerRunCmd<cr>", { desc = "Run Command" })
vim.keymap.set("n", "<leader>toa", "<cmd>OverseerTaskAction<cr>", { desc = "Task Action" })
vim.keymap.set("n", "<leader>tob", "<cmd>OverseerBuild<cr>", { desc = "Build" })
-- vim.keymap.set("n", "<leader>toc", "<cmd>OverseerClose<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader>tod", "<cmd>OverseerDeleteBundle<cr>", { desc = "Delete Bundle" })
vim.keymap.set("n", "<leader>tol", "<cmd>OverseerLoadBundle<cr>", { desc = "Load Bundle" })
-- vim.keymap.set("n", "<leader>too", "<cmd>OverseerOpen<cr>", { desc = "Open" })
vim.keymap.set("n", "<leader>toq", "<cmd>OverseerQuickAction<cr>", { desc = "Quick Action" })
vim.keymap.set("n", "<leader>tor", "<cmd>OverseerRun<cr>", { desc = "Run" })
vim.keymap.set("n", "<leader>tos", "<cmd>OverseerSaveBundle<cr>", { desc = "Save Bundle" })
vim.keymap.set("n", "<leader>tot", "<cmd>OverseerToggle<cr>", { desc = "Toggle" })
return M
