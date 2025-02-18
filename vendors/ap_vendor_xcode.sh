alias apinitxcode="ap_func_init_xcode"
ap_func_init_xcode() {
    if alias apinitxcodeshare &>/dev/null; then
        apinitxcodeshare
    fi

    if alias apinitxcodecommon &>/dev/null; then
        apinitxcodecommon
    fi

    if alias apinitxcodemain &>/dev/null; then
        apinitxcodemain
    fi
}

alias apcreatedirstructxcode="ap_func_create_dirstruct_xcode"
ap_func_create_dirstruct_xcode() {
    if alias apcreatedirstructxcodeshare &>/dev/null; then
        apcreatedirstructxcodeshare
    fi

    if alias apcreatedirstructxcodecommon &>/dev/null; then
        apcreatedirstructxcodecommon
    fi

    if alias apcreatedirstructxcodemain &>/dev/null; then
        apcreatedirstructxcodemain
    fi
}

alias aprmdirstructxcode="ap_func_rm_dirstruct_xcode"
ap_func_rm_dirstruct_xcode() {
    if alias aprmdirstructxcodeshare &>/dev/null; then
        aprmdirstructxcodeshare
    fi

    if alias aprmdirstructxcodecommon &>/dev/null; then
        aprmdirstructxcodecommon
    fi

    if alias aprmdirstructxcodemain &>/dev/null; then
        aprmdirstructxcodemain
    fi
}

alias apsetupxcode="ap_func_setup_xcode"
ap_func_setup_xcode() {
    aplogshow "Install [Xcode]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
        sudo xcodebuild -license

        # Configure your iOS simulator
        # xcodebuild -downloadPlatform iOS

        # Install GitHub Copilot
        aplogshow "Install GitHub Copilot extension\n"
        # brew install --cask github-copilot-for-xcode # if no choice then use this method to install
        curl -SL "https://github.com/github/CopilotForXcode/releases/latest/download/GitHubCopilotForXcode.dmg" >"${AP_TMP_DIR}/GitHubCopilotForXcode.dmg"
        cd "${AP_TMP_DIR}"
        hdiutil attach -nobrowse GitHubCopilotForXcode.dmg
        cp -R "/Volumes/GitHub Copilot for Xcode/GitHub Copilot for Xcode.app" "/Applications/"
        hdiutil detach "/Volumes/GitHub Copilot for Xcode"
        # rm -f GitHubCopilotForXcode.dmg
    fi

    apinitxcode
    if alias apcreatedirstructxcode &>/dev/null; then
        apcreatedirstructxcode
    fi
}

alias aprmxcode="ap_func_rm_xcode"
ap_func_rm_xcode() {
    aplogshow "Remove [Xcode]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Xcode.app"
    fi

    if alias aprmdirstructxcode &>/dev/null; then
        aprmdirstructxcode
    fi

    if alias aprmglobalsymlinkxcode &>/dev/null; then
        aprmglobalsymlinkxcode
    fi
}
