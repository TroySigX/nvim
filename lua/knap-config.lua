local gknapsettings = {
    -- latex
    texoutputext = 'pdf',
    textopdf = 'pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%',
    textopdfviewerlaunch = 'zathura %outputfile%',
    textopdfviewerrefresh = 'kill -HUP %pid%',

    -- markdown
    mdoutputext = 'pdf',
    mdtopdf = 'pandoc %docroot% -o %outputfile%',
    mdtopdfviewerlaunch = 'zathura %outputfile%',
    mdtopdfviewerrefresh = 'kill -HUP %pid%',
}
vim.g.knap_settings = gknapsettings
