alias apinitminioshare="ap_func_init_minio_share"
ap_func_init_minio_share() {

}

alias apinitminiocommon="ap_func_init_minio_common"
ap_func_init_minio_common() {

}

alias apinitminio="ap_func_init_minio"
ap_func_init_minio() {
    if alias apinitminioshare &>/dev/null; then
        initminioshare
    fi

    if alias apinitminiocommon &>/dev/null; then
        initminiocommon
    fi
}

alias apcreatedirstructminioshare="ap_func_create_dirstruct_minio_share"
ap_func_create_dirstruct_minio_share() {

}

alias apcreatedirstructminiocommon="ap_func_create_dirstruct_minio_common"
ap_func_create_dirstruct_minio_common() {

}

alias apcreatedirstructminio="ap_func_create_dirstruct_minio"
ap_func_create_dirstruct_minio() {
    aplogshow "Generate [minio] bash autocomplete\n"
    minio >"${AP_COMPLETIONS_DIR}/ap_completion_minio.bash"

    if [ -f "${HOME}/scripto-share/vendors/minio/bindings.json" ]; then
        aplogshow "Create symlink from [${HOME}/.config/minio/bindings.json] to [${HOME}/scripto-share/vendors/minio/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/minio/bindings.json" "${HOME}/.config/minio/bindings.json"
    fi

    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/minio] to [${AP_SOFT_DIR}/minio/bin/minio]\n"
    ln -sf "${AP_SOFT_DIR}/minio/bin/minio" "${AP_SOFT_DIR}/bin/minio"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_minio.bash] to [${AP_SOFT_DIR}/minio/complete/minio.bash]\n"
    ln -sf "${AP_SOFT_DIR}/minio/autocomplete/minio.bash" "${AP_COMPLETIONS_DIR}/ap_completion_minio.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/minio.1] to [${AP_SOFT_DIR}/minio/minio.1]\n"
    ln -sf "${AP_SOFT_DIR}/minio/minio.1" "${AP_MAN_DIR}/man1/minio.1"

    if alias apcreatedirstructminioshare &>/dev/null; then
        createdirstructminioshare
    fi

    if alias apcreatedirstructminiocommon &>/dev/null; then
        createdirstructminiocommon
    fi
}

alias aprmdirstructminioshare="ap_func_rm_dirstruct_minio_share"
ap_func_rm_dirstruct_minio_share() {

}

alias aprmdirstructminiocommon="ap_func_rm_dirstruct_minio_common"
ap_func_rm_dirstruct_minio_common() {

}

alias aprmdirstructminio="ap_func_rm_dirstruct_minio"
ap_func_rm_dirstruct_minio() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/minio]\n"
    rm -f "${AP_SOFT_DIR}/bin/minio"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_minio.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_minio.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/minio.1]\n"
    rm -f "${AP_MAN_DIR}/man1/minio.1"

    if alias aprmdirstructminioshare &>/dev/null; then
        rmdirstructminioshare
    fi

    if alias aprmdirstructminiocommon &>/dev/null; then
        rmdirstructminiocommon
    fi
}

alias apcreateglobalsymlinkminio="ap_func_create_global_symlink_minio"
ap_func_create_global_symlink_minio() {
    if [ -f "${AP_SOFT_DIR}/bin/minio" ]; then
        aplogshow "Create symlink from [/usr/local/bin/minio] to [${AP_SOFT_DIR}/bin/minio]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/minio" "/usr/local/bin/minio"
    fi
}

alias aprmglobalsymlinkminio="ap_func_rm_global_symlink_minio"
ap_func_rm_global_symlink_minio() {
    if [ -f "/usr/local/bin/minio" ]; then
        aplogshow "Remove [/usr/local/bin/minio]\n"
        sudo rm -f "/usr/local/bin/minio"
    fi
}

alias apsetupminio="ap_func_setup_minio"
ap_func_setup_minio() {
    local ap_minio_setup_version=''
    if [ -n "$1" ]; then
        ap_minio_setup_version="$1"
    fi

    aplogshow "Install [minio] v${ap_minio_setup_version}\n"

    aplogshow "Install [minio]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/minio"
    rm -rf "${AP_TMP_DIR}/minio"

    # Install minio
    mkdir -p "${AP_TMP_DIR}/minio"
    cd "${AP_TMP_DIR}/minio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/minio/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >minio.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/minio/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >minio.tar.gz
        fi

        unzip minio.zip
        mv minio* minio
        rm -rf "/Applications/minio"
        mv "minio/minio.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse minio.dmg
        cd "/Volumes/minio"
        cp -R "minio.app" /Applications/
        cd ~
        hdiutil detach "/Volumes/minio"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/minio/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >minio.tar.gz
        sudo dpkg -i minio.deb
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/minio/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >minio.tar.gz

    tar -zxf minio.tar.gz
    rm -f minio.tar.gz
    mv minio* minio
    mv minio "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/minio"
    rm -rf "${AP_TMP_DIR}/minio"

    pip install minio
    npm install -g minio

    initminio
    if alias apcreatedirstructminio &>/dev/null; then
        createdirstructminio
    fi
}

alias aprmminio="ap_func_rm_minio"
ap_func_rm_minio() {
    local ap_minio_remove_version=''
    if [ -n "$1" ]; then
        ap_minio_remove_version="$1"
    fi

    aplogshow "Remove [minio] v${ap_minio_remove_version}\n"

    aplogshow "Remove [minio]\n"
    pip uninstall minio
    npm uninstall -g minio

    rm -rf "${GOPATH}/pkg/mod/github.com/minio/minio@"*
    rm -f "${GOPATH}/bin/minio"

    rm -rf "${AP_SOFT_DIR}/minio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask minio
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y minio
        sudo dpkg --purge minio
    fi

    if alias aprmdirstructminio &>/dev/null; then
        rmdirstructminio
    fi

    if alias aprmglobalsymlinkminio &>/dev/null; then
        rmglobalsymlinkminio
    fi
}
