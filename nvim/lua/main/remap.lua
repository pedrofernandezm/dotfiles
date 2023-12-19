-- KEY BINDINGS
local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Map window prefix to ommit W
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- vim tab navigation
map('n', 'th', ':tabfirst<CR>')
map('n', 'tj', ':tabprev<CR>')
map('n', 'tk', ':tabnext<CR>')
map('n', 'tl', ':tablast<CR>')
map('n', 'tc', ':tabclose<CR>')
map('n', 'tn', ':tabnew<CR>')

-- Unhighlight search results
map('n', '<Leader><space>', ':nohl<CR>')

