alias apinitghostty="ap_func_init_ghostty"
ap_func_init_ghostty() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -d "${XDG_CONFIG_HOME}" ]; then
            alias zghosttyconfdir="cd \${XDG_CONFIG_HOME}/ghostty"
        else
            alias zghosttyconfdir="cd \"\${HOME}/Library/Application Support/com.mitchellh.ghostty\""
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -d "${XDG_CONFIG_HOME}" ]; then
            alias zghosttyconfdir="cd \${XDG_CONFIG_HOME}/ghostty"
        else
            alias zghosttyconfdir="cd \${HOME}/.config/ghostty"
        fi
    fi

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
        aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/ghostty] to [/Applications/Ghostty.app/Contents/MacOS/ghostty]\n"
        ln -sf "/Applications/Ghostty.app/Contents/MacOS/ghostty" "${AP_SOFT_DIR}/bin/ghostty"

        if [ -f "${HOME}/scripto-common/vendors/ghostty/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                # aplogshow "Create symlink from [${XDG_CONFIG_HOME}/ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.mac.env]\n"
                mkdir -p "${XDG_CONFIG_HOME}/ghostty"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.base.env" "${XDG_CONFIG_HOME}/ghostty/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.key.mac.env" "${XDG_CONFIG_HOME}/ghostty/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.mac.env" "${XDG_CONFIG_HOME}/ghostty/config"
            else
                # aplogshow "Create symlink from [${HOME}/Library/Application Support/com.mitchellh.ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.mac.env]\n"
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.ghostty"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.ghostty/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.ghostty/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.ghostty/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/ghostty/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                # aplogshow "Create symlink from [${XDG_CONFIG_HOME}/ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.linux.env]\n"
                mkdir -p "${XDG_CONFIG_HOME}/ghostty"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.base.env" "${XDG_CONFIG_HOME}/ghostty/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.key.linux.env" "${XDG_CONFIG_HOME}/ghostty/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.linux.env" "${XDG_CONFIG_HOME}/ghostty/config"
            else
                # aplogshow "Create symlink from [${HOME}/.config/ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.linux.env]\n"
                mkdir -p "${HOME}/.config/ghostty"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.base.env" "${HOME}/.config/ghostty/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.key.linux.env" "${HOME}/.config/ghostty/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.linux.env" "${HOME}/.config/ghostty/config"
            fi
        fi
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

    # Update latest share files to common scripts ghostty vendor configs
    if [ -d zig-out/share ]; then
        rm -rf "${HOME}/scripto-common/vendors/ghostty/share"
        cp -R zig-out/share "${HOME}/scripto-common/vendors/ghostty/"
    fi

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        cd macos && xcodebuild
        mv build/ReleaseLocal/Ghostty.app /Applications/
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        mv zig-out/bin/ghostty "${AP_SOFT_DIR}/bin/"
    fi

    cd "${AP_SOFT_DIR}/bin"

    apinitghostty
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
