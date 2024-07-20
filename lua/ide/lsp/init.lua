local M = require('utils.keymaps').create_capability_keymaps('lsp')

function M.active_lsps()
  local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
  local available_clients = vim.lsp.get_clients({ bufnr = 0 })

  local active_clients = {}
  for _, client in pairs(available_clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      table.insert(active_clients, client)
    end
  end

  return active_clients
end

function M.active_formatter()
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
end

return M
