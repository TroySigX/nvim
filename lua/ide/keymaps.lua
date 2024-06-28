local M = {}

function M.setup()
  require('ide.editing').setup_keymap()
  require('ide.explorer').setup_keymap()
  require('ide.gui').setup_keymap()
  require('ide.navigation').setup_keymap()
  require('ide.others').setup_keymap()
  require('ide.workflow').setup_keymap()
  require('ide.lsp').setup_keymap()
end

return M
