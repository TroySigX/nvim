local M = {}

function M.setup()
  local gknapsettings = {
    -- latex
    texoutputext = 'pdf',
    textopdf = 'pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%',
    textopdfviewerlaunch = 'xdg-open %outputfile%',
    textopdfviewerrefresh = 'kill -HUP %pid%',

    -- markdown
    mdoutputext = 'pdf',
    mdtopdf = 'pandoc %docroot% -o %outputfile%',
    mdtopdfviewerlaunch = 'xdg-open %outputfile%',
    mdtopdfviewerrefresh = 'kill -HUP %pid%',
  }
  vim.g.knap_settings = gknapsettings
end

function M.keymaps()
  require('which-key').register({
    ['<space>pr'] = {
      function()
        require('knap').toggle_autopreviewing()
      end,
      'Toggle [Pr]eview',
    },
  })
end

return M
