local M = {}

function M.setup()
  local gknapsettings = {
    -- pause time after typing for live preview
    delay = 100,

    -- latex
    texoutputext = 'pdf',
    textopdf = 'pdflatex -jobname "$(basename -s .pdf %outputfile%)" -halt-on-error',
    textopdfviewerlaunch = 'okular --unique %outputfile%',
    textopdfbufferasstdin = true,

    -- markdown
    mdoutputext = 'pdf',
    mdtopdf = 'pandoc -f markdown --standalone -o %outputfile%',
    mdtopdfviewerlaunch = 'okular --unique %outputfile%',
    mdtopdfbufferasstdin = true,

    -- typst
    typoutputext = 'pdf',
    typtopdf = 'typst compile %docroot% %outputfile%',
    typtopdfviewerlaunch = 'okular --unique %outputfile%',
  }
  vim.g.knap_settings = gknapsettings
end

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<space>pr',
    function()
      require('knap').toggle_autopreviewing()
    end,
    'Toggle [Pr]eview',
  })
end

return M
