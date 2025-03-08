alias apinitwebstorm="ap_func_init_webstorm"
ap_func_init_webstorm() {
    export AP_XXX_SETUP_VERSION=''
    export AP_XXX_CONF_DIR="${HOME}/.config/webstorm"

    alias zwebstormconfig="cd /Applications/webstorm.app/Contents/MacOS"
    alias zwebstormconfig="cd \${HOME}/.webstorm"
    alias zwebstormconfig="cd \${HOME}/.config/webstorm"

    if alias apinitwebstormshare &>/dev/null; then
        apinitwebstormshare
    fi

    if alias apinitwebstormcommon &>/dev/null; then
        apinitwebstormcommon
    fi

    if alias apinitwebstormmain &>/dev/null; then
        apinitwebstormmain
    fi
}

alias apcreatedirstructwebstorm="ap_func_create_dirstruct_webstorm"
ap_func_create_dirstruct_webstorm() {
    apshowmsginfo "Generate [webstorm] bash autocomplete\n"
    webstorm >"${AP_COMPLETIONS_DIR}/ap_completion_webstorm.bash"

    if [ -f "${HOME}/scripto-share/vendors/webstorm/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/webstorm/bindings.json] to [${HOME}/scripto-share/vendors/webstorm/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/webstorm/bindings.json" "${HOME}/.config/webstorm/bindings.json"
    fi

    if [ -f "${AP_SOFT_DIR}/webstorm/webstorm" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/webstorm] to [${AP_SOFT_DIR}/webstorm/bin/webstorm]\n"
        ln -sf "${AP_SOFT_DIR}/webstorm/bin/webstorm" "${AP_SOFT_DIR}/bin/webstorm"
    fi

    if [ -f "${AP_SOFT_DIR}/webstorm/webstorm" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_webstorm.bash] to [${AP_SOFT_DIR}/webstorm/complete/webstorm.bash]\n"
        ln -sf "${AP_SOFT_DIR}/webstorm/complete/webstorm.bash" "${AP_COMPLETIONS_DIR}/ap_completion_webstorm.bash"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/webstorm.1] to [${AP_SOFT_DIR}/webstorm/webstorm.1]\n"
    ln -sf "${AP_SOFT_DIR}/webstorm/webstorm.1" "${AP_MAN_DIR}/man1/webstorm.1"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/webstorm/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/webstorm"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.base.env" "${XDG_CONFIG_HOME}/webstorm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.key.mac.env" "${XDG_CONFIG_HOME}/webstorm/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.mac.env" "${XDG_CONFIG_HOME}/webstorm/config"
            else
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.webstorm"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.webstorm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.webstorm/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.webstorm/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/webstorm/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/webstorm"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.base.env" "${XDG_CONFIG_HOME}/webstorm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.key.linux.env" "${XDG_CONFIG_HOME}/webstorm/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.linux.env" "${XDG_CONFIG_HOME}/webstorm/config"
            else
                mkdir -p "${HOME}/.config/webstorm"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.base.env" "${HOME}/.config/webstorm/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.key.linux.env" "${HOME}/.config/webstorm/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/webstorm/config.linux.env" "${HOME}/.config/webstorm/config"
            fi
        fi
    fi

    if alias apcreatedirstructwebstormshare &>/dev/null; then
        apcreatedirstructwebstormshare
    fi

    if alias apcreatedirstructwebstormcommon &>/dev/null; then
        apcreatedirstructwebstormcommon
    fi

    if alias apcreatedirstructwebstormmain &>/dev/null; then
        apcreatedirstructwebstormmain
    fi
}

alias aprmdirstructwebstorm="ap_func_rm_dirstruct_webstorm"
ap_func_rm_dirstruct_webstorm() {
    apshowmsginfo "Remove [${HOME}/.config/webstorm/]\n"
    rm -rf "${HOME}/.config/webstorm/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/webstorm]\n"
    rm -f "${AP_SOFT_DIR}/bin/webstorm"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_webstorm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_webstorm.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/webstorm.1]\n"
    rm -f "${AP_MAN_DIR}/man1/webstorm.1"

    if alias aprmdirstructwebstormshare &>/dev/null; then
        aprmdirstructwebstormshare
    fi

    if alias aprmdirstructwebstormcommon &>/dev/null; then
        aprmdirstructwebstormcommon
    fi

    if alias aprmdirstructwebstormmain &>/dev/null; then
        aprmdirstructwebstormmain
    fi
}

