alias @initwarp="ap_func_init_warp"
ap_func_init_warp() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        alias zwarpconf="cd \${HOME}/.warp"
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        alias zwarpconf="cd \${HOME}/.config/warp-terminal"
    fi

    alias zwarpshare="cd \${HOME}/.local/share/warp"
    alias zwarpstate="cd \${HOME}/.local/state/warp"

    if alias @initwarpshare &>/dev/null; then
        @initwarpshare
    fi

    if alias @initwarpcommon &>/dev/null; then
        @initwarpcommon
    fi
}

alias @createdirstructwarp="ap_func_create_dirstruct_warp"
ap_func_create_dirstruct_warp() {
    if alias @createdirstructwarpshare &>/dev/null; then
        @createdirstructwarpshare
    fi

    if alias @createdirstructwarpcommon &>/dev/null; then
        @createdirstructwarpcommon
    fi
}

alias @rmdirstructwarp="ap_func_rm_dirstruct_warp"
ap_func_rm_dirstruct_warp() {
    if alias @rmdirstructwarpshare &>/dev/null; then
        @rmdirstructwarpshare
    fi

    if alias @rmdirstructwarpcommon &>/dev/null; then
        @rmdirstructwarpcommon
    fi
}

alias @setupwarp="ap_func_setup_warp"
ap_func_setup_warp() {
    # https://www.warp.dev/
    @logshow "Install [Warp]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask warp
        # curl -SL "https://releases.warp.dev/stable/v0.2024.02.13.08.02.stable_00/Warp.dmg" >warp.dmg
        # hdiutil attach -nobrowse warp.dmg
        # cd "/Volumes/Warp"
        # cp -R "Warp.app" /Applications/
        # cd ~
        # hdiutil detach "/Volumes/Warp"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        cd "${AP_TMP_DIR}"
        curl -SL "https://releases.warp.dev/stable/v0.2024.02.20.08.01.stable_02/warp-terminal_0.2024.02.20.08.01.stable.02_amd64.deb" >warp.deb
        sudo dpkg -i warp.deb
    fi

    cd ~
    rm -rf "${AP_TMP_DIR}/warp"

    @initwarp
    if alias @createdirstructwarp &>/dev/null; then
        @createdirstructwarp
    fi
}

alias @rmwarp="ap_func_rm_warp"
ap_func_rm_warp() {
    # https://docs.warp.dev/help/uninstalling-warp
    @logshow "Remove [Warp]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # rm -rf /Applications/Warp.app
        brew uninstall --cask warp
        defaults delete dev.warp.Warp-Stable
        rm -f "${HOME}/Library/Logs/warp.log"
        rm -rf "${HOME}/Library/Application Support/dev.warp.Warp-Stable"
        rm -rf "${HOME}/Library/Saved Application State/dev.warp.Warp-Stable.savedState"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge warp
        rm -rf "${XDG_CONFIG_HOME:-$HOME/.config}/warp-terminal"
        rm -rf "${XDG_STATE_HOME:-$HOME/.local/state}/warp-terminal"
        rm -rf "${XDG_STATE_HOME:-$HOME/.local/share}/warp-terminal"
    fi

    rm -rf "${HOME}/.warp"

    if alias @rmdirstructwarp &>/dev/null; then
        @rmdirstructwarp
    fi

    if alias @rmglobalsymlinkwarp &>/dev/null; then
        @rmglobalsymlinkwarp
    fi
}
