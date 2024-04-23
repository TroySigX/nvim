local M = {}

--- class containing file operations
---@param path string
---@return table
function M.file(path)
  local function read()
    local file = io.open(path, 'r')
    local res = {
      status = -1,
    }
    if file then
      res.status = 0
      res.content = file:read('*a')
      io.close(file)
    end

    return res
  end

  local function write(content)
    local file = io.open(path, 'w')
    if file then
      file:write(content)
      io.close(file)
      return 0
    end

    return -1
  end

  return {
    read = read,
    write = write,
  }
end

return M
