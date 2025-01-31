alias apinitless="ap_func_init_less"
ap_func_init_less() {
    export AP_LESS_SETUP_VERSION='668'

    if alias apinitlessshare &>/dev/null; then
        apinitlessshare
    fi

    if alias apinitlesscommon &>/dev/null; then
        apinitlesscommon
    fi

    if alias apinitlessmain &>/dev/null; then
        apinitlessmain
    fi
}

alias apcreatedirstructless="ap_func_create_dirstruct_less"
ap_func_create_dirstruct_less() {
    if alias apcreatedirstructlessshare &>/dev/null; then
        apcreatedirstructlessshare
    fi

    if alias apcreatedirstructlesscommon &>/dev/null; then
        apcreatedirstructlesscommon
    fi

    if alias apcreatedirstructlessmain &>/dev/null; then
        apcreatedirstructlessmain
    fi
}

alias aprmdirstructless="ap_func_rm_dirstruct_less"
ap_func_rm_dirstruct_less() {
    if alias aprmdirstructlessshare &>/dev/null; then
        aprmdirstructlessshare
    fi

    if alias aprmdirstructlesscommon &>/dev/null; then
        aprmdirstructlesscommon
    fi

    if alias aprmdirstructlessmain &>/dev/null; then
        aprmdirstructlessmain
    fi
}

# alias apcreateglobalsymlinkless="ap_func_create_global_symlink_less"
# ap_func_create_global_symlink_less() {
#     if [ -f "${AP_SOFT_DIR}/bin/less" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/less] to [${AP_SOFT_DIR}/bin/less]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/less" "/usr/local/bin/less"
#     fi
# }

# alias aprmglobalsymlinkless="ap_func_rm_global_symlink_less"
# ap_func_rm_global_symlink_less() {
#     if [ -f "/usr/local/bin/less" ]; then
#         aplogshow "Remove [/usr/local/bin/less]\n"
#         sudo rm -f "/usr/local/bin/less"
#     fi
# }

alias apsetupless="ap_func_setup_less"
ap_func_setup_less() {
    local ap_less_setup_version="${AP_LESS_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_less_setup_version="$1"
    fi

    aplogshow "Install [less] version [${ap_less_setup_version}]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/less"
    rm -rf "${AP_TMP_DIR}/less"

    curl -SL "https://www.greenwoodsoftware.com/less/less-${AP_LESS_SETUP_VERSION}.zip" >less.tar.gz

    tar -zxf less.tar.gz
    rm -f less.tar.gz
    mv less* less
    mv less "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/less"
    ./configure
    make
    sudo make install

    apinitless
    if alias apcreatedirstructless &>/dev/null; then
        apcreatedirstructless
    fi
}

alias aprmless="ap_func_rm_less"
ap_func_rm_less() {
    local ap_less_remove_version="${AP_LESS_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_less_remove_version="$1"
    fi

    aplogshow "Remove [less] v${ap_less_remove_version}\n"

    cd "${AP_SOFT_DIR}/less"
    sudo make uninstall
    rm -rf "${AP_SOFT_DIR}/less"

    if alias aprmdirstructless &>/dev/null; then
        aprmdirstructless
    fi

    if alias aprmglobalsymlinkless &>/dev/null; then
        aprmglobalsymlinkless
    fi
}
