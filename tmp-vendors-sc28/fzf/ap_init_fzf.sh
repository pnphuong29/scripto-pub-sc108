# https://github.com/junegunn/fzf
# Dependencies: fd, ag, rg, delta

export AP_VENDORS_FZF_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/fzf"
export AP_VENDORS_FZF_DIR="${HOME}/.fzf"

# Autocomplete and configure PATH for fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Set default command
# export FZF_DEFAULT_COMMAND='find -L . -type f \( \! -ipath "*/.git/*" -and \! -ipath "*/node_modules/*" \)'
export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden --no-ignore --exclude .git --exclude node_modules'
export FZF_FILTER_DIRS='fd --type d --follow --hidden --no-ignore --exclude .git --exclude node_modules'
export FZF_FILTER_FILES='fd --type f --follow --hidden --no-ignore --exclude .git --exclude node_modules'
export FZF_FILTER_PARENT_FILES='fd --type f --follow --hidden --no-ignore --exclude .git --exclude node_modules . ..'

# Set default opt
# export FZF_DEFAULT_OPTS='
# --header "Press Ctrl-D to filter directory, Ctrl-F for files and Alt-Up to go to parent directory"
# --bind "ctrl-d:reload(find -L . -type d \\\( \\\! -ipath \"*/.git/*\" -and \\\! -ipath \"*/node_modules/*\" \\\)),ctrl-f:reload(find -L . -type f \\\( \\\! -ipath \"*/.git/*\" -and \\\! -ipath \"*/node_modules/*\" \\\)),alt-up:reload(find -L .. -type f \\\( \\\! -ipath \"*/.git/*\" -and \\\! -ipath \"*/node_modules/*\" \\\))"'

export FZF_DEFAULT_OPTS='
--header "Press Ctrl-D to filter directory, Ctrl-F for files and Alt-Up to go to parent directory"
--bind "ctrl-d:reload($FZF_FILTER_DIRS),ctrl-f:reload($FZF_FILTER_FILES),alt-up:reload($FZF_FILTER_PARENT_FILES)"'

# Use the below sequence as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='**'
export FZF_COMPLETION_TRIGGER='~'

alias f='fzf'
alias viscfzf="vi -p
	${AP_VENDORS_FZF_SETUP_DIR}/ap_init_fzf.sh \
	${AP_VENDORS_FZF_SETUP_DIR}/ap_setup_fzf.sh \
	${AP_VENDORS_FZF_SETUP_DIR}/ap_remove_fzf.sh \
	"

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'

# Ctrl T opts
# export FZF_CTRL_T_OPTS="--height 40% --min-height 20 --border --preview-window=wrap:right:40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# Alt C opts
# export FZF_ALT_C_OPTS="--preview-window=wrap:right:40% --preview 'tree -C {} | head -200'"

# Ctrl R opts
# export FZF_CTRL_R_OPTS='--sort --exact'

# Start in a tmux split pane
# export FZF_TMUX=1

is_in_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

