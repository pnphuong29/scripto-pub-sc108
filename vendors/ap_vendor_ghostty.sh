alias apinitghostty="ap_func_init_ghostty"
ap_func_init_ghostty() {
    if alias apinitghosttyshare &>/dev/null; then
        apinitghosttyshare
    fi

    if alias apinitghosttycommon &>/dev/null; then
        apinitghosttycommon
    fi

    if alias apinitghosttymain &>/dev/null; then
        apinitghosttymain
    fi
}

alias apcreatedirstructghostty="ap_func_create_dirstruct_ghostty"
ap_func_create_dirstruct_ghostty() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/ghostty/share/macos/bash-completion/completions/ghostty.bash" ]; then
            aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash] to [${HOME}/scripto-common/vendors/ghostty/share/macos/bash-completion/completions/ghostty.bash]\n"
            rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash" # Remove old completion if any
            ln -sf "${HOME}/scripto-common/vendors/ghostty/share/macos/bash-completion/completions/ghostty.bash" "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"
        fi

        aplogshow "Create symlink from [${AP_MAN_DIR}/man1/ghostty.1] to [${HOME}/scripto-common/vendors/ghostty/share/macos/man/man1/ghostty.1]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/macos/man/man1/ghostty.1" "${AP_MAN_DIR}/man1/ghostty.1"

        aplogshow "Create symlink from [${AP_MAN_DIR}/man5/ghostty.5] to [${HOME}/scripto-common/vendors/ghostty/share/macos/man/man5/ghostty.5]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/macos/man/man5/ghostty.5" "${AP_MAN_DIR}/man5/ghostty.5"

        aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/ghostty] to [/Applications/Ghostty.app/Contents/MacOS/ghostty]\n"
        ln -sf "/Applications/Ghostty.app/Contents/MacOS/ghostty" "${AP_SOFT_DIR}/bin/ghostty"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/ghostty/share/linux/bash-completion/completions/ghostty.bash" ]; then
            aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash] to [${HOME}/scripto-common/vendors/ghostty/share/linux/bash-completion/completions/ghostty.bash]\n"
            rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash" # Remove old completion if any
            ln -sf "${HOME}/scripto-common/vendors/ghostty/share/linux/bash-completion/completions/ghostty.bash" "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"
        fi

        if [ -f "${HOME}/scripto-common/vendors/ghostty/com.mitchellh.ghostty.desktop" ]; then
            cp -f "${HOME}/scripto-common/vendors/ghostty/com.mitchellh.ghostty.desktop" "${HOME}/.local/share/applications/com.mitchellh.ghostty.desktop"
        fi

        aplogshow "Create symlink from [${AP_MAN_DIR}/man1/ghostty.1] to [${HOME}/scripto-common/vendors/ghostty/share/linux/man/man1/ghostty.1]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/linux/man/man1/ghostty.1" "${AP_MAN_DIR}/man1/ghostty.1"

        aplogshow "Create symlink from [${AP_MAN_DIR}/man5/ghostty.5] to [${HOME}/scripto-common/vendors/ghostty/share/linux/man/man5/ghostty.5]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/linux/man/man5/ghostty.5" "${AP_MAN_DIR}/man5/ghostty.5"
    fi

    if alias apcreatedirstructghosttyshare &>/dev/null; then
        apcreatedirstructghosttyshare
    fi

    if alias apcreatedirstructghosttycommon &>/dev/null; then
        apcreatedirstructghosttycommon
    fi

    if alias apcreatedirstructghosttymain &>/dev/null; then
        apcreatedirstructghosttymain
    fi
}

