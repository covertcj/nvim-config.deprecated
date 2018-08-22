set hidden
set history=100

set wrap

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

map <leader>l :Neomake<CR>
call neomake#configure#automake('nrwi', 500)
let g:neomake_open_list = 2

