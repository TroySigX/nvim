local function config_filetype_venv(filetype, venv_name)
  local function create_autocmd(ft)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { ft },
      callback = function()
        require('virtualenv-config.' .. venv_name).setup()
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

-- setup venv
config_filetype_venv('python', 'python')
