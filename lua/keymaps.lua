-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'Jk', '<Esc>')
vim.keymap.set('i', 'jK', '<Esc>')
vim.keymap.set('i', 'JK', '<Esc>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- jump between tabs
vim.keymap.set('n', '<Leader>1', '1gt')
vim.keymap.set('n', '<Leader>2', '2gt')
vim.keymap.set('n', '<Leader>3', '3gt')
vim.keymap.set('n', '<Leader>4', '4gt')
vim.keymap.set('n', '<Leader>5', '5gt')

-- resizing splits
vim.keymap.set('n', '<Left>', '<cmd>vert resize -5<cr>')
vim.keymap.set('n', '<Right>', '<cmd>vert resize +5<cr>')
vim.keymap.set('n', '<Up>', '<cmd>resize +5<cr>')
vim.keymap.set('n', '<Down>', '<cmd>resize -5<cr>')

vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- line diff
vim.keymap.set('v', '<leader>l', ':Linediff<cr>')
vim.keymap.set('n', '<leader>L', '<cmd>LinediffReset<cr>')

-- fzf
vim.g.fzf_history_dir = "~/.local/share/fzf-history"

vim.keymap.set('n', '<C-p>', function() require('fzf-lua').files({ cmd = 'fd --type f', git_icons = false}) end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>w', function() require('fzf-lua').grep({ search = vim.fn.expand('<cword>') }) end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>a', function() require('fzf-lua').grep({ search = "" }) end, { desc = 'search any word' })
vim.keymap.set('n', '<leader>p', function() require('fzf-lua').buffers() end, { desc = 'Open buffers' })

vim.keymap.set('i', '<c-x><c-f>', '<cmd>lua require("fzf-lua").complete_path()<cr>')

-- clang format
vim.keymap.set('n', '<leader>c', ':!clang-format % -i<cr>')
vim.keymap.set('v', '<leader>C', function()
  local line_a = vim.fn.getpos('v')[2]
  local line_b = vim.fn.getpos('.')[2]
  if line_a > line_b then
    line_a, line_b = line_b, line_a
  end
  local c = line_a..':'..line_b..'<cr>'
  return ":w !clang-format % -i --lines "..c
end, { expr = true })

-- git
vim.keymap.set('n', '<leader>b', ':Git blame<cr>')
vim.keymap.set('n', '<leader>d', ':Gvdiff<cr>')
vim.keymap.set('n', '<leader>g', ':0G<cr>')

-- copy/paste
vim.keymap.set('x', 'p', 'pgvy')

-- emacs style keybindings in vim's command mode
vim.keymap.set('c', '<C-A>', '<Home>')
vim.keymap.set('c', '<C-B>', '<Left>')
vim.keymap.set('c', '<C-D>', '<Del>')
vim.keymap.set('c', '<C-E>', '<End>')
-- <C-F> conflicts with q:
vim.keymap.set('c', '<C-N>', '<Down>')
vim.keymap.set('c', '<C-P>', '<Up>')
vim.keymap.set('c', '<A-b>', '<S-Left>')
vim.keymap.set('c', '<A-f>', '<S-Right>')

-- copy filename
vim.keymap.set('n', '<F2>', function()
  local filename = vim.fn.expand('%')
  vim.fn.setreg('+', filename)
end)

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
