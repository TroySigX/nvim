local M = {}

function M.setup()
  local gknapsettings = {
    -- pause time after typing for live preview
    delay = 100,

    -- latex
    texoutputext = 'pdf',
    textopdf = 'pdflatex -jobname "$(basename -s .pdf %outputfile%)" -halt-on-error',
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
  require('utils.keymaps').add_keymap({
    '<space>pt',
    function()
      require('knap').toggle_autopreviewing()
    end,
    '[P]review [T]oggle',
  })
end

return M
