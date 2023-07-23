local M = {}

function M.setup()
  require('neotest').setup({
    adapters = {
      require('neotest-jest')({
        jestCommand = 'npm test --',
        jestConfigFile = 'custom.jest.config.ts',
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }),
    },

    quickfix = {
      open = false,
    },
  })
end

function M.keymaps()
  require('which-key').register({
    t = {
      name = 'unit test',
      r = {
        function()
          require('neotest').run.run()
        end,
        'Unit [T]est [R]un',
      },
      R = {
        function()
          require('neotest').run.run(vim.fn.expand('%'))
        end,
        'Unit [T]est [R]un All',
      },
      s = {
        function()
          require('neotest').run.stop()
        end,
        'Unit Test [S]top',
      },
      S = {
        function()
          require('neotest').run.stop(vim.fn.expand('%'))
        end,
        'Unit Tests [S]top All',
      },
      t = {
        function()
          require('neotest').summary.toggle()
          local win = vim.fn.bufwinid('Neotest Summary')
          if win > -1 then
            vim.api.nvim_set_current_win(win)
          end
        end,
        'Neo[T]est [T]oggle',
      },
    },
  }, { prefix = '<leader>' })
end

return M
