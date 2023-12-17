# https://code.visualstudio.com/
export AP_VENDORS_VSCODE_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/vscode"
export AP_VENDORS_VSCODE_SETUP_CONFIGS_DIR="${AP_VENDORS_VSCODE_SETUP_DIR}/configs"

if type code &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Removing [vscode] using [brew]\n"
        brew uninstall --cask visual-studio-code

        if ! brew list --versions | grep visual-studio-code &>/dev/null; then
            @logshowpassed "[vscode] has been removed successfully using [brew]\n"
        else
            @logshowfailed "[vscode] has been removed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Removing [vscode] using [snap]\n"
        sudo snap remove --purge code
        # sudo apt purge --yes code

        if ! type code &>/dev/null; then
            @logshowpassed "[vscode] has been removed successfully using [snap]\n"
        else
            @logshowfailed "[vscode] has been removed unsuccessfully using [snap]\n"
        fi
    fi
fi
