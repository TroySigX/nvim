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
end

function M.setup()
  require('conform').setup({
    format_after_save = function(bufnr)
      if not autoformat or Knap_autopreview(bufnr) then
        return
      end

      return {
        lsp_fallback = true,
        timeout_ms = 500,
      }
    end
  })
end

return M
