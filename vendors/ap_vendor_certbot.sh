alias @initcertbot="ap_func_init_certbot"
ap_func_init_certbot() {
    alias @zsccertbot="cd \${AP_SCRIPTO_COMMON_DIR}/vendors/certbot"
    alias @certbotinstallapache="sudo certbot --apache --verbose"
    alias @certbotinstallnginx="sudo certbot --nginx --verbose"
    alias @zletsencrypt="cd /etc/letsencrypt"

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

alias @renewsslcert="ap_func_certbot_renew"

# @$func $$ ap_func_certbot_renew {
# ap_func_certbot_renew <subdomain> <domain>
# Description
# 	Create or renew SSL certs for the subdomain of domain
# Parameters
# 	subdomain	Sub domain
#	domain		Root domain
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_certbot_renew() {
    local ap_domain="${1:-}"
    local ap_subdomain="${2:-}"

    sudo rm -rf /etc/letsencrypt.bak
    sudo cp -r /etc/letsencrypt /etc/letsencrypt.bak

    sudo rm -rf /etc/nginx/conf.d.bak
    sudo cp -r /etc/nginx/conf.d /etc/nginx/conf.d.bak

    # if [ -n "${ap_subdomain}" ]; then
    #     sudo rm -rf "/etc/letsencrypt/archive/${ap_subdomain}.${ap_domain}"
    #     sudo rm -rf "/etc/letsencrypt/live/${ap_subdomain}.${ap_domain}"
    # else
    #     sudo rm -rf "/etc/letsencrypt/archive/${ap_domain}"
    #     sudo rm -rf "/etc/letsencrypt/live/${ap_domain}"
    # fi

    # sudo rm -rf /etc/letsencrypt/renewal/*

    if [ -d "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew" ]; then
        sudo rm -rf /etc/nginx/renew
        sudo mkdir -p /etc/nginx/renew.d
        sudo cp -R "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew" /etc/nginx/
        sudo mv /etc/nginx/conf.d /etc/nginx/conf.d.bak
        sudo cp -R /etc/nginx/renew /etc/nginx/conf.d

        # sudo rm -f /etc/nginx/conf.d/renew_*.conf
        # sudo cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew"/*.conf /etc/nginx/conf.d/
        # sudo systemctl restart nginx
    fi

    sudo certbot --nginx

    # if [ -d "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d/${ap_domain}" ]; then
    #     sudo rm -f /etc/nginx/conf.d/renew_*.conf
    #     sudo cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d/${ap_domain}"/*.conf /etc/nginx/conf.d/
    #     sudo systemctl restart nginx
    # fi

    @retsuccess
}
