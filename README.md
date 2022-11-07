# gore.nvim

## :exclamation::exclamation::exclamation: WIP :exclamation::exclamation::exclamation:

This plugin lets you save the current file to a predefined location. I built this to be used alongside [`contemplate.nvim`](https://github.com/nkhlmn/contemplate.nvim), which I use to quickly create files.

## Installation

```lua
use { 
  'nkhlmn/gore.nvim',
  config = function() 
    require('gore').setup({
      categories = {
        ['sandbox'] = { name = 'Sandbox', folder = '~/development/sandbox' },
        ['nvim_lua'] = { name = 'Neovim Lua Scripts', folder = '~/development/nvim_lua' },
      }
    })
  end
}
```

### (optional) Telescope support

Ensure the extension is loaded in your neovim config:
```lua
require('telescope').load_extension('gore')
```

## Usage

Call `:Gore <arg> <filename>` to save the current file, where `<arg>` is one of the keys in the table passed into `setup()` and `<filename>` is optional.

If `<filename>` is not provided, the current filename will be used. The file extension is optional. If not provided, it will use the current filename's extension.

If no arguments are provided and `telescope.nvim` is installed, a picker will be opened with your configured categories.

Examples:
```vim
" Assuming the current file being edited is a lua script named `nvim_lua-20221106T145630.lua`
" and the categories are configured like in the example config above

" Saves a copy of the current file to ~/development/nvim_lua/nvim_lua-20221106T145630.lua
:Gore sandbox

" Saves a copy of the current file to ~/development/nvim_lua/my_awesome_script.lua
:Gore nvim_lua my_awesome_script
" or
:Gore nvim_lua my_awesome_script.lua
```

## TODO

- Prompt for filename in telescope picker?
