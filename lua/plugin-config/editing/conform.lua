local M = {}

local autoformat = true

local function toggle_autoformat()
  autoformat = not autoformat
  if not autoformat then
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
      'Toggle [F]ormat [T]oggle',
    },
  })

  require('which-key').register({
    ['<space>fr'] = {
      function()
        require('conform').format()
      end,
      '[F]ormat [R]un',
    },
  }, { mode = { 'n', 'v' } })
end

local function available_formatters()
  local filetype_formatters = {}

  for ft, ft_alias in pairs(require('formatter-config').filetypes()) do
    local formatter = require('formatter-config.' .. ft_alias).formatter()
    if require('mason-registry').is_installed(formatter.mason_name) then
      filetype_formatters[ft] = { formatter.conform_name }
    end
  end

  return filetype_formatters
end

function M.setup()
  require('conform').setup({
    formatters_by_ft = available_formatters(),

    format_after_save = function(bufnr)
      if not autoformat or Knap_autopreview(bufnr) then
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
