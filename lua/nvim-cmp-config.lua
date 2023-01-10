vim.cmd([[set completeopt=menu,menuone,noselect]])

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')

cmp.setup({
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete{ reason = cmp.ContextReason.Auto },
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    }),

    sources = cmp.config.sources({ { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }),

    snippet = {
        -- We recommend using *actual* snippet engine.
        -- It's a simple implementation so it might not work in some of the cases.
        expand = function(args)
          unpack = unpack or table.unpack
          local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
          local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
          local indent = string.match(line_text, '^%s*')
          local replace = vim.split(args.body, '\n', true)
          local surround = string.match(line_text, '%S.*') or ''
          local surround_end = surround:sub(col)

          replace[1] = surround:sub(0, col - 1)..replace[1]
          replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
          if indent ~= '' then
            for i, line in ipairs(replace) do
              replace[i] = indent..line
            end
          end

          vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
        end,
    },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    },
})
