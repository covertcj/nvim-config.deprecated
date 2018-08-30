" pt (the platinum searcher) support
if executable('pt')
    call denite#custom#var(
    \    'file/rec',
    \    'command',
    \    ['pt', '--follow', '--nocolor', '--nogroup', (has('win32') ? '-g:' : '-g='), ''])

    call denite#custom#var('grep', 'command', ['pt'])
    call denite#custom#var('grep', 'default_opts',
                \ ['--nogroup', '--nocolor', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
else
    echom '[CJC] No pt executable found'
endif

function! MyDeniteFileHere()
    let root = expand("%:p")
    if filereadable(root)
        let root = fnamemodify(root, ":h")
    elseif exists('b:netrw_curdir')
        let root = b:netrw_curdir
    else
        echoerr "I don't know how to find a path for this buffer"
        return
    endif

    execute ':Denite file "'.root."'"
endfunction

noremap  <c-p>      :Denite file/rec<CR>
nnoremap <leader>dp :Denite file/rec<CR>
nnoremap <leader>dd :Denite file<CR>
nnoremap <leader>df :call MyDeniteFileHere()<CR>
nnoremap <leader>dg :Denite grep<CR>
nnoremap <leader>dl :Denite line<CR>
noremap  <c-b>      :Denite buffer<CR>
nnoremap <leader>db :Denite buffer<CR>
nnoremap <leader>dr :Denite register<CR>

