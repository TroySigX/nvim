local M = {}

--- get the output of a shell command
function M.run_cmd(cmd)
  local output = vim.fn.system(cmd)
  return {
    output = output,
    status = vim.v.shell_error,
  }
end

return M
