local gore = require('gore')
local has_telescope, telescope = pcall(require, 'telescope')

local function gore_cmd_handler(args)
  if #args.fargs == 0 then
    if has_telescope then
      telescope.extensions.gore.gore()
      return
    else
      vim.notify('Telescope is not installed!')
      return
    end
  end

  local opts = { category = args.fargs[1] }
  if #args.fargs > 1 then
    opts.filename = args.fargs[2]
  end

  gore.save_file(opts)
end

local function get_completion_items(_, line, _)
  -- Only provide completion for the first command arg
  -- checking for < 3 instead of 2 because an empty string is added to the list
  local arg_count = vim.split(line, "%s+")
  if #arg_count < 3 then
    local items = {}
    for key, _ in pairs(gore.categories) do
      table.insert(items, key)
    end
    return items
  end
end

local gore_cmd_opts = {
  force = true,
  complete = get_completion_items,
  nargs = '*',
}

vim.api.nvim_create_user_command('Gore', gore_cmd_handler, gore_cmd_opts)

