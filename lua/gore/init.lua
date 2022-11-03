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
  if filename ~= nil and filename ~= '' then
    vim.cmd.saveas(folder .. '/' .. filename)
  end
end

return M
