alias apinitdiskus="ap_func_init_diskus"
ap_func_init_diskus() {
    if alias apinitdiskusshare &>/dev/null; then
        apinitdiskusshare
    fi

    if alias apinitdiskuscommon &>/dev/null; then
        apinitdiskuscommon
    fi

    if alias apinitdiskusmain &>/dev/null; then
        apinitdiskusmain
    fi
}

alias apcreatedirstructdiskus="ap_func_create_dirstruct_diskus"
ap_func_create_dirstruct_diskus() {
    aplogshow "Generate [diskus] bash autocomplete\n"
    diskus >"${AP_COMPLETIONS_DIR}/ap_completion_diskus.bash"

    if [ -f "${HOME}/scripto-share/vendors/diskus/bindings.json" ]; then
        aplogshow "Create symlink from [${HOME}/.config/diskus/bindings.json] to [${HOME}/scripto-share/vendors/diskus/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/diskus/bindings.json" "${HOME}/.config/diskus/bindings.json"
    fi

    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/diskus] to [${AP_SOFT_DIR}/diskus/bin/diskus]\n"
    ln -sf "${AP_SOFT_DIR}/diskus/bin/diskus" "${AP_SOFT_DIR}/bin/diskus"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_diskus.bash] to [${AP_SOFT_DIR}/diskus/complete/diskus.bash]\n"
    ln -sf "${AP_SOFT_DIR}/diskus/autocomplete/diskus.bash" "${AP_COMPLETIONS_DIR}/ap_completion_diskus.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/diskus.1] to [${AP_SOFT_DIR}/diskus/diskus.1]\n"
    ln -sf "${AP_SOFT_DIR}/diskus/diskus.1" "${AP_MAN_DIR}/man1/diskus.1"

    if alias apcreatedirstructdiskusshare &>/dev/null; then
        apcreatedirstructdiskusshare
    fi

    if alias apcreatedirstructdiskuscommon &>/dev/null; then
        apcreatedirstructdiskuscommon
    fi

    if alias apcreatedirstructdiskusmain &>/dev/null; then
        apcreatedirstructdiskusmain
    fi
}

alias aprmdirstructdiskus="ap_func_rm_dirstruct_diskus"
ap_func_rm_dirstruct_diskus() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/diskus]\n"
    rm -f "${AP_SOFT_DIR}/bin/diskus"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_diskus.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_diskus.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/diskus.1]\n"
    rm -f "${AP_MAN_DIR}/man1/diskus.1"

    if alias aprmdirstructdiskusshare &>/dev/null; then
        aprmdirstructdiskusshare
    fi

    if alias aprmdirstructdiskuscommon &>/dev/null; then
        aprmdirstructdiskuscommon
    fi

    if alias aprmdirstructdiskusmain &>/dev/null; then
        aprmdirstructdiskusmain
    fi
}

alias apcreateglobalsymlinkdiskus="ap_func_create_global_symlink_diskus"
ap_func_create_global_symlink_diskus() {
    if [ -f "${AP_SOFT_DIR}/bin/diskus" ]; then
        aplogshow "Create symlink from [/usr/local/bin/diskus] to [${AP_SOFT_DIR}/bin/diskus]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/diskus" "/usr/local/bin/diskus"
    fi
}

alias aprmglobalsymlinkdiskus="ap_func_rm_global_symlink_diskus"
ap_func_rm_global_symlink_diskus() {
    if [ -f "/usr/local/bin/diskus" ]; then
        aplogshow "Remove [/usr/local/bin/diskus]\n"
        sudo rm -f "/usr/local/bin/diskus"
    fi
}

alias apsetupdiskus="ap_func_setup_diskus"
ap_func_setup_diskus() {
    local ap_diskus_setup_version=''
    if [ -n "$1" ]; then
        ap_diskus_setup_version="$1"
    fi

    aplogshow "Install [diskus] v${ap_diskus_setup_version}\n"

    aplogshow "Install [diskus]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/diskus"
    rm -rf "${AP_TMP_DIR}/diskus"

    # Install diskus
    mkdir -p "${AP_TMP_DIR}/diskus"
    cd "${AP_TMP_DIR}/diskus"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install diskus
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/diskus/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >diskus.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/diskus/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >diskus.tar.gz
        fi

        unzip diskus.zip
        mv diskus* diskus
        rm -rf "/Applications/diskus"
        mv "diskus/diskus.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse diskus.dmg
        cd "/Volumes/diskus"
        cp -R "diskus.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/diskus"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/diskus/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >diskus.tar.gz
        sudo dpkg -i diskus.deb
        sudo snap install -y diskus
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/diskus/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >diskus.tar.gz

    tar -zxf diskus.tar.gz
    rm -f diskus.tar.gz
    mv diskus* diskus
    mv diskus "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/diskus"
    rm -rf "${AP_TMP_DIR}/diskus"

    cargo install diskus
    pip install diskus
    npm install -g diskus

    apinitdiskus
    if alias apcreatedirstructdiskus &>/dev/null; then
        apcreatedirstructdiskus
    fi
}

alias aprmdiskus="ap_func_rm_diskus"
ap_func_rm_diskus() {
    local ap_diskus_remove_version=''
    if [ -n "$1" ]; then
        ap_diskus_remove_version="$1"
    fi

    aplogshow "Remove [diskus] v${ap_diskus_remove_version}\n"

    aplogshow "Remove [diskus]\n"
    cargo remove diskus
    pip uninstall diskus
    npm uninstall -g diskus

    rm -rf "${GOPATH}/pkg/mod/github.com/diskus/diskus@"*
    rm -f "${GOPATH}/bin/diskus"

    rm -rf "${AP_SOFT_DIR}/diskus"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/diskus"
        brew remove --cask diskus
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y diskus
        sudo snap remove --purge diskus
        sudo dpkg --purge diskus
    fi

    if alias aprmdirstructdiskus &>/dev/null; then
        aprmdirstructdiskus
    fi

    if alias aprmglobalsymlinkdiskus &>/dev/null; then
        aprmglobalsymlinkdiskus
    fi
}
