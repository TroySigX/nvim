local M = {}

function M.setup()
  local gknapsettings = {
    -- pause time after typing for live preview
    delay = 100,

    -- latex
    texoutputext = 'pdf',
    -- textopdf = 'lualatex -jobname "$(basename -s .pdf %outputfile%)" -halt-on-error', -- lualatex
    textopdf = 'pdflatex -jobname "$(basename -s .pdf %outputfile%)" -halt-on-error', -- pdflatex
    textopdfviewerlaunch = 'okular  %outputfile%',
    textopdfbufferasstdin = true,

    -- markdown
    mdoutputext = 'pdf',
    mdtopdf = 'pandoc -f markdown --standalone -o %outputfile%',
    mdtopdfviewerlaunch = 'okular %outputfile%',
    mdtopdfbufferasstdin = true,

    -- typst
    typoutputext = 'pdf',
    typtopdf = 'typst compile %docroot% %outputfile%',
    typtopdfviewerlaunch = 'okular %outputfile%',
  }
  vim.g.knap_settings = gknapsettings
end

function M.keymaps()
  local map = require('utils.keymaps').add_keymap

  map({
    '<space>pt',
    function()
      require('knap').toggle_autopreviewing()
    end,
    '[P]review [T]oggle',
  })

  map({
    '<space>po',
    function()
      require('knap').process_once()
    end,
    '[P]rocess [O]nce',
  })
end

return M
