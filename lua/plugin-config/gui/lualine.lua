local M = {}

function M.setup()
  require('lualine').setup({
    options = {
      theme = 'ayu_mirage',
      ignore_focus = vim.g.exclude_filetypes,
    },
    sections = {
      lualine_x = {
        {
          -- Macro recording
          require('noice').api.status.mode.get,
          cond = require('noice').api.status.mode.has,
          color = { fg = 'ff9e64' },
        },
      },

      lualine_y = {
        function()
          local format = '%I:%M %p'
          return '󰃰 ' .. os.date(format)
        end,
      },

      lualine_c = {
        {
          -- LSP server name
          function()
            local msg = 'No Active LSP'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in pairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = ' LSP:',
          color = { fg = '#faa92f' },
        },
        {
          function()
            local pyproject = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
            if pyproject == '' then
              return ''
            end

            local venv = require('venv-selector').get_active_venv()
            if venv then
              local venv_parts = vim.fn.split(venv, '/')
              local venv_name = venv_parts[#venv_parts]
              return ' ' .. venv_name
            else
              return ' No Active Venv'
            end
          end,
          color = { fg = '#CDD6F4' },
        },
      },
    },
  })
end

return M
