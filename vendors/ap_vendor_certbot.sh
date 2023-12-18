alias @initcertbot="ap_func_init_certbot"
ap_func_init_certbot() {
    if alias @initcertbotcommon &>/dev/null; then
        @initcertbotcommon
    fi
}

alias @createdirstructcertbot="ap_func_create_dirstruct_certbot"
ap_func_create_dirstruct_certbot() {
    if alias @createdirstructcertbotcommon &>/dev/null; then
        @createdirstructcertbotcommon
    fi
}

alias @rmdirstructcertbot="ap_func_remove_dirstruct_certbot"
ap_func_remove_dirstruct_certbot() {
    if alias @rmdirstructcertbotcommon &>/dev/null; then
        @rmdirstructcertbotcommon
    fi
}

alias @createglobalsymlinkcertbot="ap_func_create_global_symlink_certbot"
ap_func_create_global_symlink_certbot() {
    if [ -f "/usr/bin/certbot" ]; then
        @logshow "Create symlink from [/snap/bin/certbot] to [/usr/bin/certbot]\n"
        sudo ln -sf "/snap/bin/certbot" "/usr/bin/certbot"
    fi
}

alias @rmglobalsymlinkcertbot="ap_func_remove_global_symlink_certbot"
ap_func_remove_global_symlink_certbot() {
    if [ -f "/usr/bin/certbot" ]; then
        @logshow "Remove [/usr/bin/certbot]\n"
        sudo rm -f "/usr/bin/certbot"
    fi
}

alias @setupcertbot="ap_func_setup_certbot"
ap_func_setup_certbot() {
    # https://eff-certbot.readthedocs.io/en/stable/install.html
    # https://certbot.eff.org/instructions?ws=apache&os=ubuntufocal

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        @logshow "Install [certbot]\n"
        sudo snap install core
        sudo snap refresh core
        sudo apt purge -y certbot
        sudo snap install --classic certbot
    fi

    if alias @createdirstructcertbot &>/dev/null; then
        @createdirstructcertbot
    fi

    if alias @createglobalsymlinkcertbot &>/dev/null; then
        @createglobalsymlinkcertbot
    fi
}

alias @rmcertbot="ap_func_remove_certbot"
ap_func_remove_certbot() {
    @logshow "Remove [certbot]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge certbot
        sudo rm -f /usr/bin/certbot
        sudo rm -f /bin/certbot
    fi

    if alias @rmdirstructcertbot &>/dev/null; then
        @rmdirstructcertbot
    fi

    if alias @rmglobalsymlinkcertbot &>/dev/null; then
        @rmglobalsymlinkcertbot
    fi
}
