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

map <c-p> :Denite file/rec<CR>
map <leader>dp :Denite file/rec<CR>
map <leader>dr :Denite file<CR>
map <leader>df :call DeniteFileHere()<CR>
map <leader>dg :Denite grep<CR>
map <leader>dl :Denite line<CR>
map <leader>db :Denite buffer<CR>
map <leader>dr :Denite register<CR>

