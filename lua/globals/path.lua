local M = {}

local lsp_path = require('lspconfig.util').path

function M.join(...)
  return lsp_path.join({ ... })
end

function M.traverse_parents(cwd, cb)
  lsp_path.traverse_parents(cwd, cb)
end

function M.traverse_up(cwd, cb)
  cwd = M.join(cwd, '.tmp_file')
  M.traverse_parents(cwd, cb)
end

function M.sep()
  return require('plenary.path').path.sep
end

function M.exists(path)
  return lsp_path.exists(path)
end

return M
