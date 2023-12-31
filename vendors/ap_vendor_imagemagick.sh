alias @initimagemagick="ap_func_init_imagemagick"
ap_func_init_imagemagick() {
    if alias @initimagemagickshare &>/dev/null; then
        @initimagemagickshare
    fi

    if alias @initimagemagickcommon &>/dev/null; then
        @initimagemagickcommon
    fi
}

alias @createdirstructimagemagick="ap_func_create_dirstruct_imagemagick"
ap_func_create_dirstruct_imagemagick() {
    if alias @createdirstructimagemagickshare &>/dev/null; then
        @createdirstructimagemagickshare
    fi

    if alias @createdirstructimagemagickcommon &>/dev/null; then
        @createdirstructimagemagickcommon
    fi
}

alias @rmdirstructimagemagick="ap_func_rm_dirstruct_imagemagick"
ap_func_rm_dirstruct_imagemagick() {
    if alias @rmdirstructimagemagickshare &>/dev/null; then
        @rmdirstructimagemagickshare
    fi

    if alias @rmdirstructimagemagickcommon &>/dev/null; then
        @rmdirstructimagemagickcommon
    fi
}

alias @setupimagemagick="ap_func_setup_imagemagick"
ap_func_setup_imagemagick() {
    # https://imagemagick.org/script/download.php
    @logshow "Install [imagemagick]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install imagemagick
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y imagemagick
    fi

    @initimagemagick
    if alias @createdirstructimagemagick &>/dev/null; then
        @createdirstructimagemagick
    fi
}

alias @rmimagemagick="ap_func_rm_imagemagick"
ap_func_rm_imagemagick() {
    # https://imagemagick.org/script/download.php
    @logshow "Remove [imagemagick]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall imagemagick
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y imagemagick
        sudo apt autoremove -y
    fi

    if alias @rmdirstructimagemagick &>/dev/null; then
        @rmdirstructimagemagick
    fi

    if alias @rmglobalsymlinkimagemagick &>/dev/null; then
        @rmglobalsymlinkimagemagick
    fi
}
