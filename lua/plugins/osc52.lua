return {
    'ojroques/nvim-osc52',
    event = "VeryLazy",
    config = function()
        local os = require("os")
        local ssh = os.getenv("SSH_CLIENT")
        if ssh ~= nil then
            require('osc52').setup {
                max_length = 0, -- Maximum length of selection (0 for no limit)
                silent     = false, -- Disable message on successful copy
                trim       = false, -- Trim surrounding whitespaces before copy
            }

            vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
            vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
            vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
        end
    end
}
