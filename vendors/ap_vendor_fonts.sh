alias @setupfonts="ap_func_setup_fonts"
ap_func_setup_fonts() {
    @logshow "Install [icons-in-terminal] fonts\n"
    # https://github.com/sebastiencs/icons-in-terminal
    # local ap_vendors_font_icons_in_terminal_data_dir="${XDG_DATA_HOME:-${HOME}/.local/share}/icons-in-terminal/"

    @logshow "Installing [icons-in-terminal]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y fontconfig
    fi

    cd "${AP_SOFT_DIR}"
    git clone https://github.com/sebastiencs/icons-in-terminal.git
    cd "icons-in-terminal"
    ./install.sh

    # Firacode
    @logshow "Install [font-fira-code] fonts\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-fira-code
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y fonts-firacode
    fi
}

alias @rmfonts="ap_func_remove_fonts"
ap_func_remove_fonts() {
    @logshow "Remove [icons-in-terminal] fonts\n"
    if [ -d "${AP_SOFT_DIR}/icons-in-terminal" ]; then
        cd "${AP_SOFT_DIR}/icons-in-terminal"
        ./uninstall.sh
    fi
    rm -rf "${AP_SOFT_DIR}/icons-in-terminal"

    # Firacode
    @logshow "Remove [font-fira-code]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall --cask font-fira-code
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y fonts-firacode
        sudo apt autoremove -y
    fi
}
