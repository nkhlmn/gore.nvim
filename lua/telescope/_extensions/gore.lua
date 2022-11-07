local gore = require('gore')

local function attach_mappings(prompt_bufnr, _)
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  actions.select_default:replace(function()
    actions.close(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    gore.save_file(entry.value)
  end)

  return true
end

local function entry_maker(entry)
  return { value = entry, display = entry.name, ordinal = entry.name }
end

local function get_telescope_picker(results, opts)
  local pickers = require('telescope.pickers')
  local conf = require('telescope.config').values
  local finders = require('telescope.finders')
  local dropdown = require('telescope.themes').get_dropdown({})
  opts = vim.tbl_deep_extend('force', dropdown, opts or {})

  if results == nil then
    results = {}
  end

  local gore_categories = {}
  if gore.categories ~= nil then
    for key, val in pairs(gore.categories) do
      val.category = key
      table.insert(gore_categories, val)
    end
  end
  results = vim.list_extend(results, gore_categories)

  local finder = finders.new_table({ results = results, entry_maker = entry_maker })
  local picker = pickers.new(opts, {
    prompt_title = 'Gore',
    finder = finder,
    sorter = conf.generic_sorter(opts),
    attach_mappings = attach_mappings,
  })
  return picker
end

return require('telescope').register_extension({
  exports = {
    gore = function(results, opts)
      local picker = get_telescope_picker(results, opts)
      picker:find()
    end,
  },
})
