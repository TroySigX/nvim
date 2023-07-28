local path = require('lspconfig.util').path

local filename = '.editorconfig'
local filepath = path.join(vim.fn.getcwd(), filename)

local function tmp_file()
  local tmp_path = path.join(vim.fn.getcwd(), filename .. '.tmp')

  local function create()
    local tmpf = io.open(tmp_path, 'w')
    tmpf:write()
    tmpf:close()
  end

  local function remove()
    os.remove(tmp_path)
  end

  return {
    create = create,
    remove = remove,
    path = tmp_path,
  }
end

local function setup()
  local tmp = tmp_file()

  if not pcall(tmp.create) then
    return
  end

  local config_exists = false

  path.traverse_parents(tmp.path, function(dir)
    if path.exists(path.join(dir, filename)) then
      config_exists = true
      return true
    end
  end)

  if not config_exists then
    local config_file = path.join(vim.fn.stdpath('config'), filename)

    -- create symlink for editconfig
    os.execute('cp ' .. config_file .. ' ' .. filepath)
  end

  tmp:remove()
end

vim.schedule(setup)
