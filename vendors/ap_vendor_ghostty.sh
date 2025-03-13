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
            apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash] to [${HOME}/scripto-common/vendors/ghostty/share/macos/bash-completion/completions/ghostty.bash]\n"
            rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash" # Remove old completion if any
            ln -sf "${HOME}/scripto-common/vendors/ghostty/share/macos/bash-completion/completions/ghostty.bash" "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"
        fi

        apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/ghostty.1] to [${HOME}/scripto-common/vendors/ghostty/share/macos/man/man1/ghostty.1]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/macos/man/man1/ghostty.1" "${AP_MAN_DIR}/man1/ghostty.1"

        apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man5/ghostty.5] to [${HOME}/scripto-common/vendors/ghostty/share/macos/man/man5/ghostty.5]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/macos/man/man5/ghostty.5" "${AP_MAN_DIR}/man5/ghostty.5"

        # if use brew then ghostty bin is already located at /opt/homebrew/bin/ghostty
        # apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/ghostty] to [/Applications/Ghostty.app/Contents/MacOS/ghostty]\n"
        # ln -sf "/Applications/Ghostty.app/Contents/MacOS/ghostty" "${AP_SOFT_DIR}/bin/ghostty"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/ghostty/share/linux/bash-completion/completions/ghostty.bash" ]; then
            apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash] to [${HOME}/scripto-common/vendors/ghostty/share/linux/bash-completion/completions/ghostty.bash]\n"
            rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash" # Remove old completion if any
            ln -sf "${HOME}/scripto-common/vendors/ghostty/share/linux/bash-completion/completions/ghostty.bash" "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"
        fi

        if [ -f "${HOME}/scripto-common/vendors/ghostty/com.mitchellh.ghostty.desktop" ]; then
            cp -f "${HOME}/scripto-common/vendors/ghostty/com.mitchellh.ghostty.desktop" "${HOME}/.local/share/applications/com.mitchellh.ghostty.desktop"
        fi

        apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/ghostty.1] to [${HOME}/scripto-common/vendors/ghostty/share/linux/man/man1/ghostty.1]\n"
        ln -sf "${HOME}/scripto-common/vendors/ghostty/share/linux/man/man1/ghostty.1" "${AP_MAN_DIR}/man1/ghostty.1"

        apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man5/ghostty.5] to [${HOME}/scripto-common/vendors/ghostty/share/linux/man/man5/ghostty.5]\n"
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
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/ghostty]\n"
    rm -f "${AP_SOFT_DIR}/bin/ghostty"

    apshowmsginfo "Remove [${HOME}/.local/share/applications/com.mitchellh.ghostty.desktop]\n"
    rm -f "${HOME}/.local/share/applications/com.mitchellh.ghostty.desktop"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/ghostty.1]\n"
    rm -f "${AP_MAN_DIR}/man1/ghostty.1"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man5/ghostty.5]\n"
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
    # if [ -f "${AP_SOFT_DIR}/bin/ghostty" ]; then
    #     apshowmsginfo "Create symlink from [/usr/local/bin/ghostty] to [${AP_SOFT_DIR}/bin/ghostty]\n"
    #     sudo ln -sf "${AP_SOFT_DIR}/bin/ghostty" "/usr/local/bin/ghostty"
    # fi
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        if [ -f "/opt/homebrew/bin/ghostty" ]; then
            apshowmsginfo "Create symlink from [/usr/local/bin/ghostty] to [/opt/homebrew/bin/ghostty]\n"
            sudo ln -sf "/opt/homebrew/bin/ghostty" "/usr/local/bin/ghostty"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        if [ -f "${AP_SOFT_DIR}/bin/ghostty" ]; then
            apshowmsginfo "Create symlink from [/usr/local/bin/ghostty] to [${AP_SOFT_DIR}/bin/ghostty]\n"
            sudo ln -sf "${AP_SOFT_DIR}/bin/ghostty" "/usr/local/bin/ghostty"
        fi
    fi
}

alias aprmglobalsymlinkghostty="ap_func_rm_global_symlink_ghostty"
ap_func_rm_global_symlink_ghostty() {
    if [ -f "/usr/local/bin/ghostty" ]; then
        apshowmsginfo "Remove [/usr/local/bin/ghostty]\n"
        sudo rm -f "/usr/local/bin/ghostty"
    fi
}

alias apsetupghostty="ap_func_setup_ghostty"
ap_func_setup_ghostty() {
    apshowmsginfo "Install [ghostty]\n"

    # Check zig is installed
    if ! command -v zig &>/dev/null; then
        apshowmsginfo "zig is not installed\n"
    fi

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/ghostty"
    rm -rf "${AP_TMP_DIR}/ghostty"

    # Install ghostty
    mkdir -p "${AP_TMP_DIR}/ghostty"
    cd "${AP_TMP_DIR}/ghostty"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Still failed to build on macos
        # Update latest share files to common scripts ghostty vendor configs
        # if [ -d zig-out/share ]; then
        #     rm -rf "${HOME}/scripto-common/vendors/ghostty/share/macos"
        #     cp -R zig-out/share "${HOME}/scripto-common/vendors/ghostty/share/"
        #     mv "${HOME}/scripto-common/vendors/ghostty/share/share" "${HOME}/scripto-common/vendors/ghostty/share/macos"
        # fi

        # cd macos && xcodebuild
        # mv build/ReleaseLocal/Ghostty.app /Applications/
        brew install --cask ghostty
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install required libraries
        sudo apt install libgtk-4-dev libadwaita-1-dev git

        # Download source code
        # Build source code may fail because using nightly version of ghostty
        # Should use latest tag instead of tig tag (nightly version)
        # git clone https://github.com/ghostty-org/ghostty
        curl -SL "$(curl --silent https://api.github.com/repos/ghostty-org/ghostty/tags | jq -r '.[0].tarball_url')" >ghostty.tar.gz
        tar -xzf ghostty.tar.gz
        mv ghostty-* ghostty
        cd ghostty
        zig build -Doptimize=ReleaseFast

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
    apshowmsginfo "Remove [ghostty]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # rm -rf "/Applications/Ghostty.app"
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
