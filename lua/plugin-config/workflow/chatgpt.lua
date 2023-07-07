local M = {}

function M.keymaps()
  return {
    { '<F11>', vim.cmd.ChatGPT, silent = true, desc = 'Toggle ChatGPT window', mode = { 'n', 'i', 'v' } },
  }
end

function M.setup()
  require('chatgpt').setup({
    api_key_cmd = 'op read op://Personal/"OpenAI API Key"/"api key" --no-newline'
  })
end

return M
