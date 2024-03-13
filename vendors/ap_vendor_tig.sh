alias apinittig="ap_func_init_tig"
ap_func_init_tig() {
    apaddpath -m "${AP_SOFT_DIR}/tig/share/man"

    if alias apinittigshare &>/dev/null; then
        apinittigshare
    fi

    if alias apinittigcommon &>/dev/null; then
        apinittigcommon
    fi
}

alias apcreatedirstructtig="ap_func_create_dirstruct_tig"
ap_func_create_dirstruct_tig() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/tig] to [${AP_SOFT_DIR}/tig/bin/tig]\n"
    ln -sf "${AP_SOFT_DIR}/tig/bin/tig" "${AP_SOFT_DIR}/bin/tig"

    if alias apcreatedirstructtigshare &>/dev/null; then
        apcreatedirstructtigshare
    fi

    if alias apcreatedirstructtigcommon &>/dev/null; then
        apcreatedirstructtigcommon
    fi
}

alias aprmdirstructtig="ap_func_rm_dirstruct_tig"
ap_func_rm_dirstruct_tig() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/tig]\n"
    rm -f "${AP_SOFT_DIR}/bin/tig"

    if alias aprmdirstructtigshare &>/dev/null; then
        aprmdirstructtigshare
    fi

    if alias aprmdirstructtigcommon &>/dev/null; then
        aprmdirstructtigcommon
    fi
}

alias apsetuptig="ap_func_setup_tig"
ap_func_setup_tig() {
    # https://github.com/jonas/tig
    aplogshow "Install [tig]\n"

    rm -rf "${AP_TMP_DIR}/tig"
    rm -rf "${AP_SOFT_DIR}/tig"

    # Install tig
    mkdir -p "${AP_TMP_DIR}/tig"
    cd "${AP_TMP_DIR}/tig"
    # curl -SL \
    #     "$(curl --silent https://api.github.com/repos/jonas/tig/releases | jq -r '.[0].assets[].browser_download_url' | grep ".tar.gz$")" >tig.tar.gz
    # tar -zxf tig.tar.gz
    # rm -f tig.tar.gz
    # mv tig* tig

    # mv tig "${AP_SOFT_DIR}/"

    git clone https://github.com/jonas/tig
    cd "tig"
    make
    # make install # $HOME/bin
    make install prefix="${AP_SOFT_DIR}/tig"
    make install-release-doc prefix="${AP_SOFT_DIR}/tig"
    # make install-release-doc # documentation can be installed from the release, no need to install dependent libraries
    # sudo make install prefix=/usr/local
    # make install-doc # require `asciidoc` and `xmlto`. Use `pip` to install this lib

    cd "${AP_SOFT_DIR}/tig"
    rm -rf "${AP_TMP_DIR}/tig"

    apinittig
    if alias apcreatedirstructtig &>/dev/null; then
        apcreatedirstructtig
    fi
}

alias aprmtig="ap_func_rm_tig"
ap_func_rm_tig() {
    aplogshow "Remove [tig]\n"

    cd "${AP_SOFT_DIR}/tig"
    make
    make uninstall

    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_SOFT_DIR}/tig"

    if alias aprmdirstructtig &>/dev/null; then
        aprmdirstructtig
    fi

    if alias aprmglobalsymlinktig &>/dev/null; then
        aprmglobalsymlinktig
    fi
}
