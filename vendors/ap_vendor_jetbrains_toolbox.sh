alias apinitjetbrainstoolbox="ap_func_init_jetbrainstoolbox"
ap_func_init_jetbrainstoolbox() {
    export AP_JB_TOOLBOX_SETUP_VERSION='2.5.4.38621'
    export AP_JB_TOOLBOX_CONF_DIR="${HOME}/.local/share/JetBrains/Toolbox"

    alias zjetbrainstoolboxconfig="cd /Applications/jetbrainstoolbox.app/Contents/MacOS"
    alias zjetbrainstoolboxconfig="cd \${HOME}/.jetbrainstoolbox"
    alias zjetbrainstoolboxconfig="cd \${HOME}/.config/jetbrainstoolbox"

    if alias apinitjetbrainstoolboxshare &>/dev/null; then
        apinitjetbrainstoolboxshare
    fi

    if alias apinitjetbrainstoolboxcommon &>/dev/null; then
        apinitjetbrainstoolboxcommon
    fi

    if alias apinitjetbrainstoolboxmain &>/dev/null; then
        apinitjetbrainstoolboxmain
    fi
}

alias apcreatedirstructjetbrainstoolbox="ap_func_create_dirstruct_jetbrainstoolbox"
ap_func_create_dirstruct_jetbrainstoolbox() {
    apshowmsginfo "Generate [jetbrainstoolbox] bash autocomplete\n"
    jetbrainstoolbox >"${AP_COMPLETIONS_DIR}/ap_completion_jetbrainstoolbox.bash"

    if [ -f "${HOME}/scripto-share/vendors/jetbrainstoolbox/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/jetbrainstoolbox/bindings.json] to [${HOME}/scripto-share/vendors/jetbrainstoolbox/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/jetbrainstoolbox/bindings.json" "${HOME}/.config/jetbrainstoolbox/bindings.json"
    fi

    if [ -f "${AP_SOFT_DIR}/jetbrainstoolbox/jetbrainstoolbox" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/jetbrainstoolbox] to [${AP_SOFT_DIR}/jetbrainstoolbox/bin/jetbrainstoolbox]\n"
        ln -sf "${AP_SOFT_DIR}/jetbrainstoolbox/bin/jetbrainstoolbox" "${AP_SOFT_DIR}/bin/jetbrainstoolbox"
    fi

    if [ -f "${AP_SOFT_DIR}/jetbrainstoolbox/jetbrainstoolbox" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_jetbrainstoolbox.bash] to [${AP_SOFT_DIR}/jetbrainstoolbox/complete/jetbrainstoolbox.bash]\n"
        ln -sf "${AP_SOFT_DIR}/jetbrainstoolbox/complete/jetbrainstoolbox.bash" "${AP_COMPLETIONS_DIR}/ap_completion_jetbrainstoolbox.bash"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/jetbrainstoolbox.1] to [${AP_SOFT_DIR}/jetbrainstoolbox/jetbrainstoolbox.1]\n"
    ln -sf "${AP_SOFT_DIR}/jetbrainstoolbox/jetbrainstoolbox.1" "${AP_MAN_DIR}/man1/jetbrainstoolbox.1"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/jetbrainstoolbox"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.base.env" "${XDG_CONFIG_HOME}/jetbrainstoolbox/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.key.mac.env" "${XDG_CONFIG_HOME}/jetbrainstoolbox/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.mac.env" "${XDG_CONFIG_HOME}/jetbrainstoolbox/config"
            else
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.jetbrainstoolbox"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.jetbrainstoolbox/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.jetbrainstoolbox/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.jetbrainstoolbox/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/jetbrainstoolbox"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.base.env" "${XDG_CONFIG_HOME}/jetbrainstoolbox/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.key.linux.env" "${XDG_CONFIG_HOME}/jetbrainstoolbox/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.linux.env" "${XDG_CONFIG_HOME}/jetbrainstoolbox/config"
            else
                mkdir -p "${HOME}/.config/jetbrainstoolbox"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.base.env" "${HOME}/.config/jetbrainstoolbox/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.key.linux.env" "${HOME}/.config/jetbrainstoolbox/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/jetbrainstoolbox/config.linux.env" "${HOME}/.config/jetbrainstoolbox/config"
            fi
        fi
    fi

    if alias apcreatedirstructjetbrainstoolboxshare &>/dev/null; then
        apcreatedirstructjetbrainstoolboxshare
    fi

    if alias apcreatedirstructjetbrainstoolboxcommon &>/dev/null; then
        apcreatedirstructjetbrainstoolboxcommon
    fi

    if alias apcreatedirstructjetbrainstoolboxmain &>/dev/null; then
        apcreatedirstructjetbrainstoolboxmain
    fi
}

alias aprmdirstructjetbrainstoolbox="ap_func_rm_dirstruct_jetbrainstoolbox"
ap_func_rm_dirstruct_jetbrainstoolbox() {
    apshowmsginfo "Remove [${HOME}/.config/jetbrainstoolbox/]\n"
    rm -rf "${HOME}/.config/jetbrainstoolbox/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/jetbrainstoolbox]\n"
    rm -f "${AP_SOFT_DIR}/bin/jetbrainstoolbox"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_jetbrainstoolbox.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_jetbrainstoolbox.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/jetbrainstoolbox.1]\n"
    rm -f "${AP_MAN_DIR}/man1/jetbrainstoolbox.1"

    if alias aprmdirstructjetbrainstoolboxshare &>/dev/null; then
        aprmdirstructjetbrainstoolboxshare
    fi

    if alias aprmdirstructjetbrainstoolboxcommon &>/dev/null; then
        aprmdirstructjetbrainstoolboxcommon
    fi

    if alias aprmdirstructjetbrainstoolboxmain &>/dev/null; then
        aprmdirstructjetbrainstoolboxmain
    fi
}

