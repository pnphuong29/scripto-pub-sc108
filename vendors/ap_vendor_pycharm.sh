alias apinitpycharm="ap_func_init_pycharm"
ap_func_init_pycharm() {
    export AP_XXX_SETUP_VERSION=''
    export AP_XXX_CONF_DIR="${HOME}/.config/pycharm"

    alias zpycharmconfig="cd /Applications/pycharm.app/Contents/MacOS"
    alias zpycharmconfig="cd \${HOME}/.pycharm"
    alias zpycharmconfig="cd \${HOME}/.config/pycharm"

    if alias apinitpycharmshare &>/dev/null; then
        apinitpycharmshare
    fi

    if alias apinitpycharmcommon &>/dev/null; then
        apinitpycharmcommon
    fi

    if alias apinitpycharmmain &>/dev/null; then
        apinitpycharmmain
    fi
}

alias apcreatedirstructpycharm="ap_func_create_dirstruct_pycharm"
ap_func_create_dirstruct_pycharm() {
    apshowmsginfo "Generate [pycharm] bash autocomplete\n"
    pycharm >"${AP_COMPLETIONS_DIR}/ap_completion_pycharm.bash"

    if [ -f "${HOME}/scripto-share/vendors/pycharm/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/pycharm/bindings.json] to [${HOME}/scripto-share/vendors/pycharm/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/pycharm/bindings.json" "${HOME}/.config/pycharm/bindings.json"
    fi

    if [ -f "${AP_SOFT_DIR}/pycharm/pycharm" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/pycharm] to [${AP_SOFT_DIR}/pycharm/bin/pycharm]\n"
        ln -sf "${AP_SOFT_DIR}/pycharm/bin/pycharm" "${AP_SOFT_DIR}/bin/pycharm"
    fi

    if [ -f "${AP_SOFT_DIR}/pycharm/pycharm" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_pycharm.bash] to [${AP_SOFT_DIR}/pycharm/complete/pycharm.bash]\n"
        ln -sf "${AP_SOFT_DIR}/pycharm/complete/pycharm.bash" "${AP_COMPLETIONS_DIR}/ap_completion_pycharm.bash"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/pycharm.1] to [${AP_SOFT_DIR}/pycharm/pycharm.1]\n"
    ln -sf "${AP_SOFT_DIR}/pycharm/pycharm.1" "${AP_MAN_DIR}/man1/pycharm.1"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/pycharm/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/pycharm"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.base.env" "${XDG_CONFIG_HOME}/pycharm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.key.mac.env" "${XDG_CONFIG_HOME}/pycharm/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.mac.env" "${XDG_CONFIG_HOME}/pycharm/config"
            else
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.pycharm"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.pycharm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.pycharm/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.pycharm/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/pycharm/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/pycharm"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.base.env" "${XDG_CONFIG_HOME}/pycharm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.key.linux.env" "${XDG_CONFIG_HOME}/pycharm/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.linux.env" "${XDG_CONFIG_HOME}/pycharm/config"
            else
                mkdir -p "${HOME}/.config/pycharm"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.base.env" "${HOME}/.config/pycharm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.key.linux.env" "${HOME}/.config/pycharm/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/pycharm/config.linux.env" "${HOME}/.config/pycharm/config"
            fi
        fi
    fi

    if alias apcreatedirstructpycharmshare &>/dev/null; then
        apcreatedirstructpycharmshare
    fi

    if alias apcreatedirstructpycharmcommon &>/dev/null; then
        apcreatedirstructpycharmcommon
    fi

    if alias apcreatedirstructpycharmmain &>/dev/null; then
        apcreatedirstructpycharmmain
    fi
}

alias aprmdirstructpycharm="ap_func_rm_dirstruct_pycharm"
ap_func_rm_dirstruct_pycharm() {
    apshowmsginfo "Remove [${HOME}/.config/pycharm/]\n"
    rm -rf "${HOME}/.config/pycharm/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/pycharm]\n"
    rm -f "${AP_SOFT_DIR}/bin/pycharm"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pycharm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pycharm.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/pycharm.1]\n"
    rm -f "${AP_MAN_DIR}/man1/pycharm.1"

    if alias aprmdirstructpycharmshare &>/dev/null; then
        aprmdirstructpycharmshare
    fi

    if alias aprmdirstructpycharmcommon &>/dev/null; then
        aprmdirstructpycharmcommon
    fi

    if alias aprmdirstructpycharmmain &>/dev/null; then
        aprmdirstructpycharmmain
    fi
}

