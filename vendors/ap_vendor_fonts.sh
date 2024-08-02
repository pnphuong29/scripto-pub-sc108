alias apinitfonts="ap_func_init_fonts"
ap_func_init_fonts() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        alias showfontconfig="cat /etc/fonts/fonts.conf"
        alias zfonts="cd \${HOME}/.fonts"
        alias rebuildfontinfo='sudo fc-cache -f -v'
    fi

    if alias apinitfontsshare &>/dev/null; then
        apinitfontsshare
    fi

    if alias apinitfontscommon &>/dev/null; then
        apinitfontscommon
    fi
}

alias apcreatedirstructfonts="ap_func_create_dirstruct_fonts"
ap_func_create_dirstruct_fonts() {
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" && -d "${AP_NC_DIR}/design/fonts" ]]; then
        aplogshow "Create symlink from [\${HOME}/.fonts] to [\${AP_NC_DIR}/design/fonts]\n"
        rm -rf "${HOME}/.fonts"
        ln -s "${AP_NC_DIR}/design/fonts" "${HOME}/.fonts"
    fi

    if alias apcreatedirstructfontsshare &>/dev/null; then
        apcreatedirstructfontsshare
    fi

    if alias apcreatedirstructfontscommon &>/dev/null; then
        apcreatedirstructfontscommon
    fi
}

alias aprmdirstructfonts="ap_func_rm_dirstruct_fonts"
ap_func_rm_dirstruct_fonts() {
    if alias aprmdirstructfontsshare &>/dev/null; then
        aprmdirstructfontsshare
    fi

    if alias aprmdirstructfontscommon &>/dev/null; then
        aprmdirstructfontscommon
    fi
}

alias apsetupfonts="ap_func_setup_fonts"
ap_func_setup_fonts() {
    aplogshow "Install [icons-in-terminal] fonts\n"
    # https://github.com/sebastiencs/icons-in-terminal
    # local ap_vendors_font_icons_in_terminal_data_dir="${XDG_DATA_HOME:-${HOME}/.local/share}/icons-in-terminal/"

    aplogshow "Installing [icons-in-terminal]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y fontconfig
    fi

    cd "${AP_SOFT_DIR}"
    git clone https://github.com/sebastiencs/icons-in-terminal.git
    cd "icons-in-terminal"
    ./install.sh

    # Firacode
    aplogshow "Install [font-fira-code] fonts\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-fira-code
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y fonts-firacode
    fi
}

alias aprmfonts="ap_func_rm_fonts"
ap_func_rm_fonts() {
    aplogshow "Remove [icons-in-terminal] fonts\n"
    if [ -d "${AP_SOFT_DIR}/icons-in-terminal" ]; then
        cd "${AP_SOFT_DIR}/icons-in-terminal"
        ./uninstall.sh
    fi
    rm -rf "${AP_SOFT_DIR}/icons-in-terminal"

    # Firacode
    aplogshow "Remove [font-fira-code]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall --cask font-fira-code
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y fonts-firacode
        sudo apt autoremove -y
    fi
}
