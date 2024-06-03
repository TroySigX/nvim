return {
  name = 'typst build',
  builder = function()
    local input_file = vim.fn.expand('%:p')
    local output_file = vim.fn.expand('%:r') .. '.pdf'
    return {
      cmd = { 'typst' },
      args = { 'compile', input_file, output_file },
    }
  end,
  condition = {
    filetype = { 'typst' },
  },
}
