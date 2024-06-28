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
          function()
            local reg = vim.fn.reg_recording()
            if reg == '' then
              return ''
            end

            return 'recording @' .. reg
          end,
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
            local lsp_dir = require('utils.path').config_dir('lsp')()
            local clients = require(lsp_dir).active_lsps()

            local max_num_clients = 2
            local client_names = ''
            for _, client in pairs(clients) do
              max_num_clients = max_num_clients - 1

              if client_names ~= '' then
                client_names = client_names .. ','
              end
              client_names = client_names .. client.name
            end

            client_names = client_names .. (max_num_clients < 0 and ',+' .. tostring(-max_num_clients) or '')
            return client_names ~= '' and client_names or 'None'
          end,
          icon = ' LSP:',
          color = { fg = '#faa92f' },
        },
        {
          -- Formatter name
          function()
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            local formatter_config = require('formatter-config')
            if formatter_config.filetypes()[buf_ft] then
              local client_name = formatter_config.filetypes()[buf_ft]
              local formatter = require('formatter-config.' .. client_name).formatter()

              local installed_name = formatter_config.formatter_installed_name(formatter)
              if installed_name then
                return installed_name
              end
            end

            return 'None'
          end,
          icon = ' Formatter:',
          color = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
            return {
              fg = vim.b[bufnr].formatting and '#e7f20c'
                or vim.g.autoformat and require('formatter-config').filetypes()[buf_ft] and '#60e6a3'
                or '#a6a6a6',
            }
          end,
        },
        {
          -- Venv name
          function()
            local pyproject = vim.fn.findfile('pyproject.toml', vim.fn.getcwd() .. ';')
            if pyproject == '' then
              return ''
            end

            local venv = require('venv-selector').venv()
            if venv then
              local max_len = 30
              local venv_parts = vim.fn.split(venv, '/')
              local venv_name = venv_parts[#venv_parts]
              local venv_name_len = venv_name:len()
              venv_name = venv_name_len > max_len
                  and venv_name:sub(1, max_len - 3 - 6) .. '...' .. venv_name:sub(
                    venv_name_len - (6 - 1),
                    venv_name_len
                  )
                or venv_name
              return venv_name
            else
              return 'No Active Venv'
            end
          end,
          icon = '',
          color = { fg = '#CDD6F4' },
        },
      },
    },
  })
end

return M
