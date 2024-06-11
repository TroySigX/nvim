local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'Special' })
  vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = '#36312f' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = 'Normal' })

  local actions = require('telescope.actions')
  require('telescope').setup({
    defaults = {
      layout_config = {
        horizontal = {
          height = 0.9,
          preview_cutoff = 120,
          prompt_position = 'bottom',
          width = 0.8,
        },
      },
      mappings = {
        i = {
          ['<C-j>'] = {
            actions.move_selection_next,
            type = 'action',
            opts = { nowait = true, silent = true },
          },

          ['<C-k>'] = {
            actions.move_selection_previous,
            type = 'action',
            opts = { nowait = true, silent = true },
          },
        },
      },
    },
  })

  require('telescope').load_extension('fzf')
end

return M
