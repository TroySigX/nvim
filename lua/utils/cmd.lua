local M = {}

--- get the output and exit code of a shell command
--- @param cmd string
--- @return table
function M.run_cmd(cmd)
  local output = vim.fn.system(cmd)
  return {
    output = output,
    status = vim.v.shell_error,
  }
end

return M
