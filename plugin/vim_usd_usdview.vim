if get(g:, 'vim_usd_usdview_loaded', 0) == 1
    finish
endif

let g:vim_usd_usdview_command = get(g:, 'vim_usd_usdview_command', 'usdview')

if !executable(g:vim_usd_usdview_command)
    echoerr 'Command "' . g:vim_usd_usdview_command . '" is not executable. vim-usd-usdview cannot be loaded.'
    finish
endif


" Reference: https://gist.github.com/breja/8de867327301054acd334e77c9bba7b3
function! GetVisualSelection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction


command! -nargs=0 OpenCurrentBufferInUSDView call vim_usd_usdview#open_current_buffer_in_usdview()
command! -nargs=0 OpenCurrentBufferInUSDViewInBackground call vim_usd_usdview#open_current_buffer_in_usdview('background')
command! -nargs=0 OpenPathUnderCursorInUSDView call vim_usd_usdview#open_path_in_usdview(expand('<cfile>'))
command! -nargs=0 OpenPathUnderCursorInUSDViewInBackground call vim_usd_usdview#open_path_in_usdview(expand('<cfile>'), 'background')

nnoremap <silent> <Plug>OpenCurrentFile :OpenCurrentBufferInUSDView<CR>
nnoremap <silent> <Plug>OpenCurrentFileInBackground :OpenCurrentBufferInUSDViewInBackground<CR>
nnoremap <silent> <Plug>OpenPathUnderCursorInUSDView :OpenPathUnderCursorInUSDView<CR>
nnoremap <silent> <Plug>OpenPathUnderCursorInUSDViewInBackground :OpenPathUnderCursorInUSDViewInBackground<CR>
xnoremap <silent> <Plug>OpenPathUnderCursorInUSDView :call vim_usd_usdview#open_path_in_usdview(GetVisualSelection())<CR>
xnoremap <silent> <Plug>OpenPathUnderCursorInUSDViewInBackground :call vim_usd_usdview#open_path_in_usdview(GetVisualSelection(), 'background')<CR>

let g:vim_usd_usdview_loaded = 1
