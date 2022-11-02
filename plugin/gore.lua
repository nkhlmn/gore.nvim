local gore = require('gore')

local function gore_cmd_handler(args)
  local arg = args.fargs[1]
  if arg ~= nil then
    gore.save_file(arg)
  end
end

local gore_cmd_opts = {
  force = true,
  complete = gore.get_completion_items,
  nargs = '?',
}

vim.api.nvim_create_user_command('Gore', gore_cmd_handler, gore_cmd_opts)

gore.setup({
  categories = {
    ['sandbox'] = { name = 'Sandbox', folder = '~/development/sandbox'},
    ['development'] = { name = 'Development', folder = '~/development'},
  }
})

