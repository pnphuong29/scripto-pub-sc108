alias apinitbrew="ap_func_init_brew"
ap_func_init_brew() {
    # https://docs.brew.sh/Shell-Completion
    # if type brew &>/dev/null; then
    #     HOMEBREW_PREFIX="$(brew --prefix)"
    #     if [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]; then
    #         source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    #     else
    #         for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
    #             [ -r "${COMPLETION}" ] && source "${COMPLETION}"
    #         done
    #     fi
    # fi

    if alias apinitbrewshare &>/dev/null; then
        apinitbrewshare
    fi

    if alias apinitbrewcommon &>/dev/null; then
        apinitbrewcommon
    fi
}

alias apcreatedirstructbrew="ap_func_create_dirstruct_brew"
ap_func_create_dirstruct_brew() {
    if alias apcreatedirstructbrewshare &>/dev/null; then
        apcreatedirstructbrewshare
    fi

    if alias apcreatedirstructbrewcommon &>/dev/null; then
        apcreatedirstructbrewcommon
    fi
}

alias aprmdirstructbrew="ap_func_rm_dirstruct_brew"
ap_func_rm_dirstruct_brew() {
    if alias aprmdirstructbrewshare &>/dev/null; then
        aprmdirstructbrewshare
    fi

    if alias aprmdirstructbrewcommon &>/dev/null; then
        aprmdirstructbrewcommon
    fi
}

alias apsetupbrew="ap_func_setup_brew"
ap_func_setup_brew() {
    # https://brew.sh/
    # https://docs.brew.sh/Homebrew-on-Linux
    # https://github.com/Homebrew/install/#install-homebrew-on-macos-or-linux
    aplogshow "Install [brew]\n"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    apinitbrew
}

alias aprmbrew="ap_func_rm_brew"
ap_func_rm_brew() {
    # https://github.com/Homebrew/install/#uninstall-homebrew
    aplogshow "Remove [brew]\n"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
}
