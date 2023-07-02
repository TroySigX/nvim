return {
  name = 'g++ build',
  builder = function()
    local input_file = vim.fn.expand('%:p')
    local output_file = vim.fn.expand('%:r')
    return {
      cmd = { 'g++' },
      args = { '-g', input_file, '-o', output_file },
    }
  end,
  condition = {
    filetype = { 'cpp' },
  },
}
