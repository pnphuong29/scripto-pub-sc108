" https://github.com/dense-analysis/ale

" Moving between errors
" nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
" nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Fixers
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'javascript': ['prettier'],
\   'python': ['autopep8'],
\}

" If you are running ALE in combination with another LSP client, you may wish to disable ALE's LSP functionality entirely.
let g:ale_disable_lsp = 1

" By default, ALE enables running the linters when files are saved
" let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

" If you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" If you don't want ALE to run anything other than what you've explicitly asked for,
" you can set g:ale_linters_explicit to 1.
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" By default, ALE supports automatic imports from external modules
let g:ale_completion_autoimport = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 0

" You can keep the sign gutter open at all times by setting the g:ale_sign_column_always to 1
let g:ale_sign_column_always = 0

" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 1

" ALE signs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" ALE sets some background colors automatically for warnings and errors in the sign gutter
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
highlight ALEWarning ctermbg=DarkMagenta

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
