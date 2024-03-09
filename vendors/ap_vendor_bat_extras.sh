alias apinitbatextras="ap_func_init_bat_extras"
ap_func_init_bat_extras() {
    apaddpath "${AP_SOFT_DIR}/bat-extras/bin"
    eval "$(batpipe)"

    if alias apinitbatextrasshare &>/dev/null; then
        apinitbatextrasshare
    fi

    if alias apinitbatextrascommon &>/dev/null; then
        apinitbatextrascommon
    fi
}

alias apcreatedirstructbatextras="ap_func_create_dirstruct_bat_extras"
ap_func_create_dirstruct_bat_extras() {
    if alias apcreatedirstructbatextrasshare &>/dev/null; then
        apcreatedirstructbatextrasshare
    fi

    if alias apcreatedirstructbatextrascommon &>/dev/null; then
        apcreatedirstructbatextrascommon
    fi
}

alias rmdirstructbatextras="ap_func_rm_dirstruct_bat_extras"
ap_func_rm_dirstruct_bat_extras() {
    if alias rmdirstructbatextrasshare &>/dev/null; then
        rmdirstructbatextrasshare
    fi

    if alias rmdirstructbatextrascommon &>/dev/null; then
        rmdirstructbatextrascommon
    fi
}

alias apsetupbatextras="ap_func_setup_bat_extras"
ap_func_setup_bat_extras() {
    # https://github.com/eth-p/bat-extras
    # Dependencies: shfmt, ripgrep, bat, git-delta
    aplogshow "Install [bat_extras]\n"

    rm -rf "${AP_SOFT_DIR}/bat-extras"
    cd "${AP_SOFT_DIR}"
    git clone "https://github.com/eth-p/bat-extras"
    cd "${AP_SOFT_DIR}/bat-extras"
    ./build.sh --minify=none
    # ./build.sh --minify=none --install --prefix=/usr/local/bin # global install

    apinitbatextras

    if alias apcreatedirstructbatextras &>/dev/null; then
        apcreatedirstructbatextras
    fi
}

alias rmbatextras="ap_func_rm_bat_extras"
ap_func_rm_bat_extras() {
    aplogshow "Remove [bat extras]\n"
    rm -rf "${AP_SOFT_DIR}/bat-extras"

    if alias rmdirstructbatextras &>/dev/null; then
        rmdirstructbatextras
    fi

    if alias rmglobalsymlinkbatextras &>/dev/null; then
        rmglobalsymlinkbatextras
    fi
}
