local path = require('utils.path')

return {
  name = '~generate .editorconfig',
  builder = function()
    local input_file = path.join(vim.fn.stdpath('config'), '.editorconfig')
    return {
      cmd = { 'cp' },
      args = { '-f', input_file, '.editorconfig' },
    }
  end,
}
