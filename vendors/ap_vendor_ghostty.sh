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
    if [ -f "${HOME}/scripto-common/vendors/ghostty/bindings.json" ]; then
        if [ -d "${XDG_CONFIG_HOME}" ]; then
            aplogshow "Create symlink from [${XDG_CONFIG_HOME}/ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.env]\n"
            mkdir -p "${XDG_CONFIG_HOME}/ghostty"
            ln -sf "${HOME}/scripto-common/vendors/ghostty/config.env" "${XDG_CONFIG_HOME}/ghostty/config"
        else
            if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
                aplogshow "Create symlink from [${HOME}/Library/Application Support/com.mitchellh.ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.env]\n"
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.ghostty"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.env" "${HOME}/Library/Application Support/com.mitchellh.ghostty/config"
            elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
                aplogshow "Create symlink from [${HOME}/.config/ghostty/config] to [${HOME}/scripto-common/vendors/ghostty/config.env]\n"
                mkdir -p "${HOME}/.config/ghostty"
                ln -sf "${HOME}/scripto-common/vendors/ghostty/config.env" "${HOME}/.config/ghostty/config"
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

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ghostty.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/ghostty.1]\n"
    rm -f "${AP_MAN_DIR}/man1/ghostty.1"

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

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask ghostty
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg -i ghostty_*.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/ghostty/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >ghostty.tar.gz

    tar -zxf ghostty.tar.gz
    rm -f ghostty.tar.gz
    mv ghostty* ghostty
    mv ghostty "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/ghostty"
    rm -rf "${AP_TMP_DIR}/ghostty"

    cargo install ghostty
    pip install ghostty
    npm install -g ghostty

    apinitghostty
    if alias apcreatedirstructghostty &>/dev/null; then
        apcreatedirstructghostty
    fi
}

alias aprmghostty="ap_func_rm_ghostty"
ap_func_rm_ghostty() {
    local ap_ghostty_remove_version=''
    if [ -n "$1" ]; then
        ap_ghostty_remove_version="$1"
    fi

    aplogshow "Remove [ghostty] v${ap_ghostty_remove_version}\n"

    aplogshow "Remove [ghostty]\n"
    cargo remove ghostty
    pip uninstall ghostty
    npm uninstall -g ghostty

    rm -rf "${GOPATH}/pkg/mod/github.com/ghostty/ghostty@"*
    rm -f "${GOPATH}/bin/ghostty"

    rm -rf "${AP_SOFT_DIR}/ghostty"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/ghostty"
        brew remove --cask ghostty
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y ghostty
        sudo snap remove --purge ghostty
        sudo dpkg --purge ghostty
    fi

    if alias aprmdirstructghostty &>/dev/null; then
        aprmdirstructghostty
    fi

    if alias aprmglobalsymlinkghostty &>/dev/null; then
        aprmglobalsymlinkghostty
    fi
}
