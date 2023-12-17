alias @initvscode="ap_func_init_vscode"
ap_func_init_vscode() {
    if alias @initvscodecommon &>/dev/null; then
        @initvscodecommon
    fi
}

alias @createdirstructvscode="ap_func_create_dirstruct_vscode"
ap_func_create_dirstruct_vscode() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/code] to [/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code]\n"
    ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" "${AP_SOFT_DIR}/bin/code"
    if alias @createdirstructvscodecommon &>/dev/null; then
        @createdirstructvscodecommon
    fi
}

alias @rmdirstructvscode="ap_func_remove_dirstruct_vscode"
ap_func_remove_dirstruct_vscode() {
    rm -f "${AP_SOFT_DIR}/bin/code"
    if alias @rmdirstructvscodecommon &>/dev/null; then
        @rmdirstructvscodecommon
    fi
}

alias @setupvscode="ap_func_setup_vscode"
ap_func_setup_vscode() {
    # https://code.visualstudio.com/
    @logshow "Install [vscode]\n"

    rm -rf "${AP_TMP_DIR}/vscode"
    mkdir -p "${AP_TMP_DIR}/vscode"
    cd "${AP_TMP_DIR}/vscode"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL https://update.code.visualstudio.com/latest/darwin-universal/stable -o code.zip
        unzip code.zip
        rm -rf "/Applications/Visual Studio Code.app"
        mv "Visual Studio Code.app" /Applications/
        cd "/Applications/Visual Studio Code.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL https://update.code.visualstudio.com/latest/linux-deb-x64/stable -o code.deb
        sudo dpkg -i code.deb
    fi

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew install --cask visual-studio-code
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    # Use snap to install vscode
    # sudo snap install --classic code

    # Use apt to install vscode
    # sudo apt-get install wget gpg
    # wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
    # sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    # sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    # rm -f packages.microsoft.gpg

    # sudo apt install apt-transport-https
    # sudo apt update
    # sudo apt install code
    # fi

    if alias @createdirstructvscode &>/dev/null; then
        @createdirstructvscode
    fi
}

alias @rmvscode="ap_func_remove_vscode"
ap_func_remove_vscode() {
    @logshow "Remove [vscode]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Visual Studio Code.app"
        # brew uninstall --cask visual-studio-code
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --prune code
        # sudo snap remove --purge code
        # sudo apt purge --yes code
    fi

    if alias @rmdirstructvscode &>/dev/null; then
        @rmdirstructvscode
    fi
}
