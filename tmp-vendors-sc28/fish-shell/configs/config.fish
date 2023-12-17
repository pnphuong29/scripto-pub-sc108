if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Enable iTerm2 shell integration tools

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Universal variables

set -xU APU_DOWNLOAD_DIR ~/Downloads
set -xU APU_HOME_DIR ~/pnphuong29

set -xU APU_SOFTWARE_DIR $APU_HOME_DIR/Software

set -xU APU_GOOGLE_DRIVE_DIR $APU_HOME_DIR/"Google Drive"/pnphuong29
set -xU APU_GOOGLE_DRIVE_SSS_DIR $APU_HOME_DIR/"Google Drive"/albert.pham.87.sss

set -xU APU_ONE_DRIVE_DIR ~/pnphuong29/OneDrive
set -xU APU_CAMERA_ROLL_DIR $APU_ONE_DRIVE_DIR/Pictures/"Camera Roll"
set -xU APU_SCREENSHOTS_DIR $APU_ONE_DRIVE_DIR/Pictures/Screenshots
set -xU APU_CAPTURES_DIR $APU_ONE_DRIVE_DIR/Pictures/Captures
set -xU APU_KEYS_DIR $APU_ONE_DRIVE_DIR/Keys

set -xU APU_CODING_DIR $APU_HOME_DIR/Coding
set -xU APU_PROJECTS_DIR $APU_CODING_DIR/projects
set -xU APU_PROJECTS_GITHUB_DIR $APU_PROJECTS_DIR/pnphuong29.github.com/pnphuong29
set -xU APU_PROJECTS_SCRIPTS_DIR $APU_PROJECTS_DIR/pnphuong29.github.com/pnphuong29/scripts
set -xU APU_PROJECTS_SNIPPETS_DIR $APU_PROJECTS_DIR/pnphuong29.github.com/pnphuong29/snippets

set -l TMP_PATH
set -p TMP_PATH $APU_PROJECTS_SCRIPTS_DIR/tests
set -p TMP_PATH $APU_PROJECTS_SCRIPTS_DIR/utilities
set -p TMP_PATH $APU_PROJECTS_SCRIPTS_DIR/bin/macos
set -p TMP_PATH /Users/pnphuong29/.composer/vendor/bin
set -p TMP_PATH /Users/pnphuong29/Library/Python/3.9/bin
set -p TMP_PATH /Users/pnphuong29/.local/bin

for var in $TMP_PATH
    if contains $var $PATH
       continue
    else
        set -p PATH $var
    end
end

# Global variables

set -xg GHQ_ROOT $APU_PROJECTS_DIR # ghq environment variable
set -xg GITHUB_TOKEN ( cat $APU_KEYS_DIR/github/pnphuong29_full_token_github ) # GitHub CLI token authorization 
set -xg GITLAB_TOKEN ( cat $APU_KEYS_DIR/gitlab/pnphuong29_full_token_gitlab ) # GitLab CLI token authorization 

# Variables

#set pipenv_fish_fancy yes

# Abbreviations

## git

if type git
	abbr -a gl 'git log --oneline --graph --decorate'
	abbr -a gc 'git commit -m "Auto commit msg"'
	abbr -a gcf 'git commit -F commit_msg.md'
	abbr -a gsb 'git show-branch'
	abbr -a glt 'git ls-tree -r --name-status'
	abbr -a gd 'git --no-pager diff --name-status'
	abbr -a gst 'git status'
	abbr -a ga 'git add .'
	abbr -a gp 'git push'
	abbr -a gacp 'git add . ; git commit -m "Auto commit msg" ; git push'
	abbr -a gsh 'git --no-pager show --abbrev-commit --name-status'
end

## vim

if type nvim
	alias vi='nvim'
	abbr -a enc 'vi ~/.config/nvim/init.vim'
else if type vim
	alias vi='vim'
end

abbr -a efc 'vi ~/.config/fish/config.fish'
abbr -a esc 'vi ~/.ssh/config'

abbr -a bkfish-configs 'cp -f ~/.config/fish/config.fish $APU_PROJECTS_SNIPPETS_DIR/fish-shell/configs/macos/'
abbr -a bkvim-configs 'cp -f ~/.config/nvim/init.vim $APU_PROJECTS_SNIPPETS_DIR/vim/configs/macos/'

## exa

if type exa
	abbr -a ll 'exa -a --all --long --header --icons --group --group-directories-first'
	abbr -a llg 'exa -a --all --git --long --header --icons --group --group-directories-first'
end

## cd

abbr -a zdl 'cd $APU_DOWNLOAD_DIR'
abbr -a zss 'cd $APU_SCREENSHOTS_DIR'
abbr -a zcap 'cd $APU_CAPTURES_DIR'
abbr -a zcam 'cd $APU_CAMERA_ROLL_DIR'
abbr -a zkeys 'cd $APU_KEYS_DIR'
abbr -a zprj 'cd $APU_PROJECTS_DIR'
abbr -a zsnippets 'cd $APU_PROJECTS_SNIPPETS_DIR'
abbr -a zscripts 'cd $APU_PROJECTS_SCRIPTS_DIR'
abbr -a zgd 'cd $APU_GOOGLE_DRIVE_DIR'
abbr -a zws 'cd $APU_GOOGLE_DRIVE_DIR/WS'
abbr -a zod 'cd $APU_ONE_DRIVE_DIR'
abbr -a zvms 'cd $APU_CODING_DIR/vms/virtualbox'
abbr -a zsoft 'cd $APU_SOFTWARE_DIR'

## open

abbr -a oe 'open'
abbr -a odl 'open $APU_DOWNLOAD_DIR'
abbr -a ocam 'open $APU_CAMERA_ROLL_DIR'
abbr -a oss 'open $APU_SCREENSHOTS_DIR'
abbr -a ocap 'open $APU_CAPTURES_DIR'
abbr -a ood 'open $APU_ONE_DRIVE_DIR'
abbr -a ogd 'open $APU_GOOGLE_DRIVE_DIR'
abbr -a ogd-sss 'open $APU_GOOGLE_DRIVE_SSS_DIR'

## misc

if test -d $APU_PROJECTS_SNIPPETS_DIR
	abbr -a vs 'glow $APU_PROJECTS_SNIPPETS_DIR'
	abbr -a es 'vi $APU_PROJECTS_SNIPPETS_DIR'
end

if test -d $APU_PROJECTS_SCRIPTS_DIR
	abbr -a 1tf 'source $APU_PROJECTS_SCRIPTS_DIR/tests/1tf'
	abbr -a 2tf 'source $APU_PROJECTS_SCRIPTS_DIR/tests/2tf'
	
	abbr -a e1t 'vi $APU_PROJECTS_SCRIPTS_DIR/tests/1t'
	abbr -a e2t 'vi $APU_PROJECTS_SCRIPTS_DIR/tests/2t'
	abbr -a e1tf 'vi $APU_PROJECTS_SCRIPTS_DIR/tests/1tf'
	abbr -a e2tf 'vi $APU_PROJECTS_SCRIPTS_DIR/tests/2tf'
end

abbr -a par 'php artisan'

# Startup commands

cd "$APU_PROJECTS_DIR"/pnphuong29.github.com/pnphuong29
clear

