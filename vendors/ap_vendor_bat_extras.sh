alias @initbatextras="ap_func_init_bat_extras"
ap_func_init_bat_extras() {
    @addpath "${AP_SOFT_DIR}/bat-extras/bin"
    eval "$(batpipe)"
    if alias @initbatextrascommon &>/dev/null; then
        @initbatextrascommon
    fi
}

alias @createdirstructbatextras="ap_func_create_dirstruct_bat_extras"
ap_func_create_dirstruct_bat_extras() {
    if alias @createdirstructbatextrascommon &>/dev/null; then
        @createdirstructbatextrascommon
    fi
}

alias @rmdirstructbatextras="ap_func_remove_dirstruct_bat_extras"
ap_func_remove_dirstruct_bat_extras() {
    if alias @rmdirstructbatextrascommon &>/dev/null; then
        @rmdirstructbatextrascommon
    fi
}

alias @setupbatextras="ap_func_setup_bat_extras"
ap_func_setup_bat_extras() {
    # https://github.com/eth-p/bat-extras
    # Dependencies: shfmt, ripgrep, bat, git-delta
    @logshow "Install [bat_extras]\n"

    rm -rf "${AP_SOFT_DIR}/bat-extras"
    cd "${AP_SOFT_DIR}"
    git clone "https://github.com/eth-p/bat-extras"
    cd "${AP_SOFT_DIR}/bat-extras"
    ./build.sh --minify=none
    # ./build.sh --minify=none --install --prefix=/usr/local/bin # global install

    @initbatextras

    if alias @createdirstructbatextras &>/dev/null; then
        @createdirstructbatextras
    fi
}

alias @rmbatextras="ap_func_remove_bat_extras"
ap_func_remove_bat_extras() {
    @logshow "Remove [bat extras]\n"
    rm -rf "${AP_SOFT_DIR}/bat-extras"

    if alias @rmdirstructbatextras &>/dev/null; then
        @rmdirstructbatextras
    fi

    if alias @rmglobalsymlinkbatextras &>/dev/null; then
        @rmglobalsymlinkbatextras
    fi
}
