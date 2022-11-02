local M = {}

M.categories = {}

function M.setup(opts)
  if opts.categories ~= nil then
    M.categories = opts.categories
  end
end

function M.save_file(arg)
  local entry = M.categories[arg]
  local folder = entry.folder
  local filename = vim.fn.expand('%:t')
  vim.cmd.saveas(folder .. '/' .. filename)
end

function M.get_completion_items()
  local items = {}
  for key, _ in pairs(M.categories) do
    table.insert(items, key)
  end

  return items
end

return M
