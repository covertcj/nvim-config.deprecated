set termguicolors

set number relativenumber
" toggle relativenumber when leaving a buffer
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

call g:schemer#set_default_scheme('challenger_deep')
call g:schemer#load_scheme()

nnoremap <leader>cl :call schemer#set_scheme('PaperColor')<CR>
nnoremap <leader>cd :call schemer#set_scheme('challenger_deep')<CR>

