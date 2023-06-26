local M = {}

function M.setup()
  vim.g.indent_blankline_filetype_exclude = {
    'lspinfo',
    'packer',
    'checkhealth',
    'help',
    'man',
    'dashboard',
    '',
  }
end

return M
