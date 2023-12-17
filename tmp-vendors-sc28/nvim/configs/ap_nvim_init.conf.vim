" No need to be compatible with the old vi editor
set nocompatible

" Copy directly to system clipboard
" set clipboard+=unnamed
set clipboard+=unnamedplus

set encoding=utf-8
set ignorecase
set smartcase
set smarttab
set number
set tabstop=4
set shiftwidth=4
set autoindent
set cursorline

" Leader key
let mapleader = '\'

" By default you have 1000ms after typing your leader key to type your shortcut
set timeoutlen=1000

" Enable the use of the mouse in all modes
set mouse=a

" Automatically change to the current file's directory
set autochdir

" Always show tab line
" set showtabline=2

" Max numbers of tabs
" set tabpagemax=15

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Others
syntax on
filetype plugin indent on

" let verbose=1

" highlight the current line in every window and update the highlight as the cursor moves
" Attention! Setting this option may cause low performance in large file
" set cursorline
" set cursorcolumn

" Set cursor line color on visual mode
" highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

" highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

let g:markdown_fenced_languages = [
	\ 'vim',
	\ 'help'
\ ]

let g:ap_symlinks_dir = $HOME . '/scripto/symlinks'
let g:ap_vendors_nvim_setup_dir = $HOME . '/scripto/projects/p29-github/pnphuong29/ap-scripts-common-sc28/vendors/nvim'
let g:ap_vendors_nvim_setup_configs_dir = ap_vendors_nvim_setup_dir . '/configs'
let g:ap_nvim_color_scheme = 'everforest'
" let g:ap_nvim_color_scheme = 'onehalflight'

" Specify Python3 provider
" let g:python3_host_prog = $AP_SYMLINKS_DIR . '/python3'
let g:python3_host_prog = ap_symlinks_dir . '/python3'
let g:NVIM_PYTHON_LOG_FILE = $HOME . '/scripto/logs/nvim/python.log'

" Disable Python2 support
let g:loaded_python_provider = 0

" Load Plug Manager
" exe 'source' . $AP_VENDORS_NVIM_SETUP_CONFIGS_DIR . '/ap_nvim_plugin_junegunn_vim_plug.vim'
exe 'source' . ap_vendors_nvim_setup_configs_dir . '/ap_nvim_plugin_junegunn_vim_plug.vim'

" Import plugins
" for plugin_file in split(glob($AP_VENDORS_NVIM_SETUP_DIR . '/plugins/*.vim'), '\n')
for plugin_file in split(glob(ap_vendors_nvim_setup_dir . '/plugins/*.vim'), '\n')
	exe 'source' . plugin_file
endfor

" Load Coc Extensions
" exe 'source' . $AP_VENDORS_NVIM_SETUP_CONFIGS_DIR . '/ap_nvim_plugin_05_77_neoclide_coc_nvim.vim'
exe 'source' . ap_vendors_nvim_setup_configs_dir . '/ap_nvim_plugin_05_77_neoclide_coc_nvim.vim'

" Import themes
" for theme_file in split(glob($AP_VENDORS_NVIM_SETUP_DIR . '/themes/*.vim'), '\n')
for theme_file in split(glob(ap_vendors_nvim_setup_dir . '/themes/*.vim'), '\n')
	exe 'source' . theme_file
endfor

" Themes & color schemes
" exe 'colorscheme ' . $AP_NVIM_COLOR_SCHEME
exe 'colorscheme ' . ap_nvim_color_scheme

" https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes

" Correct comment highlighting for jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" Syntax highlight for Vagrantfile
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.jsonl set filetype=json

" Import keys mapping
" exe 'source' . $AP_VENDORS_NVIM_SETUP_CONFIGS_DIR . '/ap_nvim_keymap.conf.vim'
exe 'source' . ap_vendors_nvim_setup_configs_dir . '/ap_nvim_keymap.conf.vim'

" Import functions
" exe 'source' . $AP_VENDORS_NVIM_SETUP_CONFIGS_DIR . '/ap_nvim_func_general.vim'
exe 'source' . ap_vendors_nvim_setup_configs_dir . '/ap_nvim_func_general.vim'
