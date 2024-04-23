local M = {}

local lsp_path = require('lspconfig.util').path

function M.join(...)
  return lsp_path.join({ ... })
end

function M.traverse_parents(cwd, cb)
  lsp_path.traverse_parents(cwd, cb)
end

-- os path separator
function M.sep()
  return require('plenary.path').path.sep
end

function M.exists(path)
  return lsp_path.exists(path)
end

-- get working dir of file
function M.path_dir(path)
  return lsp_path.dirname(path)
end

-- get working dir of buffer
function M.buf_dir(buf_id)
  local dir
  if
    not pcall(function() -- buffer is not file
      dir = M.path_dir(vim.api.nvim_buf_get_name(buf_id))
    end)
  then
    return nil
  end

  return dir
end

-- get root of git directory
function M.git_root(path)
  return require('utils.cmd').run_cmd('cd ' .. path .. ' && git rev-parse --show-toplevel').output
end

return M