fzf-down() {
    fzf --height 40% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_gf() {
    is_in_git_repo || return
    git -c color.status=always status --short |
        fzf-down -m --ansi --nth 2..,.. \
            --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
        cut -c4- | sed 's/.* -> //'
}

_gb() {
    is_in_git_repo || return
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
        fzf-down --ansi --multi --tac --preview-window right:70% \
            --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
        sed 's/^..//' | cut -d' ' -f1 |
        sed 's#^remotes/##'
}

_gt() {
    is_in_git_repo || return
    git tag --sort -version:refname |
        fzf-down --multi --preview-window right:70% \
            --preview 'git show --color=always {}'
}

_gh() {
    is_in_git_repo || return
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
        fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
            --header 'Press CTRL-S to toggle sort' \
            --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
        grep -o "[a-f0-9]\{7,\}"
}

_gr() {
    is_in_git_repo || return
    git remote -v | awk '{print $1 "\t" $2}' | uniq |
        fzf-down --tac \
            --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
        cut -d$'\t' -f1
}

_gs() {
    is_in_git_repo || return
    git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
        cut -d: -f1
}

# if [[ $- =~ i ]]; then
# 	bind '"\er": redraw-current-line'
# 	bind '"\C-g\C-f": "$(_gf)\e\C-e\er"'
# 	bind '"\C-g\C-b": "$(_gb)\e\C-e\er"'
# 	bind '"\C-g\C-t": "$(_gt)\e\C-e\er"'
# 	bind '"\C-g\C-h": "$(_gh)\e\C-e\er"'
# 	bind '"\C-g\C-r": "$(_gr)\e\C-e\er"'
# 	bind '"\C-g\C-s": "$(_gs)\e\C-e\er"'
# fi

# cd to selected directory
# @$alias $$ ap_func_cd_fzf {
alias ap_alias_cd_fzf='ap_func_cd_fzf'
alias zd='ap_func_cd_fzf'
alias zdh='ap_func_cd_fzf -p "${AP_SCRIPTO_DIR}"'
alias zdh1='ap_func_cd_fzf -p "${HOME}"'
# }

# @$func $$ ap_func_cd_fzf {
# ap_func_cd_fzf [-p] <filter_path> [--] <search_pattern>
# Description
#	Change to filtered directory
# Options
#	-p Specify working directory
# Parameters
# 	<search_pattern>	Search pattern for fzf to search for directories
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_cd_fzf() {
    local ap_opts_string=':p:'
    local ap_opt=''
    local ap_opt_p=0
    local ap_working_dir="${PWD}"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'p')
            ap_opt_p=1
            ap_working_dir="${OPTARG}"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    local dir

    dir=$(
        fd --type d "${1}" "${ap_working_dir}" 2>/dev/null |
            fzf +m --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'
    )

    if [[ -n "${dir}" ]]; then
        cd "${dir}"
    fi
}

bind '"\C-p": "$( ap_func_cd_fzf )\e\C-e\er"'

# cd to selected parent directory
alias zdp="ap_func_cd_parent_dir_fzf"
ap_func_cd_parent_dir_fzf() {
    local declare dirs=()
    get_parent_dirs() {
        if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
        if [[ "${1}" == '/' ]]; then
            for _dir in "${dirs[@]}"; do echo $_dir; done
        else
            get_parent_dirs $(dirname "$1")
        fi
    }
    local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
    cd "$DIR"
}

# @$alias $$ ap_func_cd_file_fzf {
alias ap_alias_cd_file_fzf='ap_func_cd_file_fzf'
alias zf='ap_func_cd_file_fzf'
alias zfh='ap_func_cd_file_fzf -p "${AP_SCRIPTO_DIR}"'
alias zfh1='ap_func_cd_file_fzf -p "${HOME}"'
# }

# @$func $$ ap_func_cd_file_fzf {
# ap_func_cd_file_fzf [-p] <filter_path> [--] <search_pattern>
# Description
#	Change to parent directory of selected file
# Options
#	-p Specify working directory
# Parameters
# 	<search_pattern>	Search pattern for fzf to search for files
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_cd_file_fzf() {
    local ap_opts_string=':p:'
    local ap_opt=''
    local ap_opt_p=0
    local ap_working_dir="${PWD}"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'p')
            ap_opt_p=1
            ap_working_dir="${OPTARG}"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    local dir
    local file

    # file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
    file=$(
        fd --type f "${1}" "${ap_working_dir}" 2>/dev/null |
            fzf +m --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'
    )

    if [[ -n "${file}" ]]; then
        dir=$(dirname "$file")
        cd "${dir}"
    fi
}

# @$alias $$ ap_func_open_file_fzf {
alias 1f="ap_func_open_file_fzf -d"
alias vif="ap_func_open_file_fzf"
alias vifh="ap_func_open_file_fzf -p ${AP_SCRIPTO_DIR}"
# }

