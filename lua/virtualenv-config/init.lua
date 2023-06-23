local function config_filetype_venv(filetype, venv_name)
  local function create_autocmd(ft)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { ft },
      callback = function()
        vim.schedule(function() require('virtualenv-config.' .. venv_name) end )
      end,
    })
  end

  if type(filetype) == 'string' then
    create_autocmd(filetype)
  else
    for _, ft in ipairs(filetype) do
      create_autocmd(ft)
    end
  end
end

config_filetype_venv('python', 'python')
