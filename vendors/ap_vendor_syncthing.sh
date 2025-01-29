alias apinitsyncthing="ap_func_init_syncthing"
ap_func_init_syncthing() {
    alias zsyncthing="cd \${AP_SOFT_DIR}/syncthing"

    if alias apinitsyncthingshare &>/dev/null; then
        apinitsyncthingshare
    fi

    if alias apinitsyncthingcommon &>/dev/null; then
        apinitsyncthingcommon
    fi

    if alias apinitsyncthingmain &>/dev/null; then
        apinitsyncthingmain
    fi
}

alias apcreatedirstructsyncthing="ap_func_create_dirstruct_syncthing"
ap_func_create_dirstruct_syncthing() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/syncthing] to [${AP_SOFT_DIR}/syncthing/syncthing]\n"
    ln -sf "${AP_SOFT_DIR}/syncthing/syncthing" "${AP_SOFT_DIR}/bin/syncthing"

    aplogshow "Generate [syncthing] bash autocomplete\n"
    syncthing install-completions >"${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash"

    # if [ -f "${HOME}/scripto-share/vendors/syncthing/bindings.json" ]; then
    #     aplogshow "Create symlink from [${HOME}/.config/syncthing/bindings.json] to [${HOME}/scripto-share/vendors/syncthing/bindings.json]\n"
    #     ln -sf "${HOME}/scripto-share/vendors/syncthing/bindings.json" "${HOME}/.config/syncthing/bindings.json"
    # fi

    # aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash] to [${AP_SOFT_DIR}/syncthing/complete/syncthing.bash]\n"
    # ln -sf "${AP_SOFT_DIR}/syncthing/autocomplete/syncthing.bash" "${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash"

    # aplogshow "Create symlink from [${AP_MAN_DIR}/man1/syncthing.1] to [${AP_SOFT_DIR}/syncthing/syncthing.1]\n"
    # ln -sf "${AP_SOFT_DIR}/syncthing/syncthing.1" "${AP_MAN_DIR}/man1/syncthing.1"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     if [ -f "${HOME}/scripto-common/vendors/syncthing/config.mac.env" ]; then
    #         if [ -d "${XDG_CONFIG_HOME}" ]; then
    #             mkdir -p "${XDG_CONFIG_HOME}/syncthing"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.base.env" "${XDG_CONFIG_HOME}/syncthing/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.key.mac.env" "${XDG_CONFIG_HOME}/syncthing/config.key.mac.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.mac.env" "${XDG_CONFIG_HOME}/syncthing/config"
    #         else
    #             mkdir -p "${HOME}/Library/Application Support/com.mitchellh.syncthing"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.syncthing/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.syncthing/config.key.mac.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.syncthing/config"
    #         fi
    #     fi
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     if [ -f "${HOME}/scripto-common/vendors/syncthing/config.linux.env" ]; then
    #         if [ -d "${XDG_CONFIG_HOME}" ]; then
    #             mkdir -p "${XDG_CONFIG_HOME}/syncthing"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.base.env" "${XDG_CONFIG_HOME}/syncthing/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.key.linux.env" "${XDG_CONFIG_HOME}/syncthing/config.key.linux.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.linux.env" "${XDG_CONFIG_HOME}/syncthing/config"
    #         else
    #             mkdir -p "${HOME}/.config/syncthing"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.base.env" "${HOME}/.config/syncthing/config.base.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.key.linux.env" "${HOME}/.config/syncthing/config.key.linux.env"
    #             ln -sf "${HOME}/scripto-common/vendors/syncthing/config.linux.env" "${HOME}/.config/syncthing/config"
    #         fi
    #     fi
    # fi

    if alias apcreatedirstructsyncthingshare &>/dev/null; then
        apcreatedirstructsyncthingshare
    fi

    if alias apcreatedirstructsyncthingcommon &>/dev/null; then
        apcreatedirstructsyncthingcommon
    fi

    if alias apcreatedirstructsyncthingmain &>/dev/null; then
        apcreatedirstructsyncthingmain
    fi
}

alias aprmdirstructsyncthing="ap_func_rm_dirstruct_syncthing"
ap_func_rm_dirstruct_syncthing() {
    aplogshow "Remove [${HOME}/.config/syncthing/]\n"
    rm -f "${HOME}/.config/syncthing/"

    aplogshow "Remove [${AP_SOFT_DIR}/bin/syncthing]\n"
    rm -f "${AP_SOFT_DIR}/bin/syncthing"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_syncthing.bash"

    if alias aprmdirstructsyncthingshare &>/dev/null; then
        aprmdirstructsyncthingshare
    fi

    if alias aprmdirstructsyncthingcommon &>/dev/null; then
        aprmdirstructsyncthingcommon
    fi

    if alias aprmdirstructsyncthingmain &>/dev/null; then
        aprmdirstructsyncthingmain
    fi
}

alias apcreateglobalsymlinksyncthing="ap_func_create_global_symlink_syncthing"
ap_func_create_global_symlink_syncthing() {
    if [ -f "${AP_SOFT_DIR}/bin/syncthing" ]; then
        aplogshow "Create symlink from [/usr/local/bin/syncthing] to [${AP_SOFT_DIR}/bin/syncthing]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/syncthing" "/usr/local/bin/syncthing"
    fi
}

alias aprmglobalsymlinksyncthing="ap_func_rm_global_symlink_syncthing"
ap_func_rm_global_symlink_syncthing() {
    if [ -f "/usr/local/bin/syncthing" ]; then
        aplogshow "Remove [/usr/local/bin/syncthing]\n"
        sudo rm -f "/usr/local/bin/syncthing"
    fi
}

alias apsetupsyncthing="ap_func_setup_syncthing"
ap_func_setup_syncthing() {
    aplogshow "Install [syncthing]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/syncthing"
    rm -rf "${AP_TMP_DIR}/syncthing"

    # Install syncthing
    mkdir -p "${AP_TMP_DIR}/syncthing"
    cd "${AP_TMP_DIR}/syncthing"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/syncthing/syncthing/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep "arm64")" >syncthing.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/syncthing/syncthing/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep "amd64")" >syncthing.zip
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/syncthing/syncthing/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep "amd64")" >syncthing.zip
    fi

    unzip syncthing.zip
    mv syncthing-* syncthing
    mv syncthing "${AP_SOFT_DIR}/"

    apinitsyncthing
    if alias apcreatedirstructsyncthing &>/dev/null; then
        apcreatedirstructsyncthing
    fi
}

alias aprmsyncthing="ap_func_rm_syncthing"
ap_func_rm_syncthing() {
    aplogshow "Remove [syncthing]\n"

    rm -rf "${AP_SOFT_DIR}/syncthing"

    if alias aprmdirstructsyncthing &>/dev/null; then
        aprmdirstructsyncthing
    fi

    if alias aprmglobalsymlinksyncthing &>/dev/null; then
        aprmglobalsymlinksyncthing
    fi
}
