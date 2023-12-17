" All coc extensions will be installed when openning neovim first time
" coc will install the missing extensions after coc.nvim service started
let g:coc_global_extensions = [
	\ 'coc-sh',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-tsserver',
	\ 'coc-pyright',
	\ 'coc-solargraph',
	\ 'coc-go',
	\ 'coc-rust-analyzer',
	\ 'coc-phpls',
	\ 'coc-vimlsp',
	\ 'coc-sql',
	\ 'coc-json',
	\ 'coc-yaml',
	\ 'coc-docker',
	\
	\ 'coc-html-css-support',
	\ 'coc-htmlhint',
	\ 'coc-htmldjango',
	\ 'coc-cssmodules',
	\ 'coc-emmet',
	\ 'coc-react-refactor',
	\ 'coc-styled-components',
	\ 'coc-highlight',
	\ 'coc-tabnine',
	\ 'coc-markdown-preview-enhanced',
	\ 'coc-markmap',
	\
	\ 'coc-emoji',
	\ 'coc-snippets',
\ ]

" Archive/backup coc extensios
" You can add them to g:coc_global_extensions if you want to enable them
" \ 'coc-markdownlint',
" \ 'https://github.com/rodrigore/coc-tailwind-intellisense',
" \ 'coc-webview',
" \ 'coc-explorer',
" \ 'coc-prettier',
" \ 'coc-eslint',
" \ 'coc-db',
" \ 'coc-word',
" \ 'coc-dictionary',
" \ 'coc-tag',
" \ 'coc-omni',
" \ 'coc-syntax',
" \ 'coc-utilsnips',

" https://github.com/neoclide/coc.nvim/issues/1826
let g:coc_node_path = $HOME . '/.nvm/versions/node/v16.20.2/bin/node'
" let g:coc_node_path = $HOME . '/.nvm/versions/node/v18.16.1/bin/node'

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

" use <c-space>for trigger completion
inoremap <expr> <c-space> coc#refresh()

" Some terminals may send <NUL> when you press <c-space>
" use <c-space>for trigger completion
inoremap <expr> <NUL> coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" You have to remap <cr> to make sure it confirms completion when popup menu is visible
" since default behavior of <CR> could be different regard to current completion state
" and completeopt option.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Make coc.nvim format your code on <cr>
inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Persist workspace folder
" let g:WorkspaceFolders = ""

" Go to definition
nnoremap <unique> <F12> :call CocAction('jumpDefinition', 'tab drop')<CR>
inoremap <unique> <F12> <Esc>:call CocAction('jumpDefinition', 'tab drop')<CR>

" Show documentation in preview window.
nnoremap <unique> <C-k> :call <SID>show_documentation()<CR>
inoremap <unique> <C-k> <Esc>:call <SID>show_documentation()<CR>