alias apcreateglobalsymlinkjetbrainstoolbox="ap_func_create_global_symlink_jetbrainstoolbox"
ap_func_create_global_symlink_jetbrainstoolbox() {
    if [ -f "${AP_SOFT_DIR}/bin/jetbrainstoolbox" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/jetbrainstoolbox] to [${AP_SOFT_DIR}/bin/jetbrainstoolbox]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/jetbrainstoolbox" "/usr/local/bin/jetbrainstoolbox"
    fi
}

alias aprmglobalsymlinkjetbrainstoolbox="ap_func_rm_global_symlink_jetbrainstoolbox"
ap_func_rm_global_symlink_jetbrainstoolbox() {
    if [ -f "/usr/local/bin/jetbrainstoolbox" ]; then
        apshowmsginfo "Remove [/usr/local/bin/jetbrainstoolbox]\n"
        sudo rm -f "/usr/local/bin/jetbrainstoolbox"
    fi
}

alias apsetupjetbrainstoolbox="ap_func_setup_jetbrainstoolbox"
ap_func_setup_jetbrainstoolbox() {
    local ap_jetbrainstoolbox_setup_version="${AP_JB_TOOLBOX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_jetbrainstoolbox_setup_version="$1"
    fi

    apshowmsginfo "Install [jetbrainstoolbox] version [${ap_jetbrainstoolbox_setup_version}]\n"

    apshowmsginfo "Install [jetbrainstoolbox]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/jetbrainstoolbox"
    rm -rf "${AP_TMP_DIR}/jetbrainstoolbox"

    # Install jetbrainstoolbox
    mkdir -p "${AP_TMP_DIR}/jetbrainstoolbox"
    cd "${AP_TMP_DIR}/jetbrainstoolbox"

    apshowmsginfo "Download [jetbrainstoolbox] version [${ap_jetbrainstoolbox_setup_version}] from [https://ziglang.org/download/${ap_jetbrainstoolbox_setup_version}/zig-${ap_os}-${ap_jetbrainstoolbox_setup_version}.tar.xz]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install jetbrainstoolbox
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/jetbrainstoolbox/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >jetbrainstoolbox.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/jetbrainstoolbox/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >jetbrainstoolbox.tar.gz
        fi

        rm -rf "/Applications/jetbrainstoolbox"

        unzip jetbrainstoolbox.zip
        mv jetbrainstoolbox* jetbrainstoolbox
        mv "jetbrainstoolbox/jetbrainstoolbox.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse jetbrainstoolbox.dmg
        cp -R "/Volumes/jetbrainstoolbox/jetbrainstoolbox.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/jetbrainstoolbox"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.5.4.38621.tar.gz
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/jetbrainstoolbox/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >jetbrainstoolbox.tar.gz
        sudo dpkg -i jetbrainstoolbox.deb
        sudo snap install -y jetbrainstoolbox
        sudo apt install -y jetbrainstoolbox
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/jetbrainstoolbox/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >jetbrainstoolbox.tar.gz

    tar -zxf jetbrainstoolbox.tar.gz
    rm -f jetbrainstoolbox.tar.gz

    mv jetbrainstoolbox* jetbrainstoolbox
    mv jetbrainstoolbox "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/jetbrainstoolbox"
    # rm -rf "${AP_TMP_DIR}/jetbrainstoolbox"

    ./configure
    make
    sudo make install

    cargo install jetbrainstoolbox
    pip install jetbrainstoolbox
    pnpm install -g jetbrainstoolbox

    apinitjetbrainstoolbox

    apcreateglobalsymlinkjetbrainstoolbox
    if alias apcreateglobalsymlinkjetbrainstoolbox &>/dev/null; then
        apcreatedirstructjetbrainstoolbox
    fi

    if alias apcreatedirstructjetbrainstoolbox &>/dev/null; then
        apcreatedirstructjetbrainstoolbox
    fi
}

alias aprmjetbrainstoolbox="ap_func_rm_jetbrainstoolbox"
ap_func_rm_jetbrainstoolbox() {
    local ap_jetbrainstoolbox_remove_version="${AP_JB_TOOLBOX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_jetbrainstoolbox_remove_version="$1"
    fi

    apshowmsginfo "Remove [jetbrainstoolbox] v${ap_jetbrainstoolbox_remove_version}\n"

    apshowmsginfo "Remove [jetbrainstoolbox]\n"
    cargo uninstall jetbrainstoolbox
    pip uninstall jetbrainstoolbox
    npm uninstall -g jetbrainstoolbox

    rm -rf "${GOPATH}/pkg/mod/github.com/jetbrainstoolbox/jetbrainstoolbox@"*
    rm -f "${GOPATH}/bin/jetbrainstoolbox"

    rm -rf "${AP_SOFT_DIR}/jetbrainstoolbox"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/jetbrainstoolbox"
        brew remove --cask jetbrainstoolbox
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y jetbrainstoolbox
        sudo snap remove --purge jetbrainstoolbox
        sudo dpkg --purge jetbrainstoolbox
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructjetbrainstoolbox &>/dev/null; then
        aprmdirstructjetbrainstoolbox
    fi

    if alias aprmglobalsymlinkjetbrainstoolbox &>/dev/null; then
        aprmglobalsymlinkjetbrainstoolbox
    fi
}