# @$func $$ ap_func_open_file_fzf {
# ap_func_open_file_fzf [-dp] <filter_path> [--] <search_pattern>
# Description
#	Search file using fzf and open file using vi or OS default application
# Options
# 	-d Use OS default application to open
#	-p Specify working directory
# Parameters
# 	<search_pattern>	Search pattern for fzf to search for files
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_open_file_fzf() {
    local ap_opts_string=':dp:'
    local ap_opt=''
    local ap_opt_d=0
    local ap_opt_p=0
    local ap_open_app='vi'
    local ap_working_dir="${PWD}"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'd')
            ap_opt_d=1
            ap_open_app='open'
            ;;
        'p')
            ap_opt_p=1
            ap_working_dir="${OPTARG}"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    local ap_search_pattern="$1"
    local ap_selected_file

    pushd "${ap_working_dir}"
    # fzf +m -q "${ap_search_pattern}" --preview-window=wrap:right:40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' | gxargs "${ap_open_app}"
    ap_selected_file="$(fzf +m -q "${ap_search_pattern}" --preview-window=wrap:right:40% --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200')"
    [[ -f "${ap_selected_file}" ]] && eval "$(echo "${ap_open_app} ${ap_selected_file}")"
    popd
    @rtn_success
}

# fuzzy grep open via ag with line number
alias viag="ap_func_vi_ag"
ap_func_vi_ag() {
    local file
    local line

    # read -r file line <<<"$(ag --nobreak --noheading --color-line-number --color-match $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"
    read -r file line <<-EOF
		$(ag --nobreak --noheading --color-line-number --color-match $@ | fzf -0 -1 | awk -F: '{print $1, $2}')
	EOF

    if [[ -n $file ]]; then
        nvim $file +$line
    fi
}

# search for text in files using Ripgrep and open that file using vi
alias virg="ap_func_vi_rg"

ap_func_vi_rg() {
    IFS=: read -ra selected < <(
        rg --no-heading --line-number --color never "${*:-}" |
            fzf --delimiter : \
                --preview 'bat --color=always --highlight-line {2} {1}' \
                --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
    )
    [ -n "${selected[0]}" ] && nvim "${selected[0]}" "+${selected[1]}"
}

alias fzf1="fzf --delimiter : \
				--preview 'bat --color=always --highlight-line {2} {1}' \
				--preview-window 'up,60%,border-bottom,+{2}+3/3,~3"

# Browse chrome bookmarks
ap_func_browse_chrome_bookmarks() {
    local bookmarks_path
    local jq_script
    local bookmarks_path="${AP_CHROME_BOOKMARK_FILE_PATH:-$HOME/Library/Application Support/Google/Chrome/Default/Bookmarks}"

    # local jq_script='
    # def ancestors: while(. | length >= 2; del(.[-1,-2]));
    # . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

    local jq_script='
        def ancestors: while(. | length >= 2; del(.[-1,-2]));
        . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .name + "\t" + .url'

    jq -r "$jq_script" <"$bookmarks_path" |
        sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' |
        fzf --ansi |
        cut -d$'\t' -f2 |
        gxargs open
}

bind '"\C-b": "$( ap_func_browse_chrome_bookmarks )\e\C-e\er"'

# Browse chrome history
ap_func_browse_chrome_history() {
    local cols
    local sep
    local google_history
    local open

    cols=$((COLUMNS / 3))
    sep='{::}'

    if [ "$(uname)" = "Darwin" ]; then
        google_history="${AP_CHROME_HISTORY_FILE_PATH:-$HOME/Library/Application Support/Google/Chrome/Default/History}"
        open=open
    else
        google_history="${AP_CHROME_HISTORY_FILE_PATH:-$HOME/.config/google-chrome/Default/History}"
        open=xdg-open
    fi

    cp -f "$google_history" /tmp/h

    sqlite3 -separator $sep /tmp/h \
        "select substr(title, 1, $cols), url from urls order by last_visit_time desc" |
        awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
        fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open >/dev/null 2>/dev/null
}

bind '"\C-h": "$( ap_func_browse_chrome_history )\e\C-e\er"'

ap_func_list_emojis() {
    local emojis selected_emoji
    emojis=$(curl -sSL 'https://git.io/JXXO7')
    selected_emoji=$(printf "${emojis}\n" | fzf)
    echo $selected_emoji
}
