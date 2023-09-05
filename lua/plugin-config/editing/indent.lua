local M = {}

function M.setup()
  vim.g.indent_blankline_filetype_exclude = vim.g.exclude_filetypes
end

return M
