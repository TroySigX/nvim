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
  }
  vim.g.knap_settings = gknapsettings
end

function M.keymaps()
  require('which-key').register({
    ['<space>pr'] = { require('knap').toggle_autopreviewing, 'Toggle [Pr]eview' },
  })
end

return M
