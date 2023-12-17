# https://code.visualstudio.com/
export AP_VENDORS_VSCODE_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/vscode"
export AP_VENDORS_VSCODE_SETUP_CONFIGS_DIR="${AP_VENDORS_VSCODE_SETUP_DIR}/configs"

if ! type code &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Installing [vscode] using [brew]\n"
        brew install --cask visual-studio-code

        if brew list --versions | grep visual-studio-code &>/dev/null; then
            @logshowpassed "[vscode] has been installed successfully using [brew]\n"
        else
            @logshowfailed "[vscode] has been installed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Installing [vscode] using [snap]\n"
        sudo snap install --classic code

        # sudo apt-get install wget gpg
        # wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
        # sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        # sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        # rm -f packages.microsoft.gpg

        # sudo apt install apt-transport-https
        # sudo apt update
        # sudo apt install code

        if type code &>/dev/null; then
            @logshowpassed "[vscode] has been installed successfully using [snap]\n"
        else
            @logshowfailed "[vscode] has been installed unsuccessfully using [snap]\n"
        fi
    fi
fi
