alias @initfonts="ap_func_init_fonts"
ap_func_init_fonts() {
    if alias @initfontsshare &>/dev/null; then
        @initfontsshare
    fi

    if alias @initfontscommon &>/dev/null; then
        @initfontscommon
    fi
}

alias @createdirstructfonts="ap_func_create_dirstruct_fonts"
ap_func_create_dirstruct_fonts() {
    if alias @createdirstructfontsshare &>/dev/null; then
        @createdirstructfontsshare
    fi

    if alias @createdirstructfontscommon &>/dev/null; then
        @createdirstructfontscommon
    fi
}

alias @rmdirstructfonts="ap_func_rm_dirstruct_fonts"
ap_func_rm_dirstruct_fonts() {
    if alias @rmdirstructfontsshare &>/dev/null; then
        @rmdirstructfontsshare
    fi

    if alias @rmdirstructfontscommon &>/dev/null; then
        @rmdirstructfontscommon
    fi
}

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

alias @rmfonts="ap_func_rm_fonts"
ap_func_rm_fonts() {
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
