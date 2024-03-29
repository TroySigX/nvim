local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    auto_install = true,

    -- required by other plugins
    ensure_installed = { 'markdown', 'markdown_inline', 'vim', 'regex', 'html' },

    indent = {
      enable = true,
    },

    highlight = {
      enable = true,

      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
  })
end

return M
