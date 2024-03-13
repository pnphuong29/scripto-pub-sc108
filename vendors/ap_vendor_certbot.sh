alias apinitcertbot="ap_func_init_certbot"
ap_func_init_certbot() {
    alias zsccertbot="cd \${HOME}/scripto-common/vendors/certbot"
    alias certbotinstallapache="sudo certbot --apache --verbose"
    alias certbotinstallnginx="sudo certbot --nginx --verbose"
    alias zletsencrypt="cd /etc/letsencrypt"

    if alias apinitcertbotshare &>/dev/null; then
        apinitcertbotshare
    fi

    if alias apinitcertbotcommon &>/dev/null; then
        apinitcertbotcommon
    fi
}

alias apcreatedirstructcertbot="ap_func_create_dirstruct_certbot"
ap_func_create_dirstruct_certbot() {
    if alias apcreatedirstructcertbotshare &>/dev/null; then
        apcreatedirstructcertbotshare
    fi

    if alias apcreatedirstructcertbotcommon &>/dev/null; then
        apcreatedirstructcertbotcommon
    fi
}

alias aprmdirstructcertbot="ap_func_rm_dirstruct_certbot"
ap_func_rm_dirstruct_certbot() {
    if alias aprmdirstructcertbotshare &>/dev/null; then
        aprmdirstructcertbotshare
    fi

    if alias aprmdirstructcertbotcommon &>/dev/null; then
        aprmdirstructcertbotcommon
    fi
}

alias apcreateglobalsymlinkcertbot="ap_func_create_global_symlink_certbot"
ap_func_create_global_symlink_certbot() {
    if [ -f "/usr/bin/certbot" ]; then
        aplogshow "Create symlink from [/snap/bin/certbot] to [/usr/bin/certbot]\n"
        sudo ln -sf "/snap/bin/certbot" "/usr/bin/certbot"
    fi
}

alias aprmglobalsymlinkcertbot="ap_func_rm_global_symlink_certbot"
ap_func_rm_global_symlink_certbot() {
    if [ -f "/usr/bin/certbot" ]; then
        aplogshow "Remove [/usr/bin/certbot]\n"
        sudo rm -f "/usr/bin/certbot"
    fi
}

alias apsetupcertbot="ap_func_setup_certbot"
ap_func_setup_certbot() {
    # https://eff-certbot.readthedocs.io/en/stable/install.html
    # https://certbot.eff.org/instructions?ws=apache&os=ubuntufocal

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        aplogshow "Install [certbot]\n"
        sudo snap install core
        sudo snap refresh core
        sudo apt purge -y certbot
        sudo snap install --classic certbot
    fi

    if alias apcreatedirstructcertbot &>/dev/null; then
        apcreatedirstructcertbot
    fi

    if alias apcreateglobalsymlinkcertbot &>/dev/null; then
        apcreateglobalsymlinkcertbot
    fi
}

alias aprmcertbot="ap_func_rm_certbot"
ap_func_rm_certbot() {
    aplogshow "Remove [certbot]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge certbot
        sudo rm -f /usr/bin/certbot
        sudo rm -f /bin/certbot
    fi

    if alias aprmdirstructcertbot &>/dev/null; then
        aprmdirstructcertbot
    fi

    if alias aprmglobalsymlinkcertbot &>/dev/null; then
        aprmglobalsymlinkcertbot
    fi
}
