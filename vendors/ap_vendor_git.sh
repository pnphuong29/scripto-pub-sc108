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

    if alias @initgitcommon &>/dev/null; then
        @initgitcommon
    fi
}

alias @createdirstructgit="ap_func_create_dirstruct_git"
ap_func_create_dirstruct_git() {
    @logshow "Generate [git] bash autocomplete\n"
    curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"

    if alias @createdirstructgitcommon &>/dev/null; then
        @createdirstructgitcommon
    fi
}

alias @rmdirstructgit="ap_func_remove_dirstruct_git"
ap_func_remove_dirstruct_git() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_git.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash"

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

    if alias @createdirstructgit &>/dev/null; then
        @createdirstructgit
    fi
}

alias @rmgit="ap_func_remove_git"
ap_func_remove_git() {
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
