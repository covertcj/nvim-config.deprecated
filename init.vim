let g:my_config_dir = fnamemodify($MYVIMRC, ":p:h")

let g:my_plugins_detected = 0
exec "source " . g:my_config_dir."/init.plugins.vim"
if g:my_plugins_detected
    exec "source " . g:my_config_dir."/init.theme.vim"
    exec "source " . g:my_config_dir."/init.general.vim"

    exec "source " . g:my_config_dir."/init.plugins.denite.vim"

    exec "source " . g:my_config_dir."/init.general.keybindings.vim"
    exec "source " . g:my_config_dir."/init.genesys.vim"
endif

