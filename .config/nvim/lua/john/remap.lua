-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Format on save
local format_on_save_group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  command = 'undojoin | Neoformat',
  group = format_on_save_group,
  pattern = '*',
})

-- Save file as sudo on files that require root permission
vim.keymap.set('c', 'w!!', 'execute \'silent! write !sudo tee % >/dev/null\' <bar> edit!')

-- Disable arrows
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')

-- Make file executable
vim.keymap.set('n', '<leader>x', ':silent !chmod +x %<CR>>')

-- Open file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Open undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Move up and down half screen and center cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep searches centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move lines around in visual mode
vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv")

-- Remap copilot shortcut
vim.keymap.set('i', '<C-g>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
vim.g.copilot_no_tab_map = true

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

