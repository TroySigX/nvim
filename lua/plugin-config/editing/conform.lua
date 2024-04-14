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
        require('conform').format()
      end,
      '[F]ormatter [R]un',
    },
  }, { mode = { 'n', 'x' } })
end

local function available_formatters()
  local filetype_formatters = {}
  local formatter_config = require('formatter-config')

  for ft, ft_alias in pairs(require('formatter-config').filetypes()) do
    local formatter = require('formatter-config.' .. ft_alias).formatter()
    if formatter_config.formatter_installed(formatter) then
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

      return {
        lsp_fallback = false,
        timeout_ms = 500,
      }
    end,
  })
end

return M
