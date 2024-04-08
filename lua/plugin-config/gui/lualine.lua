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
            local no_client_msg = 'No Active LSP'
            local bufnr = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_active_clients({ burnr = bufnr })
            if next(clients) == nil then
              return no_client_msg
            end

            local client_names = ''
            for _, client in pairs(clients) do
              if client_names ~= '' then
                client_names = client_names .. ','
              end
              client_names = client_names .. client.name
            end
            return client_names
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