alias aprmdirstructghostty="ap_func_rm_dirstruct_ghostty"
ap_func_rm_dirstruct_ghostty() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/ghostty]\n"
    rm -f "${AP_SOFT_DIR}/bin/ghostty"

    aplogshow "Remove [${HOME}/.local/share/applications/com.mitchellh.ghostty.desktop]\n"
    rm -f "${HOME}/.local/share/applications/com.mitchellh.ghostty.desktop"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/ghostty.1]\n"
    rm -f "${AP_MAN_DIR}/man1/ghostty.1"

    aplogshow "Remove [${AP_MAN_DIR}/man5/ghostty.5]\n"
    rm -f "${AP_MAN_DIR}/man5/ghostty.5"

    if alias aprmdirstructghosttyshare &>/dev/null; then
        aprmdirstructghosttyshare
    fi

    if alias aprmdirstructghosttycommon &>/dev/null; then
        aprmdirstructghosttycommon
    fi

    if alias aprmdirstructghosttymain &>/dev/null; then
        aprmdirstructghosttymain
    fi
}

alias apcreateglobalsymlinkghostty="ap_func_create_global_symlink_ghostty"
ap_func_create_global_symlink_ghostty() {
    if [ -f "${AP_SOFT_DIR}/bin/ghostty" ]; then
        aplogshow "Create symlink from [/usr/local/bin/ghostty] to [${AP_SOFT_DIR}/bin/ghostty]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/ghostty" "/usr/local/bin/ghostty"
    fi
}

alias aprmglobalsymlinkghostty="ap_func_rm_global_symlink_ghostty"
ap_func_rm_global_symlink_ghostty() {
    if [ -f "/usr/local/bin/ghostty" ]; then
        aplogshow "Remove [/usr/local/bin/ghostty]\n"
        sudo rm -f "/usr/local/bin/ghostty"
    fi
}

alias apsetupghostty="ap_func_setup_ghostty"
ap_func_setup_ghostty() {
    aplogshow "Install [ghostty]\n"

    # Check zig is installed
    if ! command -v zig &>/dev/null; then
        aplogshow "zig is not installed\n"
    fi

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ghostty"
    rm -rf "${AP_TMP_DIR}/ghostty"

    # Install ghostty
    mkdir -p "${AP_TMP_DIR}/ghostty"
    cd "${AP_TMP_DIR}/ghostty"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install required libraries
        sudo apt install libgtk-4-dev libadwaita-1-dev git
    fi

    git clone https://github.com/ghostty-org/ghostty
    cd ghostty
    zig build -Doptimize=ReleaseFast

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Update latest share files to common scripts ghostty vendor configs
        if [ -d zig-out/share ]; then
            rm -rf "${HOME}/scripto-common/vendors/ghostty/share/macos"
            cp -R zig-out/share "${HOME}/scripto-common/vendors/ghostty/share/"
            mv "${HOME}/scripto-common/vendors/ghostty/share/share" "${HOME}/scripto-common/vendors/ghostty/share/macos"
        fi

        cd macos && xcodebuild
        mv build/ReleaseLocal/Ghostty.app /Applications/
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Update latest share files to common scripts ghostty vendor configs
        if [ -d zig-out/share ]; then
            rm -rf "${HOME}/scripto-common/vendors/ghostty/share/linux"
            cp -R zig-out/share "${HOME}/scripto-common/vendors/ghostty/share/"
            mv "${HOME}/scripto-common/vendors/ghostty/share/share" "${HOME}/scripto-common/vendors/ghostty/share/linux"
        fi

        mv zig-out/bin/ghostty "${AP_SOFT_DIR}/bin/"
    fi

    cd "${AP_SOFT_DIR}/bin"

    apinitghostty
    apcreateglobalsymlinkghostty

    if alias apcreatedirstructghostty &>/dev/null; then
        apcreatedirstructghostty
    fi
}

alias aprmghostty="ap_func_rm_ghostty"
ap_func_rm_ghostty() {
    aplogshow "Remove [ghostty]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Ghostty.app"
        brew remove --cask ghostty
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/ghostty"
    fi

    if alias aprmdirstructghostty &>/dev/null; then
        aprmdirstructghostty
    fi

    if alias aprmglobalsymlinkghostty &>/dev/null; then
        aprmglobalsymlinkghostty
    fi
}
