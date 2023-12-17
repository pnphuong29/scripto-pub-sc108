" https://github.com/josa42/coc-go

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
