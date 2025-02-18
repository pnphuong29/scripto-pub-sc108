alias apinitvscode="ap_func_init_vscode"
ap_func_init_vscode() {
    if alias apinitvscodeshare &>/dev/null; then
        apinitvscodeshare
    fi

    if alias apinitvscodecommon &>/dev/null; then
        apinitvscodecommon
    fi
}

alias apcreatedirstructvscode="ap_func_create_dirstruct_vscode"
ap_func_create_dirstruct_vscode() {
    if alias apcreatedirstructvscodeshare &>/dev/null; then
        apcreatedirstructvscodeshare
    fi

    if alias apcreatedirstructvscodecommon &>/dev/null; then
        apcreatedirstructvscodecommon
    fi
}

alias aprmdirstructvscode="ap_func_rm_dirstruct_vscode"
ap_func_rm_dirstruct_vscode() {
    if alias aprmdirstructvscodeshare &>/dev/null; then
        aprmdirstructvscodeshare
    fi

    if alias aprmdirstructvscodecommon &>/dev/null; then
        aprmdirstructvscodecommon
    fi
}

alias apsetupvscode="ap_func_setup_vscode"
ap_func_setup_vscode() {
    # https://code.visualstudio.com/
    aplogshow "Install [vscode]\n"

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

    apinitvscode
    if alias apcreatedirstructvscode &>/dev/null; then
        apcreatedirstructvscode
    fi
}

alias aprmvscode="ap_func_rm_vscode"
ap_func_rm_vscode() {
    aplogshow "Remove [vscode]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Visual Studio Code.app"
        # brew uninstall --cask visual-studio-code
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --prune code
        # sudo snap remove --purge code
        # sudo apt purge --yes code
    fi

    if alias aprmdirstructvscode &>/dev/null; then
        aprmdirstructvscode
    fi

    if alias aprmglobalsymlinkvscode &>/dev/null; then
        aprmglobalsymlinkvscode
    fi
}
