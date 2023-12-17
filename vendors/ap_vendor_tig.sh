alias @inittig="ap_func_init_tig"
ap_func_init_tig() {
    @addpath -m "${AP_SOFT_DIR}/tig/share/man"
    if alias @inittigcommon &>/dev/null; then
        @inittigcommon
    fi
}

alias @createdirstructtig="ap_func_create_dirstruct_tig"
ap_func_create_dirstruct_tig() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/tig] to [${AP_SOFT_DIR}/tig/bin/tig]\n"
    ln -sf "${AP_SOFT_DIR}/tig/bin/tig" "${AP_SOFT_DIR}/bin/tig"
    if alias @createdirstructtigcommon &>/dev/null; then
        @createdirstructtigcommon
    fi
}

alias @rmdirstructtig="ap_func_remove_dirstruct_tig"
ap_func_remove_dirstruct_tig() {
    rm -f "${AP_SOFT_DIR}/bin/tig"
    if alias @rmdirstructtigcommon &>/dev/null; then
        @rmdirstructtigcommon
    fi
}

alias @setuptig="ap_func_setup_tig"
ap_func_setup_tig() {
    # https://github.com/jonas/tig
    @logshow "Install [tig]\n"

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

    if alias @createdirstructtig &>/dev/null; then
        @createdirstructtig
    fi
}

alias @rmtig="ap_func_remove_tig"
ap_func_remove_tig() {
    @logshow "Remove [tig]\n"

    cd "${AP_SOFT_DIR}/tig"
    make
    make uninstall
    rm -rf "${AP_SOFT_DIR}/tig"

    if alias @rmdirstructtig &>/dev/null; then
        @rmdirstructtig
    fi
}
