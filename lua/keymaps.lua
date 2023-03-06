local opts = { noremap = true, silent = true }
-- quick esc
--vim.keymap.set("n", "<c-u>", ":w<enter>", opts)
--vim.keymap.set("i", "jk", "<esc>", opts)

-- -- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- del s
vim.keymap.set("n", 's', "<nop>", opts)

-- save file
vim.keymap.set({ 'n'}, '<C-s>', ':w<CR>', { desc = "Save File" })

-- all select
vim.keymap.set({'n', 'i'}, '<C-a>', '<Esc>ggVG')
-- quick movement
vim.keymap.set("n", "J", "5j", opts)
vim.keymap.set("n", "K", "5k", opts)
vim.keymap.set("n", "H", "0", opts)
vim.keymap.set("n", "L", "$", opts)

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "Q", ":q!<enter>", opts)
vim.keymap.set("v", "Y", '"+y', opts)
vim.keymap.set("n", "<", "<<", opts)
vim.keymap.set("n", ">", ">>", opts)
vim.keymap.set("n", "<leader>o", "za", opts)

vim.keymap.set("n", "<leader><leader>", "<Esc>/<++><CR>:nohlsearch<CR>4xi", opts)
vim.keymap.set("n", "<leader>sc", ":set spell!<cr>", opts)
vim.keymap.set("n", "<leader>sw", ":set wrap!<cr>", opts)

-- Stay in indent mode when you indent code
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- Move text up and down
vim.keymap.set("n", "<A-down>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-up>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-up>", ":m '<-2<CR>gv=gv", opts)
-- replace what you highlight
vim.keymap.set("v", "p", '"_dP', opts)

-- split screen
vim.keymap.set("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
vim.keymap.set("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
vim.keymap.set("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
vim.keymap.set("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
-- cursor jumper between screen
vim.keymap.set("n", "<leader>l", "<c-w>l", opts)
vim.keymap.set("n", "<leader>k", "<c-w>k", opts)
vim.keymap.set("n", "<leader>h", "<c-w>h", opts)
vim.keymap.set("n", "<leader>j", "<c-w>j", opts)
vim.keymap.set("n", "qf", "<c-w>o", opts)

-- set split screen preference
vim.keymap.set("n", "sv", "<C-w>t<C-w>H", opts)
vim.keymap.set("n", "sh", "<C-w>t<C-w>K", opts)
-- rotate screen
vim.keymap.set("n", "srh", "<C-w>b<C-w>K", opts)
vim.keymap.set("n", "srv", "<C-w>b<C-w>H", opts)

-- adjust window size
vim.keymap.set("n", "<up>", ":res +5<cr>", opts)
vim.keymap.set("n", "<down>", ":res -5<cr>", opts)
vim.keymap.set("n", "<left>", ":vertical resize+5<cr>", opts)
vim.keymap.set("n", "<right>", ":vertical resize-5<cr>", opts)

-- tab management
vim.keymap.set("n", "ti", ":tabe<cr>", opts)
vim.keymap.set("n", "th", ":-tabnext<cr>", opts)
vim.keymap.set("n", "tl", ":+tabnext<cr>", opts)
-- move tabs
vim.keymap.set("n", "tmh", ":-tabmove<cr>", opts)
vim.keymap.set("n", "tml", ":+tabmove<cr>", opts)

-- buffer switcher
vim.keymap.set("n", "bh", ":bp<cr>", opts)
vim.keymap.set("n", "bl", ":bn<cr>", opts)

-- quickfix and location fix
vim.keymap.set("n", "co", ":copen<cr>", opts)
vim.keymap.set("n", "cj", ":cnext<cr>", opts)
vim.keymap.set("n", "ck", ":cprevious<cr>", opts)
vim.keymap.set("n", "cc", ":cclose<cr>", opts)

vim.keymap.set("n", "zo", ":lopen<cr>", opts)
vim.keymap.set("n", "zj", ":lnext<cr>", opts)
vim.keymap.set("n", "zk", ":lprevious<cr>", opts)
vim.keymap.set("n", "zc", ":lclose<cr>", opts)

-- -- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostic Goto Prev" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostic Goto Next" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Diagnostic Open Float" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostic Setloclist" })