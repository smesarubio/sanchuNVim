vim.keymap.set("n", "<leader>fe", ':NeoTreeFocusToggle<CR>', {})
vim.keymap.set("n", "<leader>vfe", ':NeoTreeFloatToggle<CR>', {})
vim.keymap.set("n", "<leader>ff", ':NeoTreeFocus<CR>', {})
vim.keymap.set("n", "<leader>fr", ':NeoTreeReveal<CR>', {})

 require("neo-tree").setup({
     window = {
         width = 30,
     }
 })
