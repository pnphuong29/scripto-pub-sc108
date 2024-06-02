alias apinitpostman="ap_func_init_postman"
ap_func_init_postman() {
    if alias apinitpostmanshare &>/dev/null; then
        apinitpostmanshare
    fi

    if alias apinitpostmancommon &>/dev/null; then
        apinitpostmancommon
    fi

    if alias apinitpostmanmain &>/dev/null; then
        apinitpostmanmain
    fi
}

alias apcreatedirstructpostman="ap_func_create_dirstruct_postman"
ap_func_create_dirstruct_postman() {
    aplogshow "Generate [postman] bash autocomplete\n"
    postman >"${AP_COMPLETIONS_DIR}/ap_completion_postman.bash"

    if [ -f "${HOME}/scripto-share/vendors/postman/bindings.json" ]; then
        aplogshow "Create symlink from [${HOME}/.config/postman/bindings.json] to [${HOME}/scripto-share/vendors/postman/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/postman/bindings.json" "${HOME}/.config/postman/bindings.json"
    fi

    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/postman] to [${AP_SOFT_DIR}/postman/bin/postman]\n"
    ln -sf "${AP_SOFT_DIR}/postman/bin/postman" "${AP_SOFT_DIR}/bin/postman"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_postman.bash] to [${AP_SOFT_DIR}/postman/complete/postman.bash]\n"
    ln -sf "${AP_SOFT_DIR}/postman/autocomplete/postman.bash" "${AP_COMPLETIONS_DIR}/ap_completion_postman.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/postman.1] to [${AP_SOFT_DIR}/postman/postman.1]\n"
    ln -sf "${AP_SOFT_DIR}/postman/postman.1" "${AP_MAN_DIR}/man1/postman.1"

    if alias apcreatedirstructpostmanshare &>/dev/null; then
        apcreatedirstructpostmanshare
    fi

    if alias apcreatedirstructpostmancommon &>/dev/null; then
        apcreatedirstructpostmancommon
    fi

    if alias apcreatedirstructpostmanmain &>/dev/null; then
        apcreatedirstructpostmanmain
    fi
}

alias aprmdirstructpostman="ap_func_rm_dirstruct_postman"
ap_func_rm_dirstruct_postman() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/postman]\n"
    rm -f "${AP_SOFT_DIR}/bin/postman"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_postman.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_postman.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/postman.1]\n"
    rm -f "${AP_MAN_DIR}/man1/postman.1"

    if alias aprmdirstructpostmanshare &>/dev/null; then
        aprmdirstructpostmanshare
    fi

    if alias aprmdirstructpostmancommon &>/dev/null; then
        aprmdirstructpostmancommon
    fi

    if alias aprmdirstructpostmanmain &>/dev/null; then
        aprmdirstructpostmanmain
    fi
}

alias apcreateglobalsymlinkpostman="ap_func_create_global_symlink_postman"
ap_func_create_global_symlink_postman() {
    if [ -f "${AP_SOFT_DIR}/bin/postman" ]; then
        aplogshow "Create symlink from [/usr/local/bin/postman] to [${AP_SOFT_DIR}/bin/postman]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/postman" "/usr/local/bin/postman"
    fi
}

alias aprmglobalsymlinkpostman="ap_func_rm_global_symlink_postman"
ap_func_rm_global_symlink_postman() {
    if [ -f "/usr/local/bin/postman" ]; then
        aplogshow "Remove [/usr/local/bin/postman]\n"
        sudo rm -f "/usr/local/bin/postman"
    fi
}

alias apsetuppostman="ap_func_setup_postman"
ap_func_setup_postman() {
    local ap_postman_setup_version=''
    if [ -n "$1" ]; then
        ap_postman_setup_version="$1"
    fi

    aplogshow "Install [postman] v${ap_postman_setup_version}\n"

    aplogshow "Install [postman]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/postman"
    rm -rf "${AP_TMP_DIR}/postman"

    # Install postman
    mkdir -p "${AP_TMP_DIR}/postman"
    cd "${AP_TMP_DIR}/postman"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/postman/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >postman.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/postman/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >postman.tar.gz
        fi

        unzip postman.zip
        mv postman* postman
        rm -rf "/Applications/postman"
        mv "postman/postman.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse postman.dmg
        cd "/Volumes/postman"
        cp -R "postman.app" /Applications/
        cd ~
        hdiutil detach "/Volumes/postman"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/postman/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >postman.tar.gz
        sudo dpkg -i postman.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/postman/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >postman.tar.gz

    tar -zxf postman.tar.gz
    rm -f postman.tar.gz
    mv postman* postman
    mv postman "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/postman"
    rm -rf "${AP_TMP_DIR}/postman"

    pip install postman
    npm install -g postman

    apinitpostman
    if alias apcreatedirstructpostman &>/dev/null; then
        apcreatedirstructpostman
    fi
}

alias aprmpostman="ap_func_rm_postman"
ap_func_rm_postman() {
    local ap_postman_remove_version=''
    if [ -n "$1" ]; then
        ap_postman_remove_version="$1"
    fi

    aplogshow "Remove [postman] v${ap_postman_remove_version}\n"

    aplogshow "Remove [postman]\n"
    pip uninstall postman
    npm uninstall -g postman

    rm -rf "${GOPATH}/pkg/mod/github.com/postman/postman@"*
    rm -f "${GOPATH}/bin/postman"

    rm -rf "${AP_SOFT_DIR}/postman"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask postman
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y postman
        sudo snap remove --purge postman
        sudo dpkg --purge postman
    fi

    if alias aprmdirstructpostman &>/dev/null; then
        aprmdirstructpostman
    fi

    if alias aprmglobalsymlinkpostman &>/dev/null; then
        aprmglobalsymlinkpostman
    fi
}
