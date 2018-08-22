if $TIER_ROOT_COREWEB
    " TODO: investigate setting this and the args on a per buffer basis
    let g:neomake_javascript_enabled_makers = ['jshint']

    " auto detect a coreweb ref's jshintrc
    let coreweb_roots = split($TIER_ROOT_COREWEB)
    for root in coreweb_roots
        let jshintrc = root.'/pub/src/.jshintrc'
        if filereadable(jshintrc)
            let g:neomake_javascript_jshint_args = neomake#makers#ft#javascript#jshint().args + [ '--config='.jshintrc ]
            break
        endif
    endfor
endif

