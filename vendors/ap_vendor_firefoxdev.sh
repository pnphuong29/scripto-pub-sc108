alias apinitfirefoxdev="ap_func_init_firefoxdev"
ap_func_init_firefoxdev() {
    if alias apinitfirefoxdevshare &>/dev/null; then
        apinitfirefoxdevshare
    fi

    if alias apinitfirefoxdevcommon &>/dev/null; then
        apinitfirefoxdevcommon
    fi

    if alias apinitfirefoxdevmain &>/dev/null; then
        apinitfirefoxdevmain
    fi
}

alias apcreatedirstructfirefoxdev="ap_func_create_dirstruct_firefoxdev"
ap_func_create_dirstruct_firefoxdev() {
    if alias apcreatedirstructfirefoxdevshare &>/dev/null; then
        apcreatedirstructfirefoxdevshare
    fi

    if alias apcreatedirstructfirefoxdevcommon &>/dev/null; then
        apcreatedirstructfirefoxdevcommon
    fi

    if alias apcreatedirstructfirefoxdevmain &>/dev/null; then
        apcreatedirstructfirefoxdevmain
    fi
}

alias aprmdirstructfirefoxdev="ap_func_rm_dirstruct_firefoxdev"
ap_func_rm_dirstruct_firefoxdev() {
    if alias aprmdirstructfirefoxdevshare &>/dev/null; then
        aprmdirstructfirefoxdevshare
    fi

    if alias aprmdirstructfirefoxdevcommon &>/dev/null; then
        aprmdirstructfirefoxdevcommon
    fi

    if alias aprmdirstructfirefoxdevmain &>/dev/null; then
        aprmdirstructfirefoxdevmain
    fi
}

alias apsetupfirefoxdev="ap_func_setup_firefoxdev"
ap_func_setup_firefoxdev() {
    apshowmsginfo "Install [firefoxdev dev edition]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask firefox@developer-edition
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo install -d -m 0755 /etc/apt/keyrings
        wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null
        echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list >/dev/null
        echo '
            Package: *
            Pin: origin packages.mozilla.org
            Pin-Priority: 1000
        ' | sudo tee /etc/apt/preferences.d/mozilla
        sudo apt-get update && sudo apt-get install firefox-devedition
    fi

    apinitfirefoxdev

    if alias apcreatedirstructfirefoxdev &>/dev/null; then
        apcreatedirstructfirefoxdev
    fi
}

alias aprmfirefoxdev="ap_func_rm_firefoxdev"
ap_func_rm_firefoxdev() {
    apshowmsginfo "Remove [firefox dev edition]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask firefox@developer-edition
        rm -rf "/Applications/Firefox Developer Edition.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y firefox-devedition
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructfirefoxdev &>/dev/null; then
        aprmdirstructfirefoxdev
    fi

    if alias aprmglobalsymlinkfirefoxdev &>/dev/null; then
        aprmglobalsymlinkfirefoxdev
    fi
}
