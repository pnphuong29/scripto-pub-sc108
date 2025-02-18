alias apinitvbox="ap_func_init_vbox"
ap_func_init_vbox() {
    export AP_VBOX_VERSION="7.1.6"
    alias dlvboxguestadditions="cd \${AP_SOFT_DIR}/vbox; curl -SOL http://download.virtualbox.org/virtualbox/\${AP_VBOX_VERSION}/VBoxGuestAdditions_\${AP_VBOX_VERSION}.iso"
    alias dlvboxextpack="cd \${AP_SOFT_DIR}/vbox; curl -SOL http://download.virtualbox.org/virtualbox/\${AP_VBOX_VERSION}/Oracle_VM_VirtualBox_Extension_Pack-\${AP_VBOX_VERSION}.vbox-extpack"

    if alias apinitvboxshare &>/dev/null; then
        apinitvboxshare
    fi

    if alias apinitvboxcommon &>/dev/null; then
        apinitvboxcommon
    fi
}

alias apcreatedirstructvbox="ap_func_create_dirstruct_vbox"
ap_func_create_dirstruct_vbox() {
    # https://github.com/gryf/vboxmanage-bash-completion
    aplogshow "Generate [vbox] bash autocomplete\n"
    curl -L https://raw.githubusercontent.com/gryf/vboxmanage-bash-completion/master/VBoxManage -o "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
    if ! grep "complete -o default -F _VBoxManage vbm" "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash" &>/dev/null; then
        echo >>"${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
        echo "complete -o default -F _VBoxManage vbm # vbm is an alias of VBoxManage" >>"${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
    fi

    if alias apcreatedirstructvboxshare &>/dev/null; then
        apcreatedirstructvboxshare
    fi

    if alias apcreatedirstructvboxcommon &>/dev/null; then
        apcreatedirstructvboxcommon
    fi
}

alias aprmdirstructvbox="ap_func_rm_dirstruct_vbox"
ap_func_rm_dirstruct_vbox() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"

    if alias aprmdirstructvboxshare &>/dev/null; then
        aprmdirstructvboxshare
    fi

    if alias aprmdirstructvboxcommon &>/dev/null; then
        aprmdirstructvboxcommon
    fi
}

alias apsetupvbox="ap_func_setup_vbox"
ap_func_setup_vbox() {
    # https://www.virtualbox.org/wiki/Downloads
    # https://www.virtualbox.org/wiki/Linux_Downloads
    aplogshow "Install [VirtualBox]\n"

    rm -rf "${AP_TMP_DIR}/vbox"
    mkdir -p "${AP_TMP_DIR}/vbox"
    cd "${AP_TMP_DIR}/vbox"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Use brew to install VirtualBox
        # brew install virtualbox virtualbox-extension-pack
        if [[ "$(uname -m)" == 'arm64' ]]; then
            # https://download.virtualbox.org/virtualbox/7.1.6/VirtualBox-7.1.6-167084-macOSArm64.dmg
            curl -SL "https://download.virtualbox.org/virtualbox/${AP_VBOX_VERSION}/VirtualBox-${AP_VBOX_VERSION}-167084-macOSArm64.dmg" -o virtualbox.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            # https://download.virtualbox.org/virtualbox/7.1.6/VirtualBox-7.1.6-167084-OSX.dmg
            curl -SL "https://download.virtualbox.org/virtualbox/${AP_VBOX_VERSION}/VirtualBox-${AP_VBOX_VERSION}-167084-OSX.dmg" -o virtualbox.dmg
        fi

        hdiutil attach -nobrowse virtualbox.dmg
        cd "/Volumes/VirtualBox"
        sudo installer -pkg VirtualBox.pkg -target "/Applications"
        cd "/Applications"
        hdiutil detach "/Volumes/VirtualBox"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Use apt to install VirtualBox, usually results in old version
        # sudo apt update
        # sudo apt install -y virtualbox
        # https://download.virtualbox.org/virtualbox/7.1.6/virtualbox-7.1_7.1.6-167084~Ubuntu~noble_amd64.deb # Ubuntu 24.04
        curl -SL "https://download.virtualbox.org/virtualbox/${AP_VBOX_VERSION}/virtualbox-7.1_${AP_VBOX_VERSION}-167084~Ubuntu~noble_amd64.deb" -o virtualbox.deb
        sudo dpkg -i virtualbox.deb
    fi

    apshowmsginfo "VirtualBox GuestAdditions iso file will be downloaded for later use at [${AP_SOFT_DIR}/vbox/VBoxGuestAdditions_${AP_VBOX_VERSION}.iso]\n"
    mkdir -p "${AP_SOFT_DIR}/vbox"
    cd "${AP_SOFT_DIR}/vbox"
    # https://download.virtualbox.org/virtualbox/7.1.4/VBoxGuestAdditions_7.1.4.iso
    curl -SOL "http://download.virtualbox.org/virtualbox/${AP_VBOX_VERSION}/VBoxGuestAdditions_${AP_VBOX_VERSION}.iso"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        aplogshow "Install [VirtualBox GuestAdditions]\n"
        # Install kernel-headers and essential libraries to build guest additions
        sudo apt update
        sudo apt install -y dkms "linux-headers-$(uname -r)" build-essential

        # Install Guest Additions
        sudo mkdir -p "/media/guestadditions"
        cd "${AP_SOFT_DIR}/vbox"
        mount -o loop,ro "VBoxGuestAdditions_${AP_VBOX_VERSION}.iso" "/media/guestadditions"
        cd "/media/guestadditions"
        ./VBoxLinuxAdditions.run --nox11

        # Cleanup procedures
        umount "/media/guestadditions"
        sudo rm -rf "/media/guestadditions"

        # You should reboot your machine after installing vbox guestaddition
        apshowmsginfo "Please restart your machine to apply changes\n"
        # reboot
    fi

    # You should open VirtualBox to install this extension pack
    apshowmsginfo "You should open VirtualBox to install the extension pack at [${AP_SOFT_DIR}/vbox/Oracle_VM_VirtualBox_Extension_Pack-${AP_VBOX_VERSION}.vbox-extpack]\n"
    cd "${AP_SOFT_DIR}/vbox"
    # https://download.virtualbox.org/virtualbox/7.1.4/Oracle_VirtualBox_Extension_Pack-7.1.4.vbox-extpack
    curl -SOL "http://download.virtualbox.org/virtualbox/${AP_VBOX_VERSION}/Oracle_VirtualBox_Extension_Pack-${AP_VBOX_VERSION}.vbox-extpack"

    apinitvbox
    if alias apcreatedirstructvbox &>/dev/null; then
        apcreatedirstructvbox
    fi
}

alias aprmvbox="ap_func_rm_vbox"
ap_func_rm_vbox() {
    aplogshow "Remove [VirtualBox]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        sudo rm -rf "/Applications/VirtualBox.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge virtualbox-7.0
    fi

    if alias aprmdirstructvbox &>/dev/null; then
        aprmdirstructvbox
    fi

    if alias aprmglobalsymlinkvbox &>/dev/null; then
        aprmglobalsymlinkvbox
    fi
}
