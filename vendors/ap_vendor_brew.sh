alias @initbrew="ap_func_init_brew"
ap_func_init_brew() {
    # https://docs.brew.sh/Shell-Completion
    if type brew &>/dev/null; then
        HOMEBREW_PREFIX="$(brew --prefix)"
        if [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
            source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
        else
            for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
                [ -r "${COMPLETION}" ] && source "${COMPLETION}"
            done
        fi
    fi

    if alias @initbrewshare &>/dev/null; then
        @initbrewshare
    fi

    if alias @initbrewcommon &>/dev/null; then
        @initbrewcommon
    fi
}

alias @createdirstructbrew="ap_func_create_dirstruct_brew"
ap_func_create_dirstruct_brew() {
    if alias @createdirstructbrewshare &>/dev/null; then
        @createdirstructbrewshare
    fi

    if alias @createdirstructbrewcommon &>/dev/null; then
        @createdirstructbrewcommon
    fi
}

alias @rmdirstructbrew="ap_func_remove_dirstruct_brew"
ap_func_remove_dirstruct_brew() {
    if alias @rmdirstructbrewshare &>/dev/null; then
        @rmdirstructbrewshare
    fi

    if alias @rmdirstructbrewcommon &>/dev/null; then
        @rmdirstructbrewcommon
    fi
}

alias @setupbrew="ap_func_setup_brew"
ap_func_setup_brew() {
    # https://brew.sh/
    # https://docs.brew.sh/Homebrew-on-Linux
    # https://github.com/Homebrew/install/#install-homebrew-on-macos-or-linux
    @logshow "Install [brew]\n"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    @initbrew
}

alias @rmbrew="ap_func_remove_brew"
ap_func_remove_brew() {
    # https://github.com/Homebrew/install/#uninstall-homebrew
    @logshow "Remove [brew]\n"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
}
