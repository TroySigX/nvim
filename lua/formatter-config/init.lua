local M = {}

local path = require('lspconfig.util').path

function M.formatter_installed(formatter)
  if formatter.mason_name ~= nil then
    if require('mason-registry').is_installed(formatter.mason_name) then
      return true
    end
  elseif formatter.system_name ~= nil then
    if vim.v.shell_error == 0 then
      return true
    end
  end

  return false
end

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
  -- formatter should be installed before setup
  if not M.formatter_installed(formatter) then
    return
  end

  -- if config file is not found from pwd to root
  -- create one in pwd
  local tmp = tmp_file(formatter.config_file_name)

  if not pcall(tmp.create) then
    return
  end

  local config_exists = false

  path.traverse_parents(tmp.path, function(dir)
    if path.exists(path.join(dir, formatter.config_file_name)) then
      config_exists = true
      return true
    end
  end)

  if not config_exists then
    local destination_path = path.join(vim.fn.getcwd(), formatter.config_file_name)

    -- clone config file
    os.execute('cp ' .. formatter.config_file_path .. ' ' .. destination_path)
  end

  tmp:remove()
end

local function config_filetype_formatter(filetype, formatter_type_name)
  local function create_autocmd(ft)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { ft },
      callback = function()
        vim.schedule(function()
          setup_formatter(require('formatter-config.' .. formatter_type_name).formatter())
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

function M.setup()
  -- setup formatters
  config_filetype_formatter({ 'cpp', 'c' }, 'c')
  config_filetype_formatter('rust', 'rust')
  config_filetype_formatter({ 'javascript', 'typescript' }, 'js')
  config_filetype_formatter('lua', 'lua')
end

-- table mapping filetypes with their respective
-- file name in the formatter-config directory
function M.filetypes()
  return {
    lua = 'lua',
    c = 'c',
    cpp = 'c',
    rust = 'rust',
    typescript = 'js',
    javascript = 'js',
    python = 'python',
    tex = 'tex',
  }
end

return M
