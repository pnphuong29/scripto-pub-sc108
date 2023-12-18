alias @initnextclouddesktop="ap_func_init_nextclouddesktop"
ap_func_init_nextclouddesktop() {
    if alias @initnextclouddesktopcommon &>/dev/null; then
        @initnextclouddesktopcommon
    fi
}

alias @createdirstructnextclouddesktop="ap_func_create_dirstruct_nextclouddesktop"
ap_func_create_dirstruct_nextclouddesktop() {
    if alias @createdirstructnextclouddesktopcommon &>/dev/null; then
        @createdirstructnextclouddesktopcommon
    fi
}

alias @rmdirstructnextclouddesktop="ap_func_remove_dirstruct_nextclouddesktop"
ap_func_remove_dirstruct_nextclouddesktop() {
    if alias @rmdirstructnextclouddesktopcommon &>/dev/null; then
        @rmdirstructnextclouddesktopcommon
    fi
}

alias @setupnextclouddesktop="ap_func_setup_nextclouddesktop"
ap_func_setup_nextclouddesktop() {
    # https://github.com/nextcloud/desktop
    # https://nextcloud.com/install/#install-clients
    # https://docs.nextcloud.com/desktop/latest/advancedusage.html#install-nextcloudcmd
    @logshow "Install [nextcloud desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if ! brew list --cask --versions | grep nextcloud &>/dev/null; then
            brew install --cask nextcloud # This will also install `nextcloudcmd` command
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -n "${XDG_CURRENT_DESKTOP:-}" ]; then
            sudo apt install -y nextcloud-desktop

            # Install nextcloudcmd
            @logshow "Install [nextcloud cmd]\n"
            sudo add-apt-repository -y ppa:nextcloud-devs/client
            sudo apt update
            sudo apt install -y nextcloud-client
        fi
    fi

    if alias @createdirstructnextclouddesktop &>/dev/null; then
        @createdirstructnextclouddesktop
    fi
}

alias @rmnextclouddesktop="ap_func_remove_nextclouddesktop"
ap_func_remove_nextclouddesktop() {
    @logshow "Remove [nextcloud desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall --cask nextcloud
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y nextcloud-desktop

        sudo add-apt-repository --yes --remove ppa:nextcloud-devs/client
        sudo apt purge -y nextcloud-client

        sudo apt autoremove -y
    fi

    if alias @rmdirstructnextclouddesktop &>/dev/null; then
        @rmdirstructnextclouddesktop
    fi
}
