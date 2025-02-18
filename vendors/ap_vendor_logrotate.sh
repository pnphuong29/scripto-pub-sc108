# https://github.com/logrotate/logrotate
alias apinitlogrotate="ap_func_init_logrotate"
ap_func_init_logrotate() {
    if alias apinitlogrotateshare &>/dev/null; then
        apinitlogrotateshare
    fi

    if alias apinitlogrotatecommon &>/dev/null; then
        apinitlogrotatecommon
    fi

    if alias apinitlogrotatemain &>/dev/null; then
        apinitlogrotatemain
    fi
}

alias apcreatedirstructlogrotate="ap_func_create_dirstruct_logrotate"
ap_func_create_dirstruct_logrotate() {
    if alias apcreatedirstructlogrotateshare &>/dev/null; then
        apcreatedirstructlogrotateshare
    fi

    if alias apcreatedirstructlogrotatecommon &>/dev/null; then
        apcreatedirstructlogrotatecommon
    fi

    if alias apcreatedirstructlogrotatemain &>/dev/null; then
        apcreatedirstructlogrotatemain
    fi
}

alias aprmdirstructlogrotate="ap_func_rm_dirstruct_logrotate"
ap_func_rm_dirstruct_logrotate() {
    if alias aprmdirstructlogrotateshare &>/dev/null; then
        aprmdirstructlogrotateshare
    fi

    if alias aprmdirstructlogrotatecommon &>/dev/null; then
        aprmdirstructlogrotatecommon
    fi

    if alias aprmdirstructlogrotatemain &>/dev/null; then
        aprmdirstructlogrotatemain
    fi
}

# alias apcreateglobalsymlinklogrotate="ap_func_create_global_symlink_logrotate"
# ap_func_create_global_symlink_logrotate() {
#     if [ -f "${AP_SOFT_DIR}/bin/logrotate" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/logrotate] to [${AP_SOFT_DIR}/bin/logrotate]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/logrotate" "/usr/local/bin/logrotate"
#     fi
# }

# alias aprmglobalsymlinklogrotate="ap_func_rm_global_symlink_logrotate"
# ap_func_rm_global_symlink_logrotate() {
#     if [ -f "/usr/local/bin/logrotate" ]; then
#         aplogshow "Remove [/usr/local/bin/logrotate]\n"
#         sudo rm -f "/usr/local/bin/logrotate"
#     fi
# }

alias apsetuplogrotate="ap_func_setup_logrotate"
ap_func_setup_logrotate() {
    aplogshow "Install [logrotate]\n"

    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        brew install logrotate
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        sudo apt install -y logrotate
    fi

    # Method 2: Install logrotate from source
    # Install required libraries
    # if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    #     brew install popt
    # elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    #    sudo apt-get update
    #    sudo apt-get install -y autoconf automake libpopt-dev libtool make xz-utils
    # fi

    # # Remove old app dir if any
    # rm -rf "${AP_SOFT_DIR}/logrotate"
    # rm -rf "${AP_TMP_DIR}/logrotate"

    # # Install logrotate
    # mkdir -p "${AP_TMP_DIR}/logrotate"
    # cd "${AP_TMP_DIR}/logrotate"

    # curl -SL \
    #     "$(curl --silent https://api.github.com/repos/logrotate/logrotate/releases | jq -r '.[0].assets[].browser_download_url' | grep "tar.gz" | grep -v "asc")" >logrotate.tar.gz

    # tar -zxf logrotate.tar.gz
    # rm -f logrotate.tar.gz
    # mv logrotate* logrotate
    # mv logrotate "${AP_SOFT_DIR}/"
    # cd "${AP_SOFT_DIR}/logrotate"
    # autoreconf -fiv # autoreconf is optional if you obtained source from tarball
    # ./configure
    # make
    # sudo make install

    apinitlogrotate
    if alias apcreatedirstructlogrotate &>/dev/null; then
        apcreatedirstructlogrotate
    fi
}

alias aprmlogrotate="ap_func_rm_logrotate"
ap_func_rm_logrotate() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove logrotate
        rm -rf /usr/local/etc/logrotate.d
        rm -f /usr/local/etc/logrotate.conf
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y logrotate
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructlogrotate &>/dev/null; then
        aprmdirstructlogrotate
    fi

    if alias aprmglobalsymlinklogrotate &>/dev/null; then
        aprmglobalsymlinklogrotate
    fi
}
