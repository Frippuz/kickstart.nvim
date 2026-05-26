-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymap
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Alt + hjkl movement between terminal and normal windows
-- Terminal Mode mappings
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]])

-- Insert Mode mappingC
vim.keymap.set('i', '<C-h>', [[<C-\><C-n><C-w>h]])
vim.keymap.set('i', '<C-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('i', '<C-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('i', '<C-l>', [[<C-\><C-n><C-w>l]])

-- Normal Mode mappingC
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Adde by me from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Move Lines
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- Added from https://github.com/ThePrimeagen/init.lua
-- More useful binds at https://github.com/adibhanna/nvim/blob/a2c16381/lua/config/keymaps.lua#L4-L48

-- Paste over currently selected text without yanking it
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Keep cursor centered when scrolling and searching
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep centered when searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set("n", "*", "*zzv", { noremap = true, silent = true })
vim.keymap.set("n", "#", "#zzv", { noremap = true, silent = true })
vim.keymap.set("n", "g*", "g*zz", { noremap = true, silent = true })
vim.keymap.set("n", "g#", "g#zz", { noremap = true, silent = true })

-- Map enter to ciw in normal mode
vim.keymap.set("n", "<CR>", "ciw", { noremap = true, silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move line on the screen rather than by line in the file
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "x", "o" }, "L", "g_", { noremap = true, silent = true })

-- Own stuff
-- Max fold is one level lower
vim.keymap.set('n', 'zM', 'zMzr')

-- better increment
vim.keymap.set("v", "<C-a>", "<C-a>gv")
vim.keymap.set("v", "<C-x>", "<C-x>gv")

-- Close buffer
vim.keymap.set('n', '<C-b>d', ':bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<C-b>n', ':bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-b>p', ':bp<CR>', { desc = 'Previous buffer' })

-- Open terminal
vim.keymap.set('n', '<C-t>t', ':ter<CR>', { desc = 'Open terminal' })
vim.keymap.set('n', '<C-t>s', '<C-w>s:ter<CR>', { desc = 'Split terminal' })
vim.keymap.set('n', '<C-t>v', '<C-w>v:ter<CR>', { desc = 'Split vertical terminal' })

-- Abbreviations
vim.keymap.set('!a', 'teh', 'the')
vim.keymap.set('!a', 'adn', 'and')
vim.keymap.set('!a', 'repos', '~/repos')

-- Format typst files starting from first header
vim.keymap.set('n', 'gq', function()
  local view = vim.fn.winsaveview()
  -- local keys = vim.api.nvim_replace_termcodes("gg/=<CR>VGgq", true, false, true)
  local keys = vim.api.nvim_replace_termcodes("gg/=<CR>VGgq:noh<CR>", true, false, true)
  vim.api.nvim_feedkeys(keys, 'nx', false)
  vim.fn.winrestview(view)
end, { desc = "Format Typst from first header and return" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
