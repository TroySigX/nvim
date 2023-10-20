local path = require('globals.path')

local filename = '.editorconfig'

local function tmp_file(buf_id)
  local dir
  if
    not pcall(function() -- buffer is not file
      dir = path.get_dir(vim.api.nvim_buf_get_name(buf_id))
    end)
  then
    return nil
  end
  local tmp_path = path.join(dir, filename .. '.tmp')

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
    dir = dir,
  }
end

local function setup(buf_id)
  local tmp = tmp_file(buf_id)

  if tmp == nil then
    return
  end

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

    -- clone config file
    os.execute('cp ' .. config_file .. ' ' .. path.join(tmp.dir, filename))
  end

  tmp:remove()
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function(opts)
    if not vim.bo[opts.buf].modifiable then
      return
    end
    vim.schedule(function()
      setup(opts.buf)
    end)
  end,
})
vim.schedule(setup)
