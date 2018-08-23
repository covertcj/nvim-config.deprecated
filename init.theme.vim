set termguicolors

set number relativenumber
" toggle relativenumber when leaving a buffer
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

""""""""""""""""""""""""""""
""" MyColorScheme workaround
""" See: https://github.com/altercation/solarized/issues/102
if !exists('s:known_links')
    let s:known_links = {}
endif

function! s:Find_links() " {{{1 Find and remember links between highlighting groups.
    redir => listing
    try
        silent highlight
    finally
        redir END
    endtry
    for line in split(listing, "\n")
        let tokens = split(line)
        " We're looking for lines like "String xxx links to Constant" in the
        " output of the :highlight command.
        if len(tokens) == 5 && tokens[1] == 'xxx' && tokens[2] == 'links' && tokens[3] == 'to'
            let fromgroup = tokens[0]
            let togroup = tokens[4]
            let s:known_links[fromgroup] = togroup
        endif
    endfor
endfunction

function! s:Restore_links() " {{{1
    " Restore broken links between highlighting groups.
    redir => listing
    try
        silent highlight
    finally
        redir END
    endtry
    let num_restored = 0
    for line in split(listing, "\n")
        let tokens = split(line)
        " We're looking for lines like "String xxx cleared" in the
        " output of the :highlight command.
        if len(tokens) == 3 && tokens[1] == 'xxx' && tokens[2] == 'cleared'
            let fromgroup = tokens[0]
            let togroup = get(s:known_links, fromgroup, '')
            if !empty(togroup)
                execute 'hi link' fromgroup togroup
                let num_restored += 1
            endif
        endif
    endfor
endfunction

function! s:AccurateColorscheme(colo_name)
    call <SID>Find_links()
    exec "colorscheme " a:colo_name
    call <SID>Restore_links()
endfunction

command! -nargs=1 -complete=color MyColorscheme call <SID>AccurateColorscheme(<q-args>)

""" End MyColorScheme

function! ApplyMyDarkTheme()
    set background=dark
    MyColorscheme challenger_deep
endfunction

function! ApplyMyLightTheme()
    set background=light
    MyColorscheme PaperColor
endfunction

nnoremap <leader>cl :call ApplyMyLightTheme()<CR>
nnoremap <leader>cd :call ApplyMyDarkTheme()<CR>

try
    call ApplyMyDarkTheme()
catch /^Vim\%((\a\+)\)\=:E185/
endtry
