alias apinitinkscape="ap_func_init_inkscape"
ap_func_init_inkscape() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        alias zinkscapeconfigs="cd \"\${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape\""
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        alias zinkscapeconfigs="cd \${HOME}/.config/inkscape"

    fi

    if alias apinitinkscapeshare &>/dev/null; then
        apinitinkscapeshare
    fi

    if alias apinitinkscapecommon &>/dev/null; then
        apinitinkscapecommon
    fi

    if alias apinitinkscapemain &>/dev/null; then
        apinitinkscapemain
    fi
}

alias apcreatedirstructinkscape="ap_func_create_dirstruct_inkscape"
ap_func_create_dirstruct_inkscape() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        if [ -d "${HOME}/scripto-common/vendors/inkscape/macos" ]; then
            aplogshow "Backup current inkscape settings from [${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape] to [${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape.bak] \n"
            mv "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape" "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape.bak"

            aplogshow "Create symlink from [${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape] to [${HOME}/scripto-common/vendors/inkscape/macos]\n"
            ln -s "${HOME}/scripto-common/vendors/inkscape/macos" "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        if [ -d "${HOME}/scripto-common/vendors/inkscape/linux" ]; then
            aplogshow "Backup current inkscape settings from [${HOME}/.config/inkscape] to [${HOME}/.config/inkscape.bak] \n"
            mv "${HOME}/.config/inkscape" "${HOME}/.config/inkscape.bak"

            aplogshow "Create symlink from [${HOME}/.config/inkscape] to [${HOME}/scripto-common/vendors/inkscape/linux]\n"
            ln -s "${HOME}/scripto-common/vendors/inkscape/linux" "${HOME}/.config/inkscape"
        fi
    fi

    if alias apcreatedirstructinkscapeshare &>/dev/null; then
        apcreatedirstructinkscapeshare
    fi

    if alias apcreatedirstructinkscapecommon &>/dev/null; then
        apcreatedirstructinkscapecommon
    fi

    if alias apcreatedirstructinkscapemain &>/dev/null; then
        apcreatedirstructinkscapemain
    fi
}

alias aprmdirstructinkscape="ap_func_rm_dirstruct_inkscape"
ap_func_rm_dirstruct_inkscape() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        aplogshow "Remove inkscape settings at [${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape]\n"
        rm -rf "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape"

        if [ -d "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape.bak" ]; then
            aplogshow "Restore original inkscape settings from [${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape.bak]\n"
            mv "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape.bak" "${HOME}/Library/Application Support/org.inkscape.Inkscape/config/inkscape"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        aplogshow "Remove inkscape settings at [${HOME}/.config/inkscape]\n"
        rm -rf "${HOME}/.config/inkscape"

        if [ -d "${HOME}/.config/inkscape.bak" ]; then
            aplogshow "Restore original inkscape settings from [${HOME}/.config/inkscape.bak]\n"
            mv "${HOME}/.config/inkscape.bak" "${HOME}/.config/inkscape"
        fi
    fi

    if alias aprmdirstructinkscapeshare &>/dev/null; then
        aprmdirstructinkscapeshare
    fi

    if alias aprmdirstructinkscapecommon &>/dev/null; then
        aprmdirstructinkscapecommon
    fi

    if alias aprmdirstructinkscapemain &>/dev/null; then
        aprmdirstructinkscapemain
    fi
}

alias apsetupinkscape="ap_func_setup_inkscape"
ap_func_setup_inkscape() {
    aplogshow "Install [inkscape]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask inkscape
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo add-apt-repository -y ppa:inkscape.dev/stable
        sudo apt update
        sudo apt install -y inkscape
    fi

    apinitinkscape
    if alias apcreatedirstructinkscape &>/dev/null; then
        apcreatedirstructinkscape
    fi
}

alias aprminkscape="ap_func_rm_inkscape"
ap_func_rm_inkscape() {
    aplogshow "Remove [inkscape]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask inkscape
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y inkscape
        sudo add-apt-repository -y ppa:inkscape.dev/stable
        sudo apt update
    fi

    if alias aprmdirstructinkscape &>/dev/null; then
        aprmdirstructinkscape
    fi

    if alias aprmglobalsymlinkinkscape &>/dev/null; then
        aprmglobalsymlinkinkscape
    fi
}