alias apcreateglobalsymlinkpycharm="ap_func_create_global_symlink_pycharm"
ap_func_create_global_symlink_pycharm() {
    if [ -f "${AP_SOFT_DIR}/bin/pycharm" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/pycharm] to [${AP_SOFT_DIR}/bin/pycharm]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/pycharm" "/usr/local/bin/pycharm"
    fi
}

alias aprmglobalsymlinkpycharm="ap_func_rm_global_symlink_pycharm"
ap_func_rm_global_symlink_pycharm() {
    if [ -f "/usr/local/bin/pycharm" ]; then
        apshowmsginfo "Remove [/usr/local/bin/pycharm]\n"
        sudo rm -f "/usr/local/bin/pycharm"
    fi
}

alias apsetuppycharm="ap_func_setup_pycharm"
ap_func_setup_pycharm() {
    local ap_pycharm_setup_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_pycharm_setup_version="$1"
    fi

    apshowmsginfo "Install [pycharm] version [${ap_pycharm_setup_version}]\n"

    apshowmsginfo "Install [pycharm]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/pycharm"
    rm -rf "${AP_TMP_DIR}/pycharm"

    # Install pycharm
    mkdir -p "${AP_TMP_DIR}/pycharm"
    cd "${AP_TMP_DIR}/pycharm"

    apshowmsginfo "Download [pycharm] version [${ap_pycharm_setup_version}] from [https://ziglang.org/download/${ap_pycharm_setup_version}/zig-${ap_os}-${ap_pycharm_setup_version}.tar.xz]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install pycharm
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/pycharm/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >pycharm.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/pycharm/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >pycharm.tar.gz
        fi

        rm -rf "/Applications/pycharm"

        unzip pycharm.zip
        mv pycharm* pycharm
        mv "pycharm/pycharm.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse pycharm.dmg
        cp -R "/Volumes/pycharm/pycharm.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/pycharm"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/pycharm/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >pycharm.tar.gz
        https://download-cdn.jetbrains.com/python/pycharm-community-2024.3.4.tar.gz
        sudo dpkg -i pycharm.deb
        sudo snap install -y pycharm
        sudo apt install -y pycharm
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/pycharm/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >pycharm.tar.gz

    tar -zxf pycharm.tar.gz
    rm -f pycharm.tar.gz

    mv pycharm* pycharm
    mv pycharm "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/pycharm"
    # rm -rf "${AP_TMP_DIR}/pycharm"

    ./configure
    make
    sudo make install

    cargo install pycharm
    pip install pycharm
    npm install -g pycharm

    apinitpycharm
    apcreateglobalsymlinkpycharm

    if alias apcreatedirstructpycharm &>/dev/null; then
        apcreatedirstructpycharm
    fi
}

alias aprmpycharm="ap_func_rm_pycharm"
ap_func_rm_pycharm() {
    local ap_pycharm_remove_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_pycharm_remove_version="$1"
    fi

    apshowmsginfo "Remove [pycharm] v${ap_pycharm_remove_version}\n"

    apshowmsginfo "Remove [pycharm]\n"
    cargo uninstall pycharm
    pip uninstall pycharm
    npm uninstall -g pycharm

    rm -rf "${GOPATH}/pkg/mod/github.com/pycharm/pycharm@"*
    rm -f "${GOPATH}/bin/pycharm"

    rm -rf "${AP_SOFT_DIR}/pycharm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/pycharm"
        brew remove --cask pycharm
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y pycharm
        sudo snap remove --purge pycharm
        sudo dpkg --purge pycharm
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructpycharm &>/dev/null; then
        aprmdirstructpycharm
    fi

    if alias aprmglobalsymlinkpycharm &>/dev/null; then
        aprmglobalsymlinkpycharm
    fi
}
