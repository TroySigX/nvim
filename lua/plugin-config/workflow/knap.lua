local M = {}

local autopreview = {}

-- returns true if autopreview is on
function Knap_autopreview(bufnr)
  return autopreview[bufnr]
end

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
    ['<space>pr'] = {
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        if autopreview[bufnr] == nil then
          autopreview[bufnr] = true
        else
          autopreview[bufnr] = not autopreview[bufnr]
        end
        require('knap').toggle_autopreviewing()
      end,
      'Toggle [Pr]eview',
    },
  })
end

return M
