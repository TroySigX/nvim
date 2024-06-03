return {
  name = 'pdflatex',
  builder = function()
    local input_file = vim.fn.expand('%:p')
    local output_path = vim.fn.expand('%:p:h')
    return {
      cmd = { 'pdflatex' },
      args = { '-synctex=1', '-halt-on-error', '-output-directory=' .. output_path, input_file },
    }
  end,
  condition = {
    filetype = { 'tex' },
  },
}
