export AP_VENDORS_GIT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/git"
export AP_VENDORS_GIT_SETUP_CONFIGS_DIR="${AP_VENDORS_GIT_SETUP_DIR}/configs"

# Create .gitconfig symbolic link
if [ ! -L ~/.gitconfig ]; then
    @minfo "Link [${HOME}/.gitconfig] to [${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_git.conf]\n"
    ln -sf "${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_git.conf" ~/.gitconfig
fi

# Update global ignore file path in ~/.gitconfig file
if [ "$(git config --global core.excludesFile)" != "${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_gitignore_global.ignore" ]; then
    @minfo "Adding/updating global git ignore config to [${HOME}/.gitconfig] file\n"
    git config --global core.excludesFile "${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_gitignore_global.ignore"
fi

export AP_GIT_COMMIT_MSG="Auto commit"
export AP_GIT_COMMIT_FILE="commit_msg.md"

# When set to "1", do not include "DWIM" suggestions in git-checkout
# and git-switch completion (e.g., completing "foo" when "origin/foo"
# exists).
# export GIT_COMPLETION_CHECKOUT_NO_GUESS=0

# When set to "1" suggest all commands, including plumbing commands
# which are hidden by default (e.g. "cat-file" on "git ca<TAB>").
export GIT_COMPLETION_SHOW_ALL_COMMANDS=1

# When set to "1" suggest all options, including options which are
# typically hidden (e.g. '--allow-empty' for 'git commit').
export GIT_COMPLETION_SHOW_ALL=1

# Autocomplete
source "${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_completion_git.bash"

# Aliases
alias vigitcommitmsgfile='[[ -f "${PWD}/${AP_GIT_COMMIT_FILE}" ]] && vi "${PWD}/${AP_GIT_COMMIT_FILE}"'
alias viscgit="vi -p \
	${AP_VENDORS_GIT_SETUP_DIR}/ap_init_git.sh \
	${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_git.conf \
	${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_gitignore_global.ignore"

alias gitgeneratebashcompletions='curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_completion_git.bash"'

alias gst='git status'
alias gc='git commit'
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'

alias ga=' git add .'
alias gacp="git add .; git commit -m \"${AP_GIT_COMMIT_MSG}\"; git push"
alias gacpf="git add .; git commit --file=\"${AP_GIT_COMMIT_FILE}\"; git push"

alias gl='git log --all --oneline --graph --decorate'
alias glt='git ls-tree -r -t --full-tree --full-name --abbrev --long'
alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"

alias gd='git --no-pager diff --name-status'
alias gsh='git --no-pager show --abbrev-commit --name-status'

alias gcf="git commit --file=\"${AP_GIT_COMMIT_FILE}\""

# @$alias $$ ap_func_git_commit {
alias ap_alias_git_commit_with_msg='ap_func_git_commit'
alias gcm='ap_func_git_commit'
# }

# @$func $$ ap_func_git_commit {
# ap_func_git_commit [--] *<msg>
# Description
# 	Perform a git commit with input message
# Params
# 	*<msg> Commit message
# Return Status
# 	0: Success
# }

ap_func_git_commit() {
    git commit -m "$1"
    return 0
}

# @$alias $$ ap_func_prj_git_pull {
alias ap_alias_prj_git_pull='ap_func_prj_git_pull'
alias gplscall='ap_func_prj_git_pull -s'
alias gplc='ap_func_prj_git_pull -c'
alias gplall='ap_func_prj_git_pull'
# }

# @$func $$ ap_func_prj_git_pull {
# ap_func_prj_git_pull
# Description
# 	Perform git pull for projects (default: all projects)
# 	This function should be used only for private project which has only 1 branch
# Options
# 	-s Only apply for all script projects (sc-*)
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_prj_git_pull() {
    local ap_opts_string='sc'
    local ap_opt=''
    local ap_opt_s=0
    local ap_opt_c=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        's')
            ap_opt_s=1
            ;;
        'c')
            ap_opt_c=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Impletation
    local projects=("${AP_PRJ_LIST_CODE_ALL[@]}")
    if [[ "${ap_opt_s}" = 1 ]]; then
        projects=("${AP_PRJ_LIST_CODE_SC[@]}")
    elif [[ "${ap_opt_c}" = 1 ]]; then
        projects=("${AP_PRJ_LIST_CODE_CUSTOM[@]}")
    fi

    for prj_name in "${projects[@]}"; do
        printf "Git pull [%s]\n" "${prj_name}"
        prj_var="AP_PRJ_${prj_name}_DIR"
        cd "${!prj_var}"
        git pull
        echo
    done

    @rtn_success
}

