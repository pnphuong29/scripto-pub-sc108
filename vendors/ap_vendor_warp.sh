alias apinitwarp="ap_func_init_warp"
ap_func_init_warp() {
    export AP_WARP_VERSION='0.2025.03.05.08.02'

    if alias apinitwarpshare &>/dev/null; then
        apinitwarpshare
    fi

    if alias apinitwarpcommon &>/dev/null; then
        apinitwarpcommon
    fi
}

alias apcreatedirstructwarp="ap_func_create_dirstruct_warp"
ap_func_create_dirstruct_warp() {
    if alias apcreatedirstructwarpshare &>/dev/null; then
        apcreatedirstructwarpshare
    fi

    if alias apcreatedirstructwarpcommon &>/dev/null; then
        apcreatedirstructwarpcommon
    fi
}

alias aprmdirstructwarp="ap_func_rm_dirstruct_warp"
ap_func_rm_dirstruct_warp() {
    if alias aprmdirstructwarpshare &>/dev/null; then
        aprmdirstructwarpshare
    fi

    if alias aprmdirstructwarpcommon &>/dev/null; then
        aprmdirstructwarpcommon
    fi
}

alias apsetupwarp="ap_func_setup_warp"
ap_func_setup_warp() {
    # https://www.warp.dev/
    aplogshow "Install [Warp v${AP_WARP_VERSION}]\n"

    local ap_dl_url=''
    cd "${AP_TMP_DIR}"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install --cask warp # Error when install using this way
        ap_dl_url="https://releases.warp.dev/stable/v${AP_WARP_VERSION}.stable_02/Warp.dmg"
        apshowmsginfo "Download warp from [${ap_dl_url}]"
        curl -SL "${ap_dl_url}" >warp.dmg
        hdiutil attach -nobrowse warp.dmg
        cd "/Volumes/Warp"
        cp -R "Warp.app" /Applications/
        cd ~
        hdiutil detach "/Volumes/Warp"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_dl_url="https://releases.warp.dev/stable/v${AP_WARP_VERSION}.stable_02/warp-terminal_${AP_WARP_VERSION}.stable.02_amd64.deb"
        apshowmsginfo "Download warp from [${ap_dl_url}]"
        curl -SL "${ap_dl_url}" >warp.deb
        sudo dpkg -i warp.deb
    fi

    # cd ~
    # rm -rf "${AP_TMP_DIR}/warp"

    apinitwarp
    if alias apcreatedirstructwarp &>/dev/null; then
        apcreatedirstructwarp
    fi
}

alias aprmwarp="ap_func_rm_warp"
ap_func_rm_warp() {
    # https://docs.warp.dev/help/uninstalling-warp
    aplogshow "Remove [Warp]\n"

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

    if alias aprmdirstructwarp &>/dev/null; then
        aprmdirstructwarp
    fi

    if alias aprmglobalsymlinkwarp &>/dev/null; then
        aprmglobalsymlinkwarp
    fi
}
