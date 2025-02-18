alias apinitgdu="ap_func_init_gdu"
ap_func_init_gdu() {
    alias gdunodelete='gdu --no-delete'
    alias gdudisks='gdu -d'
    alias gduignoreregex='gdu -I'
    alias gduignorepaths='gdu -i'
    alias gdutotalusage='gdu -nps'
    alias gdutoplargestfiles='gdu -nt'

    if alias apinitgdushare &>/dev/null; then
        apinitgdushare
    fi

    if alias apinitgducommon &>/dev/null; then
        apinitgducommon
    fi

    if alias apinitgdumain &>/dev/null; then
        apinitgdumain
    fi
}

alias apcreatedirstructgdu="ap_func_create_dirstruct_gdu"
ap_func_create_dirstruct_gdu() {
    if [ -f "${HOME}/scripto-share/vendors/gdu/gdu.yaml" ]; then
        aplogshow "Create symlink from [${HOME}/.config/gdu/gdu.yaml] to [${HOME}/scripto-share/vendors/gdu/gdu.yaml]\n"
        mkdir -p ~/.config/gdu
        ln -sf "${HOME}/scripto-share/vendors/gdu/gdu.yaml" "${HOME}/.config/gdu/gdu.yaml"
    fi

    if alias apcreatedirstructgdushare &>/dev/null; then
        apcreatedirstructgdushare
    fi

    if alias apcreatedirstructgducommon &>/dev/null; then
        apcreatedirstructgducommon
    fi

    if alias apcreatedirstructgdumain &>/dev/null; then
        apcreatedirstructgdumain
    fi
}

alias aprmdirstructgdu="ap_func_rm_dirstruct_gdu"
ap_func_rm_dirstruct_gdu() {
    aplogshow "Remove [${HOME}/.config/gdu/]\n"
    rm -f "${HOME}/.config/gdu/"

    if alias aprmdirstructgdushare &>/dev/null; then
        aprmdirstructgdushare
    fi

    if alias aprmdirstructgducommon &>/dev/null; then
        aprmdirstructgducommon
    fi

    if alias aprmdirstructgdumain &>/dev/null; then
        aprmdirstructgdumain
    fi
}

alias apcreateglobalsymlinkgdu="ap_func_create_global_symlink_gdu"
ap_func_create_global_symlink_gdu() {
    if [ -f "${AP_SOFT_DIR}/bin/gdu" ]; then
        aplogshow "Create symlink from [/usr/local/bin/gdu] to [${AP_SOFT_DIR}/bin/gdu]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/gdu" "/usr/local/bin/gdu"
    fi
}

alias aprmglobalsymlinkgdu="ap_func_rm_global_symlink_gdu"
ap_func_rm_global_symlink_gdu() {
    if [ -f "/usr/local/bin/gdu" ]; then
        aplogshow "Remove [/usr/local/bin/gdu]\n"
        sudo rm -f "/usr/local/bin/gdu"
    fi
}

alias apsetupgdu="ap_func_setup_gdu"
ap_func_setup_gdu() {
    aplogshow "Install [gdu]\n"

    # Remove old app if any
    rm -f "${AP_SOFT_DIR}/bin/gdu"
    cd "${AP_SOFT_DIR}/bin"

    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_darwin_arm64.tgz | tar xz
            chmod +x gdu_darwin_arm64
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_darwin_amd64.tgz | tar xz
            chmod +x gdu_darwin_amd64
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
        chmod +x gdu_linux_amd64
    fi

    mv gdu_* gdu

    apinitgdu
    apcreateglobalsymlinkgdu

    if alias apcreatedirstructgdu &>/dev/null; then
        apcreatedirstructgdu
    fi
}

alias aprmgdu="ap_func_rm_gdu"
ap_func_rm_gdu() {
    aplogshow "Remove [gdu]\n"

    rm -f "${AP_SOFT_DIR}/bin/gdu"

    if alias aprmdirstructgdu &>/dev/null; then
        aprmdirstructgdu
    fi

    if alias aprmglobalsymlinkgdu &>/dev/null; then
        aprmglobalsymlinkgdu
    fi
}
