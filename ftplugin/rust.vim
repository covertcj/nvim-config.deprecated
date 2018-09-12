echoerr "Loading"

if !exists('g:deoplete#sources#rust#racer_binary') || g:deoplete#sources#rust#racer_binary == ''
    if executable('racer')
        let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
    endif
endif

if !exists('g:deoplete#sources#rust#rust_source_path') || g:deoplete#sources#rust#rust_source_path == ''
    if executable('rustc')
        " if src was installed via rustup, get it by running rustc
        let rustc_root = systemlist('rustc --print sysroot')[0]
        let rustc_src_dir = rustc_root . '/lib/rustlib/src/rust/src'

        if isdirectory(rustc_src_dir)
            let g:deoplete#sources#rust#rust_source_path = rustc_src_dir
        endif
    endif
endif

