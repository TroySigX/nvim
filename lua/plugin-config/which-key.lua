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
  require('plugin-config.competitest').keymaps()
  require('plugin-config.fzf-lua').keymaps()
  require('plugin-config.knap').keymaps()
  require('plugin-config.leap-nvim').keymaps()
  require('plugin-config.lsp-setup').keymaps()
  require('plugin-config.luasnip').keymaps()
  require('plugin-config.muren').keymaps()
  require('plugin-config.neogen').keymaps()
  require('plugin-config.neogit').keymaps()
  require('plugin-config.neotest').keymaps()
  require('plugin-config.noice').keymaps()
  require('plugin-config.nvim-dap').keymaps()
  require('plugin-config.nvim-tree').keymaps()
  require('plugin-config.smart-splits').keymaps()
  require('plugin-config.todo-comments').keymaps()
  require('plugin-config.treesj').keymaps()
end

return M
