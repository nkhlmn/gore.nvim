local gore = require('gore')

local function gore_cmd_handler(args)
  local arg = args.fargs[1]
  if arg ~= nil then
    gore.save_file(arg)
  end
end

local function get_completion_items()
  local items = {}
  for key, _ in pairs(gore.categories) do
    table.insert(items, key)
  end

  return items
end

local gore_cmd_opts = {
  force = true,
  complete = get_completion_items,
  nargs = '?',
}

vim.api.nvim_create_user_command('Gore', gore_cmd_handler, gore_cmd_opts)