alias apcreateglobalsymlinkwebstorm="ap_func_create_global_symlink_webstorm"
ap_func_create_global_symlink_webstorm() {
    if [ -f "${AP_SOFT_DIR}/bin/webstorm" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/webstorm] to [${AP_SOFT_DIR}/bin/webstorm]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/webstorm" "/usr/local/bin/webstorm"
    fi
}

alias aprmglobalsymlinkwebstorm="ap_func_rm_global_symlink_webstorm"
ap_func_rm_global_symlink_webstorm() {
    if [ -f "/usr/local/bin/webstorm" ]; then
        apshowmsginfo "Remove [/usr/local/bin/webstorm]\n"
        sudo rm -f "/usr/local/bin/webstorm"
    fi
}

alias apsetupwebstorm="ap_func_setup_webstorm"
ap_func_setup_webstorm() {
    local ap_webstorm_setup_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_webstorm_setup_version="$1"
    fi

    apshowmsginfo "Install [webstorm] version [${ap_webstorm_setup_version}]\n"

    apshowmsginfo "Install [webstorm]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/webstorm"
    rm -rf "${AP_TMP_DIR}/webstorm"

    # Install webstorm
    mkdir -p "${AP_TMP_DIR}/webstorm"
    cd "${AP_TMP_DIR}/webstorm"

    apshowmsginfo "Download [webstorm] version [${ap_webstorm_setup_version}] from [https://ziglang.org/download/${ap_webstorm_setup_version}/zig-${ap_os}-${ap_webstorm_setup_version}.tar.xz]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install webstorm
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/webstorm/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >webstorm.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/webstorm/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >webstorm.tar.gz
        fi

        rm -rf "/Applications/webstorm"

        unzip webstorm.zip
        mv webstorm* webstorm
        mv "webstorm/webstorm.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse webstorm.dmg
        cp -R "/Volumes/webstorm/webstorm.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/webstorm"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/webstorm/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >webstorm.tar.gz
        https://download-cdn.jetbrains.com/webstorm/WebStorm-2024.3.4.tar.gz

        sudo dpkg -i webstorm.deb
        sudo snap install -y webstorm
        sudo apt install -y webstorm
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/webstorm/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >webstorm.tar.gz

    tar -zxf webstorm.tar.gz
    rm -f webstorm.tar.gz

    mv webstorm* webstorm
    mv webstorm "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/webstorm"
    # rm -rf "${AP_TMP_DIR}/webstorm"

    ./configure
    make
    sudo make install

    cargo install webstorm
    pip install webstorm
    npm install -g webstorm

    apinitwebstorm
    apcreateglobalsymlinkwebstorm

    if alias apcreatedirstructwebstorm &>/dev/null; then
        apcreatedirstructwebstorm
    fi
}

alias aprmwebstorm="ap_func_rm_webstorm"
ap_func_rm_webstorm() {
    local ap_webstorm_remove_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_webstorm_remove_version="$1"
    fi

    apshowmsginfo "Remove [webstorm] v${ap_webstorm_remove_version}\n"

    apshowmsginfo "Remove [webstorm]\n"
    cargo uninstall webstorm
    pip uninstall webstorm
    npm uninstall -g webstorm

    rm -rf "${GOPATH}/pkg/mod/github.com/webstorm/webstorm@"*
    rm -f "${GOPATH}/bin/webstorm"

    rm -rf "${AP_SOFT_DIR}/webstorm"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/webstorm"
        brew remove --cask webstorm
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y webstorm
        sudo snap remove --purge webstorm
        sudo dpkg --purge webstorm
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructwebstorm &>/dev/null; then
        aprmdirstructwebstorm
    fi

    if alias aprmglobalsymlinkwebstorm &>/dev/null; then
        aprmglobalsymlinkwebstorm
    fi
}
