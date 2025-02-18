alias apinitxxx="ap_func_init_xxx"
ap_func_init_xxx() {
    export AP_XXX_SETUP_VERSION=''
    export AP_XXX_CONF_DIR="${HOME}/.config/xxx"

    alias zxxxconfig="cd /Applications/xxx.app/Contents/MacOS"
    alias zxxxconfig="cd \${HOME}/.xxx"
    alias zxxxconfig="cd \${HOME}/.config/xxx"

    if alias apinitxxxshare &>/dev/null; then
        apinitxxxshare
    fi

    if alias apinitxxxcommon &>/dev/null; then
        apinitxxxcommon
    fi

    if alias apinitxxxmain &>/dev/null; then
        apinitxxxmain
    fi
}

alias apcreatedirstructxxx="ap_func_create_dirstruct_xxx"
ap_func_create_dirstruct_xxx() {
    apshowmsginfo "Generate [xxx] bash autocomplete\n"
    xxx >"${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    if [ -f "${HOME}/scripto-share/vendors/xxx/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/xxx/bindings.json] to [${HOME}/scripto-share/vendors/xxx/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/xxx/bindings.json" "${HOME}/.config/xxx/bindings.json"
    fi

    if [ -f "${AP_SOFT_DIR}/xxx/xxx" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/xxx] to [${AP_SOFT_DIR}/xxx/bin/xxx]\n"
        ln -sf "${AP_SOFT_DIR}/xxx/bin/xxx" "${AP_SOFT_DIR}/bin/xxx"
    fi

    if [ -f "${AP_SOFT_DIR}/xxx/xxx" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash] to [${AP_SOFT_DIR}/xxx/complete/xxx.bash]\n"
        ln -sf "${AP_SOFT_DIR}/xxx/complete/xxx.bash" "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/xxx.1] to [${AP_SOFT_DIR}/xxx/xxx.1]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/xxx.1" "${AP_MAN_DIR}/man1/xxx.1"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/xxx/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/xxx"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.base.env" "${XDG_CONFIG_HOME}/xxx/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.key.mac.env" "${XDG_CONFIG_HOME}/xxx/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.mac.env" "${XDG_CONFIG_HOME}/xxx/config"
            else
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.xxx"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.xxx/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.xxx/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.xxx/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/xxx/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/xxx"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.base.env" "${XDG_CONFIG_HOME}/xxx/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.key.linux.env" "${XDG_CONFIG_HOME}/xxx/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.linux.env" "${XDG_CONFIG_HOME}/xxx/config"
            else
                mkdir -p "${HOME}/.config/xxx"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.base.env" "${HOME}/.config/xxx/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.key.linux.env" "${HOME}/.config/xxx/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/xxx/config.linux.env" "${HOME}/.config/xxx/config"
            fi
        fi
    fi

    if alias apcreatedirstructxxxshare &>/dev/null; then
        apcreatedirstructxxxshare
    fi

    if alias apcreatedirstructxxxcommon &>/dev/null; then
        apcreatedirstructxxxcommon
    fi

    if alias apcreatedirstructxxxmain &>/dev/null; then
        apcreatedirstructxxxmain
    fi
}

alias aprmdirstructxxx="ap_func_rm_dirstruct_xxx"
ap_func_rm_dirstruct_xxx() {
    apshowmsginfo "Remove [${HOME}/.config/xxx/]\n"
    rm -rf "${HOME}/.config/xxx/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/xxx]\n"
    rm -f "${AP_SOFT_DIR}/bin/xxx"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/xxx.1]\n"
    rm -f "${AP_MAN_DIR}/man1/xxx.1"

    if alias aprmdirstructxxxshare &>/dev/null; then
        aprmdirstructxxxshare
    fi

    if alias aprmdirstructxxxcommon &>/dev/null; then
        aprmdirstructxxxcommon
    fi

    if alias aprmdirstructxxxmain &>/dev/null; then
        aprmdirstructxxxmain
    fi
}

alias apcreateglobalsymlinkxxx="ap_func_create_global_symlink_xxx"
ap_func_create_global_symlink_xxx() {
    if [ -f "${AP_SOFT_DIR}/bin/xxx" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/xxx] to [${AP_SOFT_DIR}/bin/xxx]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/xxx" "/usr/local/bin/xxx"
    fi
}

alias aprmglobalsymlinkxxx="ap_func_rm_global_symlink_xxx"
ap_func_rm_global_symlink_xxx() {
    if [ -f "/usr/local/bin/xxx" ]; then
        apshowmsginfo "Remove [/usr/local/bin/xxx]\n"
        sudo rm -f "/usr/local/bin/xxx"
    fi
}

alias apsetupxxx="ap_func_setup_xxx"
ap_func_setup_xxx() {
    local ap_xxx_setup_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_xxx_setup_version="$1"
    fi

    apshowmsginfo "Install [xxx] version [${ap_xxx_setup_version}]\n"

    apshowmsginfo "Install [xxx]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/xxx"
    rm -rf "${AP_TMP_DIR}/xxx"

    # Install xxx
    mkdir -p "${AP_TMP_DIR}/xxx"
    cd "${AP_TMP_DIR}/xxx"

    apshowmsginfo "Download [xxx] version [${ap_xxx_setup_version}] from [https://ziglang.org/download/${ap_xxx_setup_version}/zig-${ap_os}-${ap_xxx_setup_version}.tar.xz]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install xxx
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/xxx/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >xxx.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/xxx/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >xxx.tar.gz
        fi

        rm -rf "/Applications/xxx"

        unzip xxx.zip
        mv xxx* xxx
        mv "xxx/xxx.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse xxx.dmg
        cp -R "/Volumes/xxx/xxx.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/xxx"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/xxx/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >xxx.tar.gz
        sudo dpkg -i xxx.deb
        sudo snap install -y xxx
        sudo apt install -y xxx
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/xxx/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >xxx.tar.gz

    tar -zxf xxx.tar.gz
    rm -f xxx.tar.gz

    mv xxx* xxx
    mv xxx "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/xxx"
    # rm -rf "${AP_TMP_DIR}/xxx"

    ./configure
    make
    sudo make install

    cargo install xxx
    pip install xxx
    npm install -g xxx

    apinitxxx
    if alias apcreatedirstructxxx &>/dev/null; then
        apcreatedirstructxxx
    fi
}

alias aprmxxx="ap_func_rm_xxx"
ap_func_rm_xxx() {
    local ap_xxx_remove_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_xxx_remove_version="$1"
    fi

    apshowmsginfo "Remove [xxx] v${ap_xxx_remove_version}\n"

    apshowmsginfo "Remove [xxx]\n"
    cargo uninstall xxx
    pip uninstall xxx
    npm uninstall -g xxx

    rm -rf "${GOPATH}/pkg/mod/github.com/xxx/xxx@"*
    rm -f "${GOPATH}/bin/xxx"

    rm -rf "${AP_SOFT_DIR}/xxx"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/xxx"
        brew remove --cask xxx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y xxx
        sudo snap remove --purge xxx
        sudo dpkg --purge xxx
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructxxx &>/dev/null; then
        aprmdirstructxxx
    fi

    if alias aprmglobalsymlinkxxx &>/dev/null; then
        aprmglobalsymlinkxxx
    fi
}
