alias apinitnushell="ap_func_init_nushell"
ap_func_init_nushell() {
    if alias apinitnushellshare &>/dev/null; then
        apinitnushellshare
    fi

    if alias apinitnushellcommon &>/dev/null; then
        apinitnushellcommon
    fi

    if alias apinitnushellmain &>/dev/null; then
        apinitnushellmain
    fi
}

alias apcreatedirstructnushell="ap_func_create_dirstruct_nushell"
ap_func_create_dirstruct_nushell() {
    aplogshow "Generate [nushell] bash autocomplete\n"
    nushell >"${AP_COMPLETIONS_DIR}/ap_completion_nushell.bash"

    if [ -f "${HOME}/scripto-share/vendors/nushell/bindings.json" ]; then
        aplogshow "Create symlink from [${HOME}/.config/nushell/bindings.json] to [${HOME}/scripto-share/vendors/nushell/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/nushell/bindings.json" "${HOME}/.config/nushell/bindings.json"
    fi

    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/nushell] to [${AP_SOFT_DIR}/nushell/bin/nushell]\n"
    ln -sf "${AP_SOFT_DIR}/nushell/bin/nushell" "${AP_SOFT_DIR}/bin/nushell"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_nushell.bash] to [${AP_SOFT_DIR}/nushell/complete/nushell.bash]\n"
    ln -sf "${AP_SOFT_DIR}/nushell/autocomplete/nushell.bash" "${AP_COMPLETIONS_DIR}/ap_completion_nushell.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/nushell.1] to [${AP_SOFT_DIR}/nushell/nushell.1]\n"
    ln -sf "${AP_SOFT_DIR}/nushell/nushell.1" "${AP_MAN_DIR}/man1/nushell.1"

    if alias apcreatedirstructnushellshare &>/dev/null; then
        apcreatedirstructnushellshare
    fi

    if alias apcreatedirstructnushellcommon &>/dev/null; then
        apcreatedirstructnushellcommon
    fi

    if alias apcreatedirstructnushellmain &>/dev/null; then
        apcreatedirstructnushellmain
    fi
}

alias aprmdirstructnushell="ap_func_rm_dirstruct_nushell"
ap_func_rm_dirstruct_nushell() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/nushell]\n"
    rm -f "${AP_SOFT_DIR}/bin/nushell"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_nushell.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_nushell.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/nushell.1]\n"
    rm -f "${AP_MAN_DIR}/man1/nushell.1"

    if alias aprmdirstructnushellshare &>/dev/null; then
        aprmdirstructnushellshare
    fi

    if alias aprmdirstructnushellcommon &>/dev/null; then
        aprmdirstructnushellcommon
    fi

    if alias aprmdirstructnushellmain &>/dev/null; then
        aprmdirstructnushellmain
    fi
}

alias apcreateglobalsymlinknushell="ap_func_create_global_symlink_nushell"
ap_func_create_global_symlink_nushell() {
    if [ -f "${AP_SOFT_DIR}/bin/nushell" ]; then
        aplogshow "Create symlink from [/usr/local/bin/nushell] to [${AP_SOFT_DIR}/bin/nushell]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/nushell" "/usr/local/bin/nushell"
    fi
}

alias aprmglobalsymlinknushell="ap_func_rm_global_symlink_nushell"
ap_func_rm_global_symlink_nushell() {
    if [ -f "/usr/local/bin/nushell" ]; then
        aplogshow "Remove [/usr/local/bin/nushell]\n"
        sudo rm -f "/usr/local/bin/nushell"
    fi
}

alias apsetupnushell="ap_func_setup_nushell"
ap_func_setup_nushell() {
    local ap_nushell_setup_version=''
    if [ -n "$1" ]; then
        ap_nushell_setup_version="$1"
    fi

    aplogshow "Install [nushell] v${ap_nushell_setup_version}\n"

    aplogshow "Install [nushell]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/nushell"
    rm -rf "${AP_TMP_DIR}/nushell"

    # Install nushell
    mkdir -p "${AP_TMP_DIR}/nushell"
    cd "${AP_TMP_DIR}/nushell"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/nushell/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >nushell.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/nushell/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >nushell.tar.gz
        fi

        unzip nushell.zip
        mv nushell* nushell
        rm -rf "/Applications/nushell"
        mv "nushell/nushell.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse nushell.dmg
        cd "/Volumes/nushell"
        cp -R "nushell.app" /Applications/
        cd ~
        hdiutil detach "/Volumes/nushell"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/nushell/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >nushell.tar.gz
        sudo dpkg -i nushell.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/nushell/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >nushell.tar.gz

    tar -zxf nushell.tar.gz
    rm -f nushell.tar.gz
    mv nushell* nushell
    mv nushell "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/nushell"
    rm -rf "${AP_TMP_DIR}/nushell"

    pip install nushell
    npm install -g nushell

    apinitnushell
    if alias apcreatedirstructnushell &>/dev/null; then
        apcreatedirstructnushell
    fi
}

alias aprmnushell="ap_func_rm_nushell"
ap_func_rm_nushell() {
    local ap_nushell_remove_version=''
    if [ -n "$1" ]; then
        ap_nushell_remove_version="$1"
    fi

    aplogshow "Remove [nushell] v${ap_nushell_remove_version}\n"

    aplogshow "Remove [nushell]\n"
    pip uninstall nushell
    npm uninstall -g nushell

    rm -rf "${GOPATH}/pkg/mod/github.com/nushell/nushell@"*
    rm -f "${GOPATH}/bin/nushell"

    rm -rf "${AP_SOFT_DIR}/nushell"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask nushell
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y nushell
        sudo snap remove --purge nushell
        sudo dpkg --purge nushell
    fi

    if alias aprmdirstructnushell &>/dev/null; then
        aprmdirstructnushell
    fi

    if alias aprmglobalsymlinknushell &>/dev/null; then
        aprmglobalsymlinknushell
    fi
}
