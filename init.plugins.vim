let my_plug_home = g:my_config_dir."/plugged"
call plug#begin(my_plug_home)


""""""""""""
"""" theming

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'covertcj/vim-schemer'


""""""""""""
"""" general
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'} " Conquer of Completion
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

Plug 'editorconfig/editorconfig-vim'
"Plug 't9md/vim-choosewin'


"""""""""""""""""""""
"""" language support

" vimL
Plug 'Shougo/neco-vim'

Plug 'HerringtonDarkholme/yats.vim'


call plug#end()
if isdirectory(my_plug_home)
    let g:my_plugins_detected=1
"    PlugInstall
endif

