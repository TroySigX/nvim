local M = {}

function M.setup()
  local gknapsettings = {
    -- latex
    texoutputext = 'pdf',
    textopdf = 'pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%',
    textopdfviewerlaunch = 'okular %outputfile%',
    textopdfviewerrefresh = 'kill -HUP %pid%',

    -- markdown
    mdoutputext = 'pdf',
    mdtopdf = 'pandoc %docroot% -o %outputfile%',
    mdtopdfviewerlaunch = 'okular %outputfile%',
    mdtopdfviewerrefresh = 'kill -HUP %pid%',

    -- typst
    typoutputext = 'pdf',
    typtopdf = 'typst compile %docroot% %outputfile%',
    typtopdfviewerlaunch = 'okular %outputfile%',
    typtopdfviewerrefresh = 'kill -HUP %pid%',
  }
  vim.g.knap_settings = gknapsettings
end

function M.keymaps()
  require('which-key').register({
    ['<space>pr'] = {
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        if vim.b[bufnr].preview == nil then
          vim.b[bufnr].preview = true
        else
          vim.b[bufnr].preview = not vim.b[bufnr].preview
        end
        require('knap').toggle_autopreviewing()
      end,
      'Toggle [Pr]eview',
    },
  })
end

return M
