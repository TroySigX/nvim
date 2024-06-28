local M = {}

function M.setup()
  require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
  require('copilot_cmp').setup({ event = 'LspAttach' })

  local cmp = require('cmp')
  cmp.setup({
    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol_text',
        menu = {},
        maxwidth = 50,
        ellipsis_char = '...',
        symbol_map = { Copilot = '' },
      }),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<CR>'] = cmp.mapping.confirm(),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),

    sources = {
      { name = 'copilot' },
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'otter' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'emoji' },
    },

    sorting = {
      comparators = {
        cmp.config.compare.recently_used,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        function(entry1, entry2)
          -- copied from https://github.com/lukas-reineke/cmp-under-comparator
          local _, entry1_under = entry1.completion_item.label:find('^_+')
          local _, entry2_under = entry2.completion_item.label:find('^_+')
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,
        cmp.config.compare.kind,
        cmp.config.compare.order,
      },
    },

    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })
end

return M
