local M = {}

local function trim(s)
  local l = 1
  while string.sub(s, l, l) == ' ' or string.sub(s, l, l) == '\n' do
    l = l + 1
  end
  local r = string.len(s)
  while string.sub(s, r, r) == ' ' or string.sub(s, r, r) == '\n' do
    r = r - 1
  end
  return string.sub(s, l, r)
end

--- get the output of a shell command
function M.run_cmd(cmd)
  local output = vim.fn.system(cmd)
  return {
    output = output,
    status = vim.v.shell_error,
  }
end

return M
