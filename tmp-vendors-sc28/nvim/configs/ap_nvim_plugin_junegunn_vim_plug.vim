" @#warning $$ Be careful about the orders of plugins when placing them
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	" lf file explorer
	" Dependencies: vim-floaterm
	Plug 'ptzz/lf.vim'

	" Floating terminal manager
	Plug 'voldikss/vim-floaterm'

	" Status bar
	" It's recommended to place this plugin before any other theme plugins
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Theme
	Plug 'sainnhe/everforest'

	" Theme
	Plug 'sonph/onehalf', { 'rtp': 'vim' }

	" Theme
	Plug 'overcache/NeoSolarized'

	" Rainbow CSV - Vim plugin: Highlight columns in CSV and TSV files and run queries in SQL-like language
	Plug 'mechatroner/rainbow_csv'

	" Indent guides for Neovim | lua
	Plug 'lukas-reineke/indent-blankline.nvim'

	" Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
	" should be placed after Xuyuanp/nerdtree-git-plugin
	Plug 'ryanoasis/vim-devicons'

	" A cross platform terminal image viewer
	Plug 'edluffy/hologram.nvim'

	" Emmet
	Plug 'mattn/emmet-vim'

	" https://github.com/editorconfig/editorconfig-vim
	" Plug 'editorconfig/editorconfig-vim'

	" https://github.com/prettier/vim-prettier
	" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

    " https://github.com/andrejlevkovitch/vim-lua-format
    Plug 'andrejlevkovitch/vim-lua-format'

	" https://prettier.io/docs/en/vim.html
	" Plug 'sbdchd/neoformat'

	" autopep8 plugin for Vim
	" Plug 'tell-k/vim-autopep8'

	" Coc extension | tailwind intellisense
	Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

	" Fuzzy search | fzf
	" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	" set rtp+=~/.fzf/bin/fzf
	Plug '~/.fzf'
	Plug 'junegunn/fzf.vim'

	" Allignment
	Plug 'junegunn/vim-easy-align'

	" Generate text based diagrams
	Plug 'willchao612/vim-diagon'

	" The fancy start screen
	Plug 'mhinz/vim-startify'

	" Multiple cursors plugin for vim/neovim
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	" Comment stuff out
	Plug 'tpope/vim-commentary'

	" Basic support for .env and Procfile
	Plug 'tpope/vim-dotenv'

	" Tabulous | Lightweight Vim plugin to enhance the tabline including numbered tab page labels
	Plug 'webdevel/tabulous'

	" Shell scripts linter
	" Dependencies: shfmt
	Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

	" Rust
	Plug 'rust-lang/rust.vim'

	" Golang
	" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" Heroku CLI wrapper
	Plug 'tpope/vim-heroku'

	" Ruby on Rails power tools
	" Plug 'tpope/vim-rails'

	" Improved nginx vim plugin (incl. syntax highlighting)
	Plug 'chr4/nginx.vim'

	" Highlight insecure SSL configuration in Vim
	" Plug 'chr4/sslsecure.vim'

	" Coc | LSP | Linter
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
	" Plug 'dense-analysis/ale'

	" Git wrapper
	" Plug 'tpope/vim-fugitive'

	" Code assistance | auto-generated contents | code completion
	Plug 'SirVer/ultisnips'

	" Snippets are separated from the engine. Add this if you want them:
	Plug 'honza/vim-snippets'

	" Vim syntax for sxhkd's configuration files
	Plug 'baskerville/vim-sxhkdrc'

	" Vim stuff for indent, highlight syntax and detect sxhkd - Simple X hotkey daemon configuration files.
	" Plug 'kovetskiy/sxhkd-vim'

	" Markdown preview
	" Plug 'skanehira/preview-markdown.vim'

	" Kitty config syntax highlighting
	" Plug 'fladson/vim-kitty'

	" Paste image from clipboard | lua
	" Plug 'ekickx/clipboard-image.nvim'

	" Plugin highlighting word under cursor and all of its occurences
	" Plug 'dominikduda/vim_current_word'

	" https://github.com/francoiscabrol/ranger.vim
	" Dependencies: rbgrouleff/bclose.vim
	" Plug 'francoiscabrol/ranger.vim'
	" Plug 'rbgrouleff/bclose.vim'

	" Adds autojump support to vim
	" Plug 'trotter/autojump.vim'

	" Paste image to markdown
	" Plug 'ferrine/md-img-paste.vim'

	" Display the indention levels with thin vertical lines
	" Plug 'Yggdroot/indentLine', { 'rtp': 'after' }

	" cheat.sh | docs | reference
	" Plug 'dbeniamine/cheat.sh-vim'

	" Modern database interface for Vim
	" Better if using with tpope/vim-rails and if so then install tpope/vim-rails
	" first before install tpope/vim-dadbod
	" Plug 'tpope/vim-dadbod'

	" Simple UI for tpope/vim-dadbod
	" Dependencies: tpope/vim-dadbod
	" Plug 'kristijanhusak/vim-dadbod-ui'

	" Tree explorer | lua
	" Plug 'kyazdani42/nvim-web-devicons' " for file icons
	" Plug 'kyazdani42/nvim-tree.lua'

	" Fuzzy picker | Explorer
	" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

	" Syntax checking hacks
	" Plug 'vim-syntastic/syntastic'

	" NERDTree | Explorer
	" Plug 'preservim/nerdtree'

	" NERDTree | Showing git status
	" Plug 'Xuyuanp/nerdtree-git-plugin'

	" NERDTree | Extra syntax and highlight for nerdtree files
	" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	" NERDTree and tabs together
	" Plug 'jistr/vim-nerdtree-tabs'
call plug#end()
