local M = {}

M.categories = {}

function M.setup(opts)
  if opts.categories ~= nil then
    M.categories = opts.categories
  end
end

function M.save_file(opts)
  local entry = M.categories[opts.category]
  local folder = entry.folder
  local filename = vim.fn.expand('%:t')

  if opts.filename ~= nil then
    if opts.filename:match('%.%a+$') ~= nil then
      filename = opts.filename
    else
      local extension = string.match(filename, '%w+.(%w+)$')
      filename = string.format('%s.%s', opts.filename, extension)
    end
  end

  if filename ~= nil and filename ~= '' then
    vim.cmd.saveas(folder .. '/' .. filename)
  end
end

return M
