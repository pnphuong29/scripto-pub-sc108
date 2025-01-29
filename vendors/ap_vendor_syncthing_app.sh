alias apinitsyncthingapp="ap_func_init_syncthingapp"
ap_func_init_syncthingapp() {
    alias zsyncthingapp="cd /Applications/Syncthing.app/Contents/MacOS"

    if alias apinitsyncthingappshare &>/dev/null; then
        apinitsyncthingappshare
    fi

    if alias apinitsyncthingappcommon &>/dev/null; then
        apinitsyncthingappcommon
    fi

    if alias apinitsyncthingappmain &>/dev/null; then
        apinitsyncthingappmain
    fi
}

alias apcreatedirstructsyncthingapp="ap_func_create_dirstruct_syncthingapp"
ap_func_create_dirstruct_syncthingapp() {
    if alias apcreatedirstructsyncthingappshare &>/dev/null; then
        apcreatedirstructsyncthingappshare
    fi

    if alias apcreatedirstructsyncthingappcommon &>/dev/null; then
        apcreatedirstructsyncthingappcommon
    fi

    if alias apcreatedirstructsyncthingappmain &>/dev/null; then
        apcreatedirstructsyncthingappmain
    fi
}

alias aprmdirstructsyncthingapp="ap_func_rm_dirstruct_syncthingapp"
ap_func_rm_dirstruct_syncthingapp() {
    if alias aprmdirstructsyncthingappshare &>/dev/null; then
        aprmdirstructsyncthingappshare
    fi

    if alias aprmdirstructsyncthingappcommon &>/dev/null; then
        aprmdirstructsyncthingappcommon
    fi

    if alias aprmdirstructsyncthingappmain &>/dev/null; then
        aprmdirstructsyncthingappmain
    fi
}

alias apsetupsyncthingapp="ap_func_setup_syncthingapp"
ap_func_setup_syncthingapp() {
    aplogshow "Install [syncthing gui app]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Install GUI app
        # https://github.com/syncthing/syncthing-macos/releases
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/syncthing/syncthing-macos/releases" | jq -r '.[0].assets[].browser_download_url' | grep "dmg")" >syncthing.dmg

        hdiutil attach -nobrowse syncthing.dmg
        rm -rf "/Applications/Syncthing.app"
        cp -R "/Volumes/Syncthing/Syncthing.app" /Applications/
        hdiutil detach "/Volumes/syncthing"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # https://apt.syncthing.net/

        # Add the release PGP keys:
        sudo mkdir -p /etc/apt/keyrings
        sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg

        # Add the "stable" channel to your APT sources:
        echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

        # Increase preference of Syncthing's packages ("pinning")
        printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing.pref

        # Update package lists
        sudo apt-get update

        # Install required libraries
        sudo apt-get install -y apt-transport-https ca-certificate

        # Install syncthing
        sudo apt-get install -y syncthing
    fi

    apinitsyncthingapp
    if alias apcreatedirstructsyncthingapp &>/dev/null; then
        apcreatedirstructsyncthingapp
    fi
}

alias aprmsyncthingapp="ap_func_rm_syncthingapp"
ap_func_rm_syncthingapp() {
    aplogshow "Remove [syncthingapp]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Syncthing.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y syncthing
    fi

    if alias aprmdirstructsyncthingapp &>/dev/null; then
        aprmdirstructsyncthingapp
    fi

    if alias aprmglobalsymlinksyncthingapp &>/dev/null; then
        aprmglobalsymlinksyncthingapp
    fi
}
