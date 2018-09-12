let my_plug_home = g:my_config_dir."/plugged"
call plug#begin(my_plug_home)


""""""""""""
"""" theming

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'covertcj/vim-schemer'


""""""""""""
"""" general
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 't9md/vim-choosewin'


"""""""""""""""""""""
"""" language support
Plug 'sebastianmarkow/deoplete-rust'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'HerringtonDarkholme/deoplete-typescript', { 'do': ':UpdateRemotePlugins', 'commit': 'dec62bfee61b4e371b1a9892cf1bcc99e6144100' }

" vimL
Plug 'Shougo/neco-vim'


call plug#end()
if isdirectory(my_plug_home)
    let g:my_plugins_detected=1
"    PlugInstall
endif

