let g:my_config_dir = fnamemodify($MYVIMRC, ":p:h")

exec "source " . g:my_config_dir."/init.plugins.vim"
exec "source " . g:my_config_dir."/init.theme.vim"
exec "source " . g:my_config_dir."/init.general.vim"
exec "source " . g:my_config_dir."/init.general.keybindings.vim"
exec "source " . g:my_config_dir."/init.genesys.vim"

