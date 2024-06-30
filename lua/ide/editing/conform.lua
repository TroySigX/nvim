local M = {}

vim.g.autoformat = true

local function toggle_autoformat()
  vim.g.autoformat = not vim.g.autoformat
  if not vim.g.autoformat then
    vim.notify('Autoformatting disabled', vim.log.levels.INFO)
  else
    vim.notify('Autoformatting enabled', vim.log.levels.INFO)
  end
end

--- function to pass to conform.format
local function format_args(bufnr)
  vim.b[bufnr].formatting = true
  return {
    timeout_ms = 500,
  }, function()
    vim.b[bufnr].formatting = false
  end
end

function M.keymaps()
  require('which-key').register({
    ['<space>ft'] = {
      function()
        toggle_autoformat()
      end,
      '[F]ormatter [T]oggle',
    },
  })

  require('which-key').register({
    ['<space>fr'] = {
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        require('conform').format(format_args(bufnr))
      end,
      '[F]ormatter [R]un',
    },
  }, { mode = { 'n', 'x' } })
end

--- mapping filetypes to conform name
---@return table
local function available_formatters()
  local filetype_formatters = {}
  local formatter_config = require('formatter-config')

  for ft, ft_alias in pairs(require('formatter-config').filetypes()) do
    local formatter = require('formatter-config.' .. ft_alias).formatter()
    if formatter_config.formatter_installed_name(formatter) then
      filetype_formatters[ft] = { formatter.conform_name }
    end
  end

  return filetype_formatters
end

function M.setup()
  require('conform').setup({
    formatters_by_ft = available_formatters(),

    format_after_save = function(bufnr)
      if not vim.g.autoformat or vim.b[bufnr].preview then
        return
      end

      return format_args(bufnr)
    end,
  })
end

return M