# @$alias $$ ap_func_prj_git_commit_push {
alias ap_alias_prj_git_commit_push='ap_func_prj_git_commit_push'
alias gacpscall='ap_func_prj_git_commit_push -s'
alias gacpc='ap_func_prj_git_commit_push -c'
alias gacpall='ap_func_prj_git_commit_push'
# }

# @$func $$ ap_func_prj_git_commit_push {
# ap_func_prj_git_commit_push
# Description
# 	Perform git commit and push for projects (default: all projects)
# 	This function should be used only for private project which has only 1 branch
# Options
# 	-s Only apply for all script projects (sc-*)
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_prj_git_commit_push() {
    local ap_opts_string='sc'
    local ap_opt=''
    local ap_opt_s=0
    local ap_opt_c=0

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        's')
            ap_opt_s=1
            ;;
        'c')
            ap_opt_c=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Impletation
    local projects=("${AP_PRJ_LIST_CODE_ALL[@]}")
    if [[ "${ap_opt_s}" = 1 ]]; then
        projects=("${AP_PRJ_LIST_CODE_SC[@]}")
    elif [[ "${ap_opt_c}" = 1 ]]; then
        projects=("${AP_PRJ_LIST_CODE_CUSTOM[@]}")
    fi

    for prj_name in "${projects[@]}"; do
        printf "Git commit and push [%s]\n" "${prj_name}"
        prj_var="AP_PRJ_${prj_name}_DIR"
        cd "${!prj_var}"
        git add .
        git commit -m "Auto commit"
        git push
        echo
    done

    @rtn_success
}

# @$alias $$ ap_func_prj_git_clone {
alias ap_alias_prj_git_clone='ap_func_prj_git_clone'
alias gcl='ap_func_prj_git_clone'
alias gcla='ap_func_prj_git_clone -a'
alias gclsc='ap_func_prj_git_clone -s'
alias gcle='ap_func_prj_git_clone -e'
alias gclo='ap_func_prj_git_clone -o'
alias gclp='ap_func_prj_git_clone -p'
alias gclc='ap_func_prj_git_clone -c'
# }

# @$func $$ ap_func_prj_git_clone {
# ap_func_prj_git_clone [-paseoc] [--] <project_names...>
# Description
# 	Perform git clone for specified projects [all if not specified]
# Options
#	-p Clone public repos
# 	-a Clone all projects
# 	-s Clone all scripts projects
# 	-e Clone all essential projects
# 	-o Clone other projects
# 	-c Clone custom projects
# Parameters
# 	<project_names...> Names of projects to clone
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_prj_git_clone() {
    local ap_opts_string='paseo'
    local ap_opt=''
    local ap_opt_p=0
    local ap_opt_a=0
    local ap_opt_s=0
    local ap_opt_e=0
    local ap_opt_o=0
    local ap_opt_c=0
    local ap_clone_location="${AP_GH_P29_DIR}"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        'p')
            ap_opt_p=1
            ap_clone_location="${AP_GH_DIR}"
            ;;
        'a')
            ap_opt_a=1
            ;;
        's')
            ap_opt_s=1
            ;;
        'e')
            ap_opt_e=1
            ;;
        'o')
            ap_opt_o=1
            ;;
        'c')
            ap_opt_c=1
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @rtn_err_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Impletation
    pushd "${ap_clone_location}"
    local projects=()

    if [[ "$#" > 0 ]]; then
        for ap_repo_name in "$@"; do
            git clone "git@github.com:pnphuong29/${ap_repo_name}.git"
        done
    else
        if [[ "$ap_opt_a" == 1 ]]; then
            projects=("${AP_PRJ_LIST_URL_ALL[@]}")
        elif [[ "$ap_opt_s" == 1 ]]; then
            projects=("${AP_PRJ_LIST_URL_SC[@]}")
        elif [[ "$ap_opt_e" == 1 ]]; then
            projects=("${AP_PRJ_LIST_URL_ESSENTIAL[@]}")
        elif [[ "$ap_opt_o" == 1 ]]; then
            projects=("${AP_PRJ_LIST_URL_OTHERS[@]}")
        elif [[ "$ap_opt_p" == 1 ]]; then
            projects=("${AP_PRJ_LIST_URL_PUBLIC[@]}")
        elif [[ "$ap_opt_c" == 1 ]]; then
            projects=("${AP_PRJ_LIST_URL_CUSTOM[@]}")
        fi

        for prj in "${projects[@]}"; do
            printf "Clone [%s]\n" "${prj}"
            git clone "${prj}"
            echo
        done
    fi

    popd
    @rtn_success
}
