local M = {}

function M.get_config()
  local config = vim.g.gore_config
  return config or {}
end

function M.get_categories()
  local config = M.get_config()
  return config.categories or {}
end

function M.get_category(key)
  local categories = M.get_categories()
  return categories[key]
end

function M.save_file(opts)
  local category = M.get_category(opts.category)
  if category == nil then
    vim.notify('Not category defined for ' + opts.category)
    return
  end

  local folder = category.folder
  if folder == nil then
    vim.notify('Not folder defined for ' + opts.category)
    return
  end

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
  else
    vim.notify('Could not construct a filename!')
  end
end

return M
