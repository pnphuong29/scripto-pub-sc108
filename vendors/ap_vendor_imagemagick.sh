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
}

alias @rmimagemagick="ap_func_remove_imagemagick"
ap_func_remove_imagemagick() {
    # https://imagemagick.org/script/download.php
    @logshow "Remove [imagemagick]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall imagemagick
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y imagemagick
        sudo apt autoremove -y
    fi
}
