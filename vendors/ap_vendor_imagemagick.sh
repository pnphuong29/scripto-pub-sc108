alias apinitimagemagick="ap_func_init_imagemagick"
ap_func_init_imagemagick() {
    if alias apinitimagemagickshare &>/dev/null; then
        apinitimagemagickshare
    fi

    if alias apinitimagemagickcommon &>/dev/null; then
        apinitimagemagickcommon
    fi
}

alias apcreatedirstructimagemagick="ap_func_create_dirstruct_imagemagick"
ap_func_create_dirstruct_imagemagick() {
    if alias apcreatedirstructimagemagickshare &>/dev/null; then
        apcreatedirstructimagemagickshare
    fi

    if alias apcreatedirstructimagemagickcommon &>/dev/null; then
        apcreatedirstructimagemagickcommon
    fi
}

alias rmdirstructimagemagick="ap_func_rm_dirstruct_imagemagick"
ap_func_rm_dirstruct_imagemagick() {
    if alias rmdirstructimagemagickshare &>/dev/null; then
        rmdirstructimagemagickshare
    fi

    if alias rmdirstructimagemagickcommon &>/dev/null; then
        rmdirstructimagemagickcommon
    fi
}

alias apsetupimagemagick="ap_func_setup_imagemagick"
ap_func_setup_imagemagick() {
    # https://imagemagick.org/script/download.php
    aplogshow "Install [imagemagick]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install imagemagick
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y imagemagick
    fi

    apinitimagemagick
    if alias apcreatedirstructimagemagick &>/dev/null; then
        apcreatedirstructimagemagick
    fi
}

alias rmimagemagick="ap_func_rm_imagemagick"
ap_func_rm_imagemagick() {
    # https://imagemagick.org/script/download.php
    aplogshow "Remove [imagemagick]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall imagemagick
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y imagemagick
        sudo apt autoremove -y
    fi

    if alias rmdirstructimagemagick &>/dev/null; then
        rmdirstructimagemagick
    fi

    if alias rmglobalsymlinkimagemagick &>/dev/null; then
        rmglobalsymlinkimagemagick
    fi
}
