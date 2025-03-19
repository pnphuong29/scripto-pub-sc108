alias apinitkitty="ap_func_init_kitty"
ap_func_init_kitty() {
    alias zkittyconfigs="cd \${HOME}/.config/kitty"
    alias zkittythemes="cd \${AP_SOFT_DIR}/kitty/kitty-themes/themes/"

    if alias apinitkittyshare &>/dev/null; then
        apinitkittyshare
    fi

    if alias apinitkittycommon &>/dev/null; then
        apinitkittycommon
    fi
}

alias apcreatedirstructkitty="ap_func_create_dirstruct_kitty"
ap_func_create_dirstruct_kitty() {
    # Install kitty themes
    aplogshow "Install [kitty-themes]\n"
    rm -rf "${AP_SOFT_DIR}/kitty/kitty-themes"
    git clone --depth 1 "https://github.com/dexpota/kitty-themes.git" "${AP_SOFT_DIR}/kitty/kitty-themes"
    # rm -rf "${AP_SOFT_DIR}/kitty"
    # mkdir -p "${AP_SOFT_DIR}/kitty"
    # cd "${AP_SOFT_DIR}/kitty"
    # git clone "https://github.com/dexpota/kitty-themes"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        ln -s /Applications/kitty.app/Contents/MacOS/kitty ~/.local/bin/
        ln -s /Applications/kitty.app/Contents/MacOS/kitten ~/.local/bin/
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
        # your system-wide PATH)
        ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/
        ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/
        # Place the kitty.desktop file somewhere it can be found by the OS
        cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
        # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
        cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
        # Update the paths to the kitty and its icon in the kitty.desktop file(s)
        gsed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
        gsed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    fi

    if alias apcreatedirstructkittyshare &>/dev/null; then
        apcreatedirstructkittyshare
    fi

    if alias apcreatedirstructkittycommon &>/dev/null; then
        apcreatedirstructkittycommon
    fi
}

alias aprmdirstructkitty="ap_func_rm_dirstruct_kitty"
ap_func_rm_dirstruct_kitty() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -f "${HOME}/.local/bin/kitty"
        rm -f "${HOME}/.local/bin/kitten"
        rm -f "${HOME}/.local/share/applications/kitty"*
    fi

    rm -rf "${AP_SOFT_DIR}/kitty/kitty-themes"

    if alias aprmdirstructkittyshare &>/dev/null; then
        aprmdirstructkittyshare
    fi

    if alias aprmdirstructkittycommon &>/dev/null; then
        aprmdirstructkittycommon
    fi
}

alias apsetupkitty="ap_func_setup_kitty"
ap_func_setup_kitty() {
    # https://sw.kovidgoyal.net/kitty/binary/
    # https://github.com/dexpota/kitty-themes
    aplogshow "Install [kitty]\n"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin installer=version-0.35.2 # for macOS intel chip
    apinitkitty
    if alias apcreatedirstructkitty &>/dev/null; then
        apcreatedirstructkitty
    fi
}

alias aprmkitty="ap_func_rm_kitty"
ap_func_rm_kitty() {
    aplogshow "Remove [kitty]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf /Applications/kitty.app
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${HOME}/.local/kitty.app"
    fi

    rm -rf "${HOME}/.config/kitty"

    if alias aprmdirstructkitty &>/dev/null; then
        aprmdirstructkitty
    fi

    if alias aprmglobalsymlinkkitty &>/dev/null; then
        aprmglobalsymlinkkitty
    fi
}
