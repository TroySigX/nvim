local function config_filetype_debugger(filetype, debugger_name)
  local function create_autocmd(ft)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { ft },
      callback = function()
        vim.schedule(function() require('dap-config' .. debugger_name) end )
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

require('dapui').setup()

local map = vim.keymap.set
map('n', '<leader>b', require('dap').toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
map({ 'n', 'i', 'v' }, '<F8>', require('dapui').toggle, { desc = 'Toggle DapUI' })

config_filetype_debugger({ 'cpp', 'c' }, 'cpp')
config_filetype_debugger('python', 'python')
