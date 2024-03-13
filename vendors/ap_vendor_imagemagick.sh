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

alias aprmdirstructimagemagick="ap_func_rm_dirstruct_imagemagick"
ap_func_rm_dirstruct_imagemagick() {
    if alias aprmdirstructimagemagickshare &>/dev/null; then
        aprmdirstructimagemagickshare
    fi

    if alias aprmdirstructimagemagickcommon &>/dev/null; then
        aprmdirstructimagemagickcommon
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

alias aprmimagemagick="ap_func_rm_imagemagick"
ap_func_rm_imagemagick() {
    # https://imagemagick.org/script/download.php
    aplogshow "Remove [imagemagick]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall imagemagick
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y imagemagick
        sudo apt autoremove -y
    fi

    if alias aprmdirstructimagemagick &>/dev/null; then
        aprmdirstructimagemagick
    fi

    if alias aprmglobalsymlinkimagemagick &>/dev/null; then
        aprmglobalsymlinkimagemagick
    fi
}
