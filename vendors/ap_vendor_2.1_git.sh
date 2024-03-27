alias apinitgit="ap_func_init_git"
ap_func_init_git() {
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
