require('treesj').setup({
  use_default_keymaps = false,
})

vim.keymap.set('n', 'gs', require('treesj').toggle)
