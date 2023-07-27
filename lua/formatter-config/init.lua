local path = require('lspconfig.util').path

local function tmp_file(formatter_name)
  local tmp_path = path.join(vim.fn.getcwd(), formatter_name .. '.tmp')

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

local function setup_formatter(formatter)
  local tmp = tmp_file(formatter.name)

  if not pcall(tmp.create) then
    return
  end

  local config_exists = false

  path.traverse_parents(tmp.path, function(dir)
    if path.exists(path.join(dir, formatter.name)) then
      config_exists = true
      return true
    end
  end)

  if not config_exists then
    local destination_path = path.join(vim.fn.getcwd(), formatter.name)

    -- create symlink
    os.execute('ln -s ' .. formatter.path .. ' ' .. destination_path)
  end

  tmp:remove()
end

local function config_filetype_venv(filetype, formatter_type_name)
  local function create_autocmd(ft)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { ft },
      callback = function()
        vim.schedule(function()
          setup_formatter(require('formatter-config.' .. formatter_type_name).formatter_name())
        end)
      end,
    })
  end

  if type(filetype) == 'string' then
    create_autocmd(filetype)
  else
    for _, ft in pairs(filetype) do
      create_autocmd(ft)
    end
  end
end

-- setup formatters
config_filetype_venv({ 'cpp', 'c' }, 'c')
config_filetype_venv({ 'javascript', 'typescript' }, 'js')
config_filetype_venv('lua', 'lua')
