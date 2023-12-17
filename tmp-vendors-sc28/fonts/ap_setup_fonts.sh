# https://github.com/sebastiencs/icons-in-terminal
export AP_VENDORS_FONT_ICONS_IN_TERMINAL_GH_DIR="${AP_GH_DIR}/sebastiencs/icons-in-terminal"
export AP_VENDORS_FONT_ICONS_IN_TERMINAL_DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/icons-in-terminal/"

if [[ ! -d "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_GH_DIR}" || ! -d "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_DATA_DIR}" ]]; then
    @logshow "Installing [icons-in-terminal]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y fontconfig
    fi

    ghq get https://github.com/sebastiencs/icons-in-terminal.git
    cd "${AP_GH_DIR}/sebastiencs/icons-in-terminal"
    ./install.sh

    if [[ -d "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_GH_DIR}" && -d "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_DATA_DIR}" ]]; then
        @logshowpassed "[icons-in-terminal] has been installed successfully\n"
    else
        @logshowfailed "[icons-in-terminal] has been installed unsuccessfully\n"
    fi
fi

# Firacode
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Installing [font-fira-code] using [brew]\n"
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Installing [font-fira-code] using [apt]\n"
    sudo apt update
    sudo apt install -y fonts-firacode
fi
