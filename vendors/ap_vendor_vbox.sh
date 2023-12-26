alias @initvbox="ap_func_init_vbox"
ap_func_init_vbox() {
    alias dlvboxguestadditions="cd \${AP_SOFT_DIR}/vbox; curl -SOL http://download.virtualbox.org/virtualbox/7.0.12/VBoxGuestAdditions_7.0.12.iso"
    alias dlvboxextpack="cd \${AP_SOFT_DIR}/vbox; curl -SOL http://download.virtualbox.org/virtualbox/7.0.12/Oracle_VM_VirtualBox_Extension_Pack-7.0.12-159484.vbox-extpack"

    if alias @initvboxcommon &>/dev/null; then
        @initvboxcommon
    fi
}

alias @createdirstructvbox="ap_func_create_dirstruct_vbox"
ap_func_create_dirstruct_vbox() {
    # https://github.com/gryf/vboxmanage-bash-completion
    @logshow "Generate [vbox] bash autocomplete\n"
    curl -L https://raw.githubusercontent.com/gryf/vboxmanage-bash-completion/master/VBoxManage -o "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
    if ! grep "complete -o default -F _VBoxManage vbm" "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash" &>/dev/null; then
        echo >>"${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
        echo "complete -o default -F _VBoxManage vbm # vbm is an alias of VBoxManage" >>"${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
    fi

    if alias @createdirstructvboxcommon &>/dev/null; then
        @createdirstructvboxcommon
    fi
}

alias @rmdirstructvbox="ap_func_remove_dirstruct_vbox"
ap_func_remove_dirstruct_vbox() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"

    if alias @rmdirstructvboxcommon &>/dev/null; then
        @rmdirstructvboxcommon
    fi
}

alias @setupvbox="ap_func_setup_vbox"
ap_func_setup_vbox() {
    # https://www.virtualbox.org/wiki/Downloads
    # http://download.virtualbox.org/virtualbox/7.0.12/
    @logshow "Install [VirtualBox]\n"

    rm -rf "${AP_TMP_DIR}/vbox"
    mkdir -p "${AP_TMP_DIR}/vbox"
    cd "${AP_TMP_DIR}/vbox"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Use brew to install VirtualBox
        # brew install virtualbox virtualbox-extension-pack
        curl -SL https://download.virtualbox.org/virtualbox/7.0.12/VirtualBox-7.0.12-159484-OSX.dmg -o virtualbox.dmg
        hdiutil attach -nobrowse virtualbox.dmg
        cd "/Volumes/VirtualBox"
        sudo installer -pkg VirtualBox.pkg -target "/Applications"
        cd "/Applications"
        hdiutil detach "/Volumes/VirtualBox"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Use apt to install VirtualBox, usually results in old version
        # sudo apt update
        # sudo apt install -y virtualbox
        curl -SL https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484~Ubuntu~jammy_amd64.deb -o virtualbox.deb
        sudo dpkg -i virtualbox.deb
    fi

    @minfo "VirtualBox GuestAdditions iso file will be downloaded for later use at [${AP_SOFT_DIR}/vbox/VBoxGuestAdditions_7.0.12.iso]\n"
    mkdir -p "${AP_SOFT_DIR}/vbox"
    cd "${AP_SOFT_DIR}/vbox"
    curl -SOL "http://download.virtualbox.org/virtualbox/7.0.12/VBoxGuestAdditions_7.0.12.iso"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        @logshow "Install [VirtualBox GuestAdditions]\n"
        # Install kernel-headers and essential libraries to build guest additions
        sudo apt update
        sudo apt install -y "linux-headers-$(uname -r)" build-essential

        # Install Guest Additions
        sudo mkdir -p "/media/guestadditions"
        cd "${AP_SOFT_DIR}/vbox"
        mount -o loop,ro "VBoxGuestAdditions_7.0.12.iso" "/media/guestadditions"
        cd "/media/guestadditions"
        ./VBoxLinuxAdditions.run --nox11

        # Cleanup procedures
        umount "/media/guestadditions"
        rm -rf "/media/guestadditions"

        # You should reboot your machine after installing vbox guestaddition
        @minfo "Please restart your machine to apply changes\n"
        # reboot
    fi

    # You should open VirtualBox to install this extension pack
    @minfo "You should open VirtualBox to install the extension pack at [${AP_SOFT_DIR}/vbox/Oracle_VM_VirtualBox_Extension_Pack-7.0.12-159484.vbox-extpack]\n"
    cd "${AP_SOFT_DIR}/vbox"
    curl -SOL http://download.virtualbox.org/virtualbox/7.0.12/Oracle_VM_VirtualBox_Extension_Pack-7.0.12-159484.vbox-extpack

    if alias @createdirstructvbox &>/dev/null; then
        @createdirstructvbox
    fi
}

alias @rmvbox="ap_func_remove_vbox"
ap_func_remove_vbox() {
    @logshow "Remove [VirtualBox]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        sudo rm -rf "/Applications/VirtualBox.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --prune virtualbox
    fi

    if alias @rmdirstructvbox &>/dev/null; then
        @rmdirstructvbox
    fi
}
