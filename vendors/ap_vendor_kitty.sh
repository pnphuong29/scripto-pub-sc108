alias @createdirstructkitty="ap_func_create_dirstruct_kitty"
ap_func_create_dirstruct_kitty() {
    # Install kitty themes
    @logshow "Install [kitty-themes]\n"
    rm -rf "${AP_SOFT_DIR}/kitty/kitty-themes"
    git clone --depth 1 "https://github.com/dexpota/kitty-themes.git" "${AP_SOFT_DIR}/kitty/kitty-themes"
    # rm -rf "${AP_SOFT_DIR}/kitty"
    # mkdir -p "${AP_SOFT_DIR}/kitty"
    # cd "${AP_SOFT_DIR}/kitty"
    # git clone "https://github.com/dexpota/kitty-themes"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
        # your system-wide PATH)
        ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
        ln -s ~/.local/kitty.app/bin/kitten ~/.local/bin/
        # Place the kitty.desktop file somewhere it can be found by the OS
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
        # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
        cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
        # Update the paths to the kitty and its icon in the kitty.desktop file(s)
        sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
        sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    fi

    if alias @createdirstructkittycommon &>/dev/null; then
        @createdirstructkittycommon
    fi
}

alias @rmdirstructkitty="ap_func_remove_dirstruct_kitty"
ap_func_remove_dirstruct_kitty() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -f "${HOME}/.local/bin/kitty"
        rm -f "${HOME}/.local/bin/kitten"
        rm -f "${HOME}/.local/share/applications/kitty"*
    fi
    rm -rf "${AP_SOFT_DIR}/kitty/kitty-themes"

    if alias @rmdirstructkittycommon &>/dev/null; then
        @rmdirstructkittycommon
    fi
}

alias @setupkitty="ap_func_setup_kitty"
ap_func_setup_kitty() {
    # https://sw.kovidgoyal.net/kitty/binary/
    # https://github.com/dexpota/kitty-themes
    @logshow "Install [kitty]\n"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    if alias @createdirstructkitty &>/dev/null; then
        @createdirstructkitty
    fi
}

alias @rmkitty="ap_func_remove_kitty"
ap_func_remove_kitty() {
    @logshow "Remove [kitty]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf /Applications/kitty.app
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${HOME}/.local/kitty.app"
    fi

    rm -f "${HOME}/.config/kitty"

    if alias @rmdirstructkitty &>/dev/null; then
        @rmdirstructkitty
    fi
}
