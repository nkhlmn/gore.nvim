# gore.nvim

## :exclamation::exclamation::exclamation: WIP :exclamation::exclamation::exclamation:

Categorize files quickly i.e. save the current file to a predefined location

## Installation

```lua
use { 
  'nkhlmn/contemplate.nvim',
  config = function() 
    require('gore').setup({
      categories = {
        ['sandbox'] = { name = 'Sandbox', folder = '~/development/sandbox' },
        ['nvim_lua_scripts'] = { name = 'Neovim Lua Scripts', folder = '~/development/nvim_lua' },
      }
    })
  end
}
```

## Usage

Call `:Gore <arg>` to save the current file, where `<arg>` is one of the keys in the table passed into `setup()`

## TODO

- Telescope support
