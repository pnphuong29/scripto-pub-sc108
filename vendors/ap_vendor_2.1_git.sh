alias apinitgit="ap_func_init_git"
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
    alias gb='git --no-pager branch'
    alias gba='git --no-pager branch --all'
    alias gco='git checkout'
    alias gcodev='git checkout dev'
    alias gcotest='git checkout test'
    alias gcouat='git checkout uat'
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

    if alias apinitgitshare &>/dev/null; then
        apinitgitshare
    fi

    if alias apinitgitcommon &>/dev/null; then
        apinitgitcommon
    fi
}

alias apcreatedirstructgit="ap_func_create_dirstruct_git"
ap_func_create_dirstruct_git() {
    aplogshow "Generate [git] bash autocomplete\n"
    curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"

    if [ -f "${HOME}/scripto-share/vendors/git/ap_git.conf" ]; then
        # Create .gitconfig symbolic link
        aplogshow "Link [${HOME}/.gitconfig] to [${HOME}/scripto-share/vendors/git/ap_git.conf]\n"
        ln -sf "${HOME}/scripto-share/vendors/git/ap_git.conf" "${HOME}/.gitconfig"
    fi

    if [ -f "${HOME}/scripto-share/vendors/git/ap_gitignore_global" ]; then
        # Use git global ignore as a backup solution in case you forgot to add [.gitignore]
        # @#recommend $$ Use [.gitignore] in project whenever possible
        aplogshow "Link [${HOME}/.gitignore_global] to [${HOME}/scripto-share/vendors/git/ap_git.conf]\n"
        ln -sf "${HOME}/scripto-share/vendors/git/ap_gitignore_global" "${HOME}/.gitignore_global"

        # Update global ignore file path in ~/.gitconfig file
        if [ "$(git config --global core.excludesFile)" != "${HOME}/.gitignore_global" ]; then
            aplogshow "Add/update global git ignore config to [${HOME}/.gitconfig] file\n"
            git config --global core.excludesFile "${HOME}/.gitignore_global"
        fi
    fi

    if alias apcreatedirstructgitshare &>/dev/null; then
        apcreatedirstructgitshare
    fi

    if alias apcreatedirstructgitcommon &>/dev/null; then
        apcreatedirstructgitcommon
    fi
}

alias aprmdirstructgit="ap_func_rm_dirstruct_git"
ap_func_rm_dirstruct_git() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_git.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"
    rm -f "${HOME}/.gitconfig"
    rm -f "${HOME}/.gitignore_global"

    if alias aprmdirstructgitshare &>/dev/null; then
        aprmdirstructgitshare
    fi

    if alias aprmdirstructgitcommon &>/dev/null; then
        aprmdirstructgitcommon
    fi
}

alias apsetupgit="ap_func_setup_git"
ap_func_setup_git() {
    aplogshow "Install [git]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install git
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y git
    fi

    apinitgit
    if alias apcreatedirstructgit &>/dev/null; then
        apcreatedirstructgit
    fi
}

alias aprmgit="ap_func_rm_git"
ap_func_rm_git() {
    aplogshow "Remove [git]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove git
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y git
    fi

    if alias aprmdirstructgit &>/dev/null; then
        aprmdirstructgit
    fi
}
