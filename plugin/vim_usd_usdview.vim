if get(g:, 'vim_usd_usdview_loaded', 0) == 1
    finish
endif

command! -nargs=* OpenInUSDView call OpenInUSDView('visual', <f-args>)
command! -nargs=* OpenCurrentFileInUSDView call s:OpenInUSDView(expand('%'), <f-args>)
nnoremap <Plug>VimUsdUsdviewOpenCurrentFile :OpenCurrentFileInUSDView<CR>


xnoremap <buffer> <leader>vv :OpenCurrentFileInUSDView<CR>
nnoremap <buffer> <leader>vv :OpenCurrentFileInUSDView<CR>
xnoremap <buffer> <leader>vs :call OpenInUSDView()<CR>
nnoremap <buffer> <leader>vs :call OpenInUSDView()<CR>


let g:vim_usd_usdview_loaded = 1
