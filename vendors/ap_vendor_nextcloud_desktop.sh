alias apinitnextclouddesktop="ap_func_init_nextclouddesktop"
ap_func_init_nextclouddesktop() {
    if alias apinitnextclouddesktopshare &>/dev/null; then
        apinitnextclouddesktopshare
    fi

    if alias apinitnextclouddesktopcommon &>/dev/null; then
        apinitnextclouddesktopcommon
    fi
}

alias apcreatedirstructnextclouddesktop="ap_func_create_dirstruct_nextclouddesktop"
ap_func_create_dirstruct_nextclouddesktop() {
    if alias apcreatedirstructnextclouddesktopshare &>/dev/null; then
        apcreatedirstructnextclouddesktopshare
    fi

    if alias apcreatedirstructnextclouddesktopcommon &>/dev/null; then
        apcreatedirstructnextclouddesktopcommon
    fi
}

alias aprmdirstructnextclouddesktop="ap_func_rm_dirstruct_nextclouddesktop"
ap_func_rm_dirstruct_nextclouddesktop() {
    if alias aprmdirstructnextclouddesktopshare &>/dev/null; then
        aprmdirstructnextclouddesktopshare
    fi

    if alias aprmdirstructnextclouddesktopcommon &>/dev/null; then
        aprmdirstructnextclouddesktopcommon
    fi
}

alias apsetupnextclouddesktop="ap_func_setup_nextclouddesktop"
ap_func_setup_nextclouddesktop() {
    # https://github.com/nextcloud/desktop
    # https://nextcloud.com/install/#install-clients
    # https://docs.nextcloud.com/desktop/latest/advancedusage.html#install-nextcloudcmd
    aplogshow "Install [Nextcloud Desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask nextcloud # This will also install `nextcloudcmd` command
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -n "${XDG_CURRENT_DESKTOP:-}" ]; then
            sudo apt install -y nextcloud-desktop

            # Install nextcloudcmd
            aplogshow "Install [nextcloud cmd]\n"
            sudo add-apt-repository -y ppa:nextcloud-devs/client
            sudo apt update
            sudo apt install -y nextcloud-client
        fi
    fi

    apinitnextclouddesktop
    if alias apcreatedirstructnextclouddesktop &>/dev/null; then
        apcreatedirstructnextclouddesktop
    fi
}

alias aprmnextclouddesktop="ap_func_rm_nextclouddesktop"
ap_func_rm_nextclouddesktop() {
    aplogshow "Remove [Nextcloud Desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall --cask nextcloud
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y nextcloud-desktop
        sudo add-apt-repository --yes --remove ppa:nextcloud-devs/client
        sudo apt purge -y nextcloud-client
        sudo apt autoremove -y
    fi

    if alias aprmdirstructnextclouddesktop &>/dev/null; then
        aprmdirstructnextclouddesktop
    fi
}
