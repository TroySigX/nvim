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
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients({ burnr = 0 })
            if next(clients) == nil then
              return 'None'
            end

            local client_names = ''
            for _, client in pairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                if client_names ~= '' then
                  client_names = client_names .. ','
                end
                client_names = client_names .. client.name
              end
            end
            return client_names
          end,
          icon = ' LSP:',
          color = { fg = '#faa92f' },
        },
        {
          function()
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local formatter_config = require('formatter-config')
            if formatter_config.filetypes()[buf_ft] then
              local client_name = formatter_config.filetypes()[buf_ft]
              local formatter = require('formatter-config.' .. client_name).formatter()

              if formatter_config.formatter_installed(formatter) then
                return formatter.mason_name
              end
            end

            return 'None'
          end,
          icon = ' Formatter:',
          color = function()
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            return {
              fg = vim.g.autoformat and require('formatter-config').filetypes()[buf_ft] and '#60e6a3' or '#a6a6a6',
            }
          end,
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
