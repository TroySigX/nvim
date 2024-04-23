local M = {}

--- outputs selection from a list
---@param prompt string question prompted for selecting
---@param items table list of items to select from
---@return string selected item
function M.select(prompt, items)
  local co = coroutine.running()

  vim.ui.select(items, {
    prompt = prompt,
  }, function(choice)
    coroutine.resume(co, choice)
  end)

  return coroutine.yield()
end

return M
