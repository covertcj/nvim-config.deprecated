let my_plug_home = g:my_config_dir."/plugged"
call plug#begin(my_plug_home)


""""""""""""
"""" theming

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'NLKNguyen/papercolor-theme'


""""""""""""
"""" general
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"""""""""""""""""""""
"""" language support
Plug 'sebastianmarkow/deoplete-rust'


call plug#end()
if isdirectory(my_plug_home)
    let g:my_plugins_detected=1
"    PlugInstall
endif

