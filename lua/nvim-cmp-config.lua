vim.cmd([[set completeopt=menu,menuone,noselect]])

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete{ reason = cmp.ContextReason.Auto },
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' }
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
