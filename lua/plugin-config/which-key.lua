local M = {}

function M.setup()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require('which-key').setup({
    triggers_blacklist = {
      n = { 'v' },
    },
  })

  -- load plugin-config
  require('plugin-config.explorer.fzf-lua').keymaps()
  require('plugin-config.workflow.knap').keymaps()
  require('plugin-config.navigation.leap-nvim').keymaps()
  require('plugin-config.lsp.lsp-setup').keymaps()
  require('plugin-config.lsp.luasnip').keymaps()
  require('plugin-config.editing.muren').keymaps()
  require('plugin-config.editing.neogen').keymaps()
  require('plugin-config.workflow.neogit').keymaps()
  require('plugin-config.workflow.neotest').keymaps()
  require('plugin-config.gui.noice').keymaps()
  require('plugin-config.workflow.nvim-dap').keymaps()
  require('plugin-config.explorer.nvim-tree').keymaps()
  require('plugin-config.workflow.smart-splits').keymaps()
  require('plugin-config.workflow.todo-comments').keymaps()
  require('plugin-config.editing.treesj').keymaps()
end

return M
