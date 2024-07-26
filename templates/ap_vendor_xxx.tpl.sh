alias apinitxxx="ap_func_init_xxx"
ap_func_init_xxx() {
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
    aplogshow "Generate [xxx] bash autocomplete\n"
    xxx >"${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    if [ -f "${HOME}/scripto-share/vendors/xxx/bindings.json" ]; then
        aplogshow "Create symlink from [${HOME}/.config/xxx/bindings.json] to [${HOME}/scripto-share/vendors/xxx/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/xxx/bindings.json" "${HOME}/.config/xxx/bindings.json"
    fi

    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/xxx] to [${AP_SOFT_DIR}/xxx/bin/xxx]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/bin/xxx" "${AP_SOFT_DIR}/bin/xxx"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash] to [${AP_SOFT_DIR}/xxx/complete/xxx.bash]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/autocomplete/xxx.bash" "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/xxx.1] to [${AP_SOFT_DIR}/xxx/xxx.1]\n"
    ln -sf "${AP_SOFT_DIR}/xxx/xxx.1" "${AP_MAN_DIR}/man1/xxx.1"

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
    aplogshow "Remove [${AP_SOFT_DIR}/bin/xxx]\n"
    rm -f "${AP_SOFT_DIR}/bin/xxx"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_xxx.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/xxx.1]\n"
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
        aplogshow "Create symlink from [/usr/local/bin/xxx] to [${AP_SOFT_DIR}/bin/xxx]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/xxx" "/usr/local/bin/xxx"
    fi
}

alias aprmglobalsymlinkxxx="ap_func_rm_global_symlink_xxx"
ap_func_rm_global_symlink_xxx() {
    if [ -f "/usr/local/bin/xxx" ]; then
        aplogshow "Remove [/usr/local/bin/xxx]\n"
        sudo rm -f "/usr/local/bin/xxx"
    fi
}

alias apsetupxxx="ap_func_setup_xxx"
ap_func_setup_xxx() {
    local ap_xxx_setup_version=''
    if [ -n "$1" ]; then
        ap_xxx_setup_version="$1"
    fi

    aplogshow "Install [xxx] v${ap_xxx_setup_version}\n"

    aplogshow "Install [xxx]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/xxx"
    rm -rf "${AP_TMP_DIR}/xxx"

    # Install xxx
    mkdir -p "${AP_TMP_DIR}/xxx"
    cd "${AP_TMP_DIR}/xxx"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/xxx/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >xxx.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/xxx/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >xxx.tar.gz
        fi

        unzip xxx.zip
        mv xxx* xxx
        rm -rf "/Applications/xxx"
        mv "xxx/xxx.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse xxx.dmg
        cd "/Volumes/xxx"
        cp -R "xxx.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/xxx"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/xxx/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >xxx.tar.gz
        sudo dpkg -i xxx.deb
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
    rm -rf "${AP_TMP_DIR}/xxx"

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
    local ap_xxx_remove_version=''
    if [ -n "$1" ]; then
        ap_xxx_remove_version="$1"
    fi

    aplogshow "Remove [xxx] v${ap_xxx_remove_version}\n"

    aplogshow "Remove [xxx]\n"
    cargo remove xxx
    pip uninstall xxx
    npm uninstall -g xxx

    rm -rf "${GOPATH}/pkg/mod/github.com/xxx/xxx@"*
    rm -f "${GOPATH}/bin/xxx"

    rm -rf "${AP_SOFT_DIR}/xxx"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/xxx"
        brew remove --cask xxx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y xxx
        sudo snap remove --purge xxx
        sudo dpkg --purge xxx
    fi

    if alias aprmdirstructxxx &>/dev/null; then
        aprmdirstructxxx
    fi

    if alias aprmglobalsymlinkxxx &>/dev/null; then
        aprmglobalsymlinkxxx
    fi
}
