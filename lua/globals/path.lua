local M = {}

local lsp_path = require('lspconfig.util').path

function M.join(...)
  return lsp_path.join({ ... })
end

function M.traverse_parents(cwd, cb)
  lsp_path.traverse_parents(cwd, cb)
end

function M.sep()
  return require('plenary.path').path.sep
end

function M.exists(path)
  return lsp_path.exists(path)
end

-- get working dir of file
function M.get_dir(path)
  return lsp_path.dirname(path)
end

return M
