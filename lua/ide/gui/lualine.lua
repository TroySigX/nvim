local M = {}

local lsp_dir = require('utils.path').config_dir('lsp')()
local workflow_dir = require('utils.path').config_dir('workflow')()

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
            return require(lsp_dir).active_formatter()
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
            return require(workflow_dir).active_venv()
          end,
          icon = '',
          color = { fg = '#CDD6F4' },
        },
      },
    },
  })
end

return M
