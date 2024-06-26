local modes = { 'n', 'i', 'v' }

-- Open file view (bigger neotree).
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- Move selected text - ThePrimeagen.
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Keep curor where it was when doing J - ThePrimeagen.
vim.keymap.set('n', 'J', 'mzJ`z')
-- Move up or down 50 lines - ThePrimeagen.
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search work under cursor.
vim.keymap.set(
  'n',
  '<leader>S',
  ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left><Left>'
)

-- Keep search terms in the middle of the screen - ThePrimeagen.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep p reserved when pasting over something - ThePrimeagen.
vim.keymap.set('x', '<leader>p', '"_dP')

-- Yank things into clipboard - asbjornHaland.
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy into clipboard.' })

vim.keymap.set(
  'v',
  '<leader>y',
  '"+y',
  { desc = '[Y]ank highlighted text into clipboard.' }
)
vim.keymap.set(
  'n',
  '<leader>Y',
  '"+Y',
  { desc = '[Y]ank line into clipboard.' }
)

vim.keymap.set(
  'n',
  '<leader>d',
  '"_d',
  { desc = 'Copy deleted text into clipboard.' }
)
vim.keymap.set(
  'v',
  '<leader>d',
  '"_d',
  { desc = 'Copy highlighted deleted text into clipboard' }
)

vim.keymap.set('i', '<C-c>', '<Esc>')
-- Yank whole file to clipboard.
vim.keymap.set('n', '<C-c>', ':%y+<CR>', { silent = true })

vim.keymap.set('n', 'Q', '<nop>')
-- vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- go to errors
-- these might not even work
-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +c %<CR>', { silent = true })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '[d',
  vim.diagnostic.goto_prev,
  { desc = 'Go to previous [D]iagnostic message' }
)
vim.keymap.set(
  'n',
  ']d',
  vim.diagnostic.goto_next,
  { desc = 'Go to next [D]iagnostic message' }
)
vim.keymap.set(
  'n',
  '<leader>e',
  vim.diagnostic.open_float,
  { desc = 'Show diagnostic [E]rror messages' }
)
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)

-- Open command with ;
-- commenting this out becuase to repeat the 'f' you need to use ';'
-- vim.keymap.set('n', ';', ':', { desc = 'Open command.' })

-- For keymaps that affect every mode.
for _, mode in ipairs(modes) do
  -- Save file in all modes
  vim.keymap.set(
    mode,
    '<C-s>',
    '<cmd>write<CR>',
    { desc = 'Write to buffer.', silent = true }
  )
end

vim.keymap.set('n', '<C-S-A>', 'ggVG')

-- These mappings control the size of splits (height/width)
vim.keymap.set('n', '<M-,>', '<c-w>5<')
vim.keymap.set('n', '<M-.>', '<c-w>5>')
vim.keymap.set('n', '<M-t>', '<C-W>+')
vim.keymap.set('n', '<M-s>', '<C-W>-')
