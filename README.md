vim-usd-usdview is a Vim plugin that lets the user open Pixar's USD
files in usdview. You can open the files in the foreground or in the
background, so you can writing your USD files and see the results in
usdview!


## Installation
Use your plugin manager to add this plugin to Vim.

### vim-plug
```vim
Plug 'ColinKennedy/vim-usd-usdview'
nmap <leader>vv <Plug>OpenCurrentFileInBackground
nmap <leader>vw <Plug>OpenPathUnderCursorInUSDViewInBackground
xmap <leader>vw <Plug>OpenPathUnderCursorInUSDViewInBackground
```

### Vundle
```vim
Plugin 'ColinKennedy/vim-usd-usdview'
nmap <leader>vv <Plug>OpenCurrentFileInBackground
nmap <leader>vw <Plug>OpenPathUnderCursorInUSDViewInBackground
xmap <leader>vw <Plug>OpenPathUnderCursorInUSDViewInBackground
```

## Mappings
The plugin mappings shown above will load usdview in the background so
that you can continue to work in Vim. If you'd like usdview to run in
the foreground (and block you from editting files in Vim), use these
commands:

```vim
nmap <leader>vv <Plug>OpenCurrentFile
nmap <leader>vw <Plug>OpenPathUnderCursorInUSDView
xmap <leader>vw <Plug>OpenPathUnderCursorInUSDView
```

## Requirements
- Must have USD compiled
- `usdview` (or another equivalent executable) command must be available
in your PATH environment variable. `usdview` is used to convert to and
from binary.

## Options

|         Variable          |                   Description                    |  Default  |
|---------------------------|--------------------------------------------------|-----------|
| g:vim_usd_usdview_command | The executable that will be used to load usdview | "usdview" |

