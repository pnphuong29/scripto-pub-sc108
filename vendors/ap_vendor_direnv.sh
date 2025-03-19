alias apinitdirenv="ap_func_init_direnv"
ap_func_init_direnv() {
    if [ -f "${AP_SOFT_DIR}/bin/direnv" ]; then
        eval "$("${AP_SOFT_DIR}"/bin/direnv hook bash)"
    fi

    if alias apinitdirenvshare &>/dev/null; then
        apinitdirenvshare
    fi

    if alias apinitdirenvcommon &>/dev/null; then
        apinitdirenvcommon
    fi

    if alias apinitdirenvmain &>/dev/null; then
        apinitdirenvmain
    fi
}

alias apcreatedirstructdirenv="ap_func_create_dirstruct_direnv"
ap_func_create_dirstruct_direnv() {
    if alias apcreatedirstructdirenvshare &>/dev/null; then
        apcreatedirstructdirenvshare
    fi

    if alias apcreatedirstructdirenvcommon &>/dev/null; then
        apcreatedirstructdirenvcommon
    fi

    if alias apcreatedirstructdirenvmain &>/dev/null; then
        apcreatedirstructdirenvmain
    fi
}

alias aprmdirstructdirenv="ap_func_rm_dirstruct_direnv"
ap_func_rm_dirstruct_direnv() {
    if alias aprmdirstructdirenvshare &>/dev/null; then
        aprmdirstructdirenvshare
    fi

    if alias aprmdirstructdirenvcommon &>/dev/null; then
        aprmdirstructdirenvcommon
    fi

    if alias aprmdirstructdirenvmain &>/dev/null; then
        aprmdirstructdirenvmain
    fi
}

alias apcreateglobalsymlinkdirenv="ap_func_create_global_symlink_direnv"
ap_func_create_global_symlink_direnv() {
    if [ -f "${AP_SOFT_DIR}/bin/direnv" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/direnv] to [${AP_SOFT_DIR}/bin/direnv]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/direnv" "/usr/local/bin/direnv"
    fi
}

alias aprmglobalsymlinkdirenv="ap_func_rm_global_symlink_direnv"
ap_func_rm_global_symlink_direnv() {
    if [ -f "/usr/local/bin/direnv" ]; then
        apshowmsginfo "Remove [/usr/local/bin/direnv]\n"
        sudo rm -f "/usr/local/bin/direnv"
    fi
}

alias apsetupdirenv="ap_func_setup_direnv"
ap_func_setup_direnv() {
    apshowmsginfo "Install [direnv]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/direnv"

    # Install direnv
    mkdir -p "${AP_TMP_DIR}/direnv"
    cd "${AP_TMP_DIR}/direnv"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install direnv
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/direnv/direnv/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep arm64)" >direnv
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/direnv/direnv/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep amd64)" >direnv
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/direnv/direnv/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep amd64)" >direnv
    fi

    chmod +x direnv
    mv direnv "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}/bin"
    # rm -rf "${AP_TMP_DIR}/direnv"

    apinitdirenv

    apcreateglobalsymlinkdirenv
    if alias apcreateglobalsymlinkdirenv &>/dev/null; then
        apcreatedirstructdirenv
    fi

    if alias apcreatedirstructdirenv &>/dev/null; then
        apcreatedirstructdirenv
    fi
}

alias aprmdirenv="ap_func_rm_direnv"
ap_func_rm_direnv() {
    apshowmsginfo "Remove [direnv]\n"

    rm -f "${AP_SOFT_DIR}/bin/direnv"

    if alias aprmdirstructdirenv &>/dev/null; then
        aprmdirstructdirenv
    fi

    if alias aprmglobalsymlinkdirenv &>/dev/null; then
        aprmglobalsymlinkdirenv
    fi
}
