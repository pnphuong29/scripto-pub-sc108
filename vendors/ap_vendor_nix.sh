alias apinitnix="ap_func_init_nix"
ap_func_init_nix() {
    alias nix='nix-shell'

    if alias apinitnixshare &>/dev/null; then
        apinitnixshare
    fi

    if alias apinitnixcommon &>/dev/null; then
        apinitnixcommon
    fi
}

alias apcreatedirstructnix="ap_func_create_dirstruct_nix"
ap_func_create_dirstruct_nix() {
    if alias apcreatedirstructnixshare &>/dev/null; then
        apcreatedirstructnixshare
    fi

    if alias apcreatedirstructnixcommon &>/dev/null; then
        apcreatedirstructnixcommon
    fi
}

alias aprmdirstructnix="ap_func_rm_dirstruct_nix"
ap_func_rm_dirstruct_nix() {
    if alias aprmdirstructnixshare &>/dev/null; then
        aprmdirstructnixshare
    fi

    if alias aprmdirstructnixcommon &>/dev/null; then
        aprmdirstructnixcommon
    fi
}

alias apsetupnix="ap_func_setup_nix"
ap_func_setup_nix() {
    # https://nixos.org/download/
    aplogshow "Install [nix]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        sh <(curl -L https://nixos.org/nix/install)
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sh <(curl -L https://nixos.org/nix/install) --daemon
    fi

    apinitnix
    if alias apcreatedirstructnix &>/dev/null; then
        apcreatedirstructnix
    fi
}

alias aprmnix="ap_func_rm_nix"
ap_func_rm_nix() {
    # https://nixos.org/manual/nix/stable/installation/uninstall
    aplogshow "Remove [nix]\n"

    apshowmsginfo "You should follow this guide [https://nixos.org/manual/nix/stable/installation/uninstall] to completely remove [nix]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # https://nixos.org/manual/nix/stable/installation/uninstall#macos
        sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
        sudo rm -f /Library/LaunchDaemons/org.nixos.nix-daemon.plist
        sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist
        sudo rm -f /Library/LaunchDaemons/org.nixos.darwin-store.plist
        sudo dscl . -delete /Groups/nixbld
        for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done
        sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels
        sudo diskutil apfs deleteVolume /nix
        diskutil list
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # https://nixos.org/manual/nix/stable/installation/uninstall#linux
        sudo systemctl stop nix-daemon.service
        sudo systemctl disable nix-daemon.socket nix-daemon.service
        sudo systemctl daemon-reload
        sudo rm -rf /etc/nix /etc/profile.d/nix.sh /etc/tmpfiles.d/nix-daemon.conf /nix ~root/.nix-channels ~root/.nix-defexpr ~root/.nix-profile

        # Remove nix users and groups
        for i in $(seq 1 32); do
            sudo userdel "nixbld${i}"
        done
        sudo groupdel nixbld
    fi

    if alias aprmdirstructnix &>/dev/null; then
        aprmdirstructnix
    fi

    if alias aprmglobalsymlinknix &>/dev/null; then
        aprmglobalsymlinknix
    fi
}
