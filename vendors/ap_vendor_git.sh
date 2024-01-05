alias @initgit="ap_func_init_git"
ap_func_init_git() {
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

    alias gst="git status"
    alias gc="git commit"
    alias gps="git push"
    alias gpsupstreamoriginmaster="git push --set-upstream origin master"
    alias gpl="git pull"
    alias gplupstreamoriginmaster="git pull --set-upstream origin master"
    alias ga="git add ."
    alias gacp="git add .; git commit -m \"\${AP_GIT_COMMIT_MSG}\"; git push"
    alias gacpf="git add .; git commit --file=\"\${AP_GIT_COMMIT_FILE}\"; git push"
    alias gl="git log --all --oneline --graph --decorate"
    alias glt="git ls-tree -r -t --full-tree --full-name --abbrev --long"
    alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"
    alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
    alias gd="git --no-pager diff --name-status"
    alias gshow="git --no-pager show --abbrev-commit --name-status"
    alias gcf="git commit --file=\${AP_GIT_COMMIT_FILE}"

    if alias @initgitshare &>/dev/null; then
        @initgitshare
    fi

    if alias @initgitcommon &>/dev/null; then
        @initgitcommon
    fi
}

alias @createdirstructgit="ap_func_create_dirstruct_git"
ap_func_create_dirstruct_git() {
    @logshow "Generate [git] bash autocomplete\n"
    curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"

    if [ -f "${HOME}/scripto-common/vendors/git/ap_git.conf" ]; then
        # Create .gitconfig symbolic link
        @logshow "Link [${HOME}/.gitconfig] to [${HOME}/scripto-common/vendors/git/ap_git.conf]\n"
        ln -sf "${HOME}/scripto-common/vendors/git/ap_git.conf" "${HOME}/.gitconfig"
    fi

    if [ -f "${HOME}/scripto-common/vendors/git/ap_gitignore_global" ]; then
        # Use git global ignore as a backup solution in case you forgot to add [.gitignore]
        # @#recommend $$ Use [.gitignore] in project whenever possible
        @logshow "Link [${HOME}/.gitignore_global] to [${HOME}/scripto-common/vendors/git/ap_git.conf]\n"
        ln -sf "${HOME}/scripto-common/vendors/git/ap_gitignore_global" "${HOME}/.gitignore_global"

        # Update global ignore file path in ~/.gitconfig file
        if [ "$(git config --global core.excludesFile)" != "${HOME}/.gitignore_global" ]; then
            @logshow "Add/update global git ignore config to [${HOME}/.gitconfig] file\n"
            git config --global core.excludesFile "${HOME}/.gitignore_global"
        fi
    fi

    if alias @createdirstructgitshare &>/dev/null; then
        @createdirstructgitshare
    fi

    if alias @createdirstructgitcommon &>/dev/null; then
        @createdirstructgitcommon
    fi
}

alias @rmdirstructgit="ap_func_rm_dirstruct_git"
ap_func_rm_dirstruct_git() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_git.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"
    rm -f "${HOME}/.gitconfig"
    rm -f "${HOME}/.gitignore_global"

    if alias @rmdirstructgitshare &>/dev/null; then
        @rmdirstructgitshare
    fi

    if alias @rmdirstructgitcommon &>/dev/null; then
        @rmdirstructgitcommon
    fi
}

alias @setupgit="ap_func_setup_git"
ap_func_setup_git() {
    @logshow "Install [git]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install git
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y git
    fi

    @initgit
    if alias @createdirstructgit &>/dev/null; then
        @createdirstructgit
    fi
}

alias @rmgit="ap_func_rm_git"
ap_func_rm_git() {
    @logshow "Remove [git]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove git
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y git
    fi

    if alias @rmdirstructgit &>/dev/null; then
        @rmdirstructgit
    fi
}

alias gcm='ap_func_git_commit'
ap_func_git_commit() {
    git commit -m "$1"
    @rtn_success
}

alias gpl='ap_func_git_pull'
alias gplall='ap_func_git_pull all'
alias gplscall='ap_func_git_pull sc'
alias gplcustom='ap_func_git_pull custom'
# @$func $$ ap_func_git_pull {
# ap_func_git_pull [--] <project_group_code...>
# Description
# 	Perform git pull for projects (default: all projects)
# 	This function should be used only for private project which has only 1 branch
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_git_pull() {
    local projects=()

    for ap_prj_group_code in "$@"; do
        local ap_prj_group_code="${ap_prj_group_code^^}"
        local ap_prj_group_name="AP_PRJ_LIST_CODE_${ap_prj_group_code}"
        eval "$(printf "ap_prj_group=("\${%s[@]}")" "${ap_prj_group_name}")"
        @minfo "Git pull for projects [${ap_prj_group[@]}]\n"
        projects+=("${ap_prj_group[@]}")
    done

    for prj_name in "${projects[@]}"; do
        printf "Git pull [%s]\n" "${prj_name}"
        prj_var="AP_PRJ_${prj_name}_DIR"
        cd "${!prj_var}"
        git pull
        echo
    done

    @rtn_success
}

alias gacp='ap_func_git_commit_push'
alias gacpall='ap_func_git_commit_push all'
alias gacpscall='ap_func_git_commit_push sc'
alias gacpcustom='ap_func_git_commit_push custom'
# @$func $$ ap_func_git_commit_push {
# ap_func_git_commit_push [--] <project_group_code...>
# Description
# 	Perform git commit and push for projects (default: all projects)
# 	This function should be used only for private project which has only 1 branch
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_git_commit_push() {
    local projects=()

    for ap_prj_group_code in "$@"; do
        local ap_prj_group_code="${ap_prj_group_code^^}"
        local ap_prj_group_name="AP_PRJ_LIST_CODE_${ap_prj_group_code}"
        eval "$(printf "ap_prj_group=("\${%s[@]}")" "${ap_prj_group_name}")"
        @minfo "Git push and commit for projects [${ap_prj_group[@]}]\n"
        projects+=("${ap_prj_group[@]}")
    done

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

alias gcl='ap_func_git_clone'
alias gcla='ap_func_git_clone all'
alias gclsc='ap_func_git_clone sc'
alias gclcustom='ap_func_git_clone custom'
# @$func $$ ap_func_git_clone {
# ap_func_git_clone [--] <project_group_code...>
# Description
# 	Perform git clone for group projects
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_git_clone() {
    local projects=()

    for ap_prj_group_code in "$@"; do
        local ap_prj_group_code="${ap_prj_group_code^^}"

        local ap_prj_group_name="AP_PRJ_LIST_CODE_${ap_prj_group_code}"
        eval "$(printf "ap_prj_codes=("\${%s[@]}")" "${ap_prj_group_code}")"

        local ap_prj_group_url="AP_PRJ_LIST_URL_${ap_prj_group_code}"
        eval "$(printf "ap_prj_urls=("\${%s[@]}")" "${ap_prj_group_url}")"

        @minfo "Git clone for projects [${ap_prj_codes[@]}]\n"
        projects+=("${ap_prj_urls[@]}")
    done

    for prj in "${projects[@]}"; do
        printf "Clone [%s]\n" "${prj}"
        ghq get "${prj}"
        echo
    done

    @rtn_success
}
