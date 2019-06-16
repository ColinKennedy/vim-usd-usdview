function! s:open_in_usdview(path, background)
    if !filereadable(a:path)
        echoerr 'Path "' . a:path . '" does not exist'
        return
    endif

    let l:command = g:vim_usd_usdview_command . ' ' . a:path

    if a:background == 1
        let l:command .= ' &'
    endif

    call system(l:command)
endfunction


" Open the current path in Pixar's usdview application
function! vim_usd_usdview#open_in_usdview(path, ...)
    let l:run_in_background = index(a:000, 'background') >= 0
    call s:open_in_usdview(a:path, l:run_in_background)
endfunction
