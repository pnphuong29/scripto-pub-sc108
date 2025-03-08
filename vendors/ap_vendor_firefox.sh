alias apinitfirefox="ap_func_init_firefox"
ap_func_init_firefox() {
    if alias apinitfirefoxshare &>/dev/null; then
        apinitfirefoxshare
    fi

    if alias apinitfirefoxcommon &>/dev/null; then
        apinitfirefoxcommon
    fi

    if alias apinitfirefoxmain &>/dev/null; then
        apinitfirefoxmain
    fi
}

alias apcreatedirstructfirefox="ap_func_create_dirstruct_firefox"
ap_func_create_dirstruct_firefox() {
    if alias apcreatedirstructfirefoxshare &>/dev/null; then
        apcreatedirstructfirefoxshare
    fi

    if alias apcreatedirstructfirefoxcommon &>/dev/null; then
        apcreatedirstructfirefoxcommon
    fi

    if alias apcreatedirstructfirefoxmain &>/dev/null; then
        apcreatedirstructfirefoxmain
    fi
}

alias aprmdirstructfirefox="ap_func_rm_dirstruct_firefox"
ap_func_rm_dirstruct_firefox() {
    if alias aprmdirstructfirefoxshare &>/dev/null; then
        aprmdirstructfirefoxshare
    fi

    if alias aprmdirstructfirefoxcommon &>/dev/null; then
        aprmdirstructfirefoxcommon
    fi

    if alias aprmdirstructfirefoxmain &>/dev/null; then
        aprmdirstructfirefoxmain
    fi
}

alias apsetupfirefox="ap_func_setup_firefox"
ap_func_setup_firefox() {
    apshowmsginfo "Install [firefox]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask firefox
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo install -d -m 0755 /etc/apt/keyrings
        wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc >/dev/null
        echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list >/dev/null
        echo '
            Package: *
            Pin: origin packages.mozilla.org
            Pin-Priority: 1000
        ' | sudo tee /etc/apt/preferences.d/mozilla
        sudo apt-get update && sudo apt-get install firefox
    fi

    apinitfirefox

    if alias apcreatedirstructfirefox &>/dev/null; then
        apcreatedirstructfirefox
    fi
}

alias aprmfirefox="ap_func_rm_firefox"
ap_func_rm_firefox() {
    apshowmsginfo "Remove [firefox]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask firefox
        rm -rf "/Applications/Firefox.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y firefox
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructfirefox &>/dev/null; then
        aprmdirstructfirefox
    fi

    if alias aprmglobalsymlinkfirefox &>/dev/null; then
        aprmglobalsymlinkfirefox
    fi
}
