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

alias aprmdirstructbatextras="ap_func_rm_dirstruct_bat_extras"
ap_func_rm_dirstruct_bat_extras() {
    if alias aprmdirstructbatextrasshare &>/dev/null; then
        aprmdirstructbatextrasshare
    fi

    if alias aprmdirstructbatextrascommon &>/dev/null; then
        aprmdirstructbatextrascommon
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

alias aprmbatextras="ap_func_rm_bat_extras"
ap_func_rm_bat_extras() {
    aplogshow "Remove [bat extras]\n"
    rm -rf "${AP_SOFT_DIR}/bat-extras"

    if alias aprmdirstructbatextras &>/dev/null; then
        aprmdirstructbatextras
    fi

    if alias aprmglobalsymlinkbatextras &>/dev/null; then
        aprmglobalsymlinkbatextras
    fi
}
