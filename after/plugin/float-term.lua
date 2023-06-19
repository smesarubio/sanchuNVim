vim.keymap.set('n', '<A-t>' , ':FloatermToggle<CR>')

vim.keymap.set('t', '<A-t>' , '<C-\\><C-n>:FloatermToggle<CR>')
vim.keymap.set('i', '<A-t>' , '<esc>:FloatermToggle<CR>')


vim.g.floaterm_width = 0.90 -- Set floaterm_width to 80
vim.g.floaterm_height = 0.90 -- Set floaterm_height to 80
