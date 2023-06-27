local M = {}

function M.setup()
  vim.g.tagbar_autofocus = 1
  vim.g.tagbar_sort = 0
  vim.g.tagbar_show_balloon = 0
  vim.g.tagbar_show_linenumbers = 1
  vim.g.tagbar_silent = 1
  vim.g.tagbar_previewwin_pos = 'aboveleft'
end

function M.keymaps()
  return {
    { '<F5>', '<Esc>:TagbarToggle<CR>', silent = true, desc = 'Toggle Tagbar', mode = { 'n', 'i', 'v' } },
  }
end

return M
