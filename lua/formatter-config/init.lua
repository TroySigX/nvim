local M = {}

local path = require('globals.path')
local cmd = require('globals.cmd')

function M.formatter_installed(formatter)
  if formatter == nil then
    return false
  end

  if formatter.mason_name ~= nil then
    if require('mason-registry').is_installed(formatter.mason_name) then
      return true
    end
  elseif formatter.system_name ~= nil then
    if cmd.run_cmd(formatter.system_name .. ' --version').status == 0 then
      return true
    end
  end

  return false
end

local function project_root(formatter, cwd)
  local git_root = path.git_root(cwd)
  if git_root ~= nil then
    return git_root
  end

  local lang_root = formatter.project_root ~= nil and formatter.project_root()
  if lang_root ~= nil then
    return lang_root
  end

  return nil
end

local function setup_formatter(formatter, cwd)
  -- formatter should be installed before setup
  if not M.formatter_installed(formatter) then
    return
  end

  -- if cwd is in a project, prioritize adding config to that project
  local proj_root = project_root(formatter, cwd)
  if proj_root ~= nil then
    local dest_path = path.join(proj_root, formatter.config_file_name)
    -- creating config file if not exist
    if not path.exists(dest_path) then
      cmd.run_cmd('cp ' .. formatter.config_file_path .. ' ' .. dest_path)
    end
    return
  end

  local tmp_path = path.join(cwd, formatter.config_file_name .. '.tmp')

  local config_exists = false

  path.traverse_parents(tmp_path, function(dir)
    if path.exists(path.join(dir, formatter.config_file_name)) then
      config_exists = true
      return true
    end
  end)

  if not config_exists then
    local dest_path = path.join(cwd, formatter.config_file_name)

    -- clone config file
    cmd.run_cmd('cp ' .. formatter.config_file_path .. ' ' .. dest_path)
  end
end

local function config_filetype_formatter(filetype, formatter_type_name)
  local function create_autocmd(ft)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { ft },
      callback = function(opts)
        vim.schedule(function()
          local cwd = path.buf_dir(opts.buf)
          -- buffer is not a file
          if cwd == nil then
            return
          end
          setup_formatter(require('formatter-config.' .. formatter_type_name).formatter(cwd), cwd)
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
  -- map filetypes with their respective config file
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
