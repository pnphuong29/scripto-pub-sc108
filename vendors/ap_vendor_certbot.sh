alias @initcertbot="ap_func_init_certbot"
ap_func_init_certbot() {
    alias zsccertbot="cd \${AP_SCRIPTO_COMMON_DIR}/vendors/certbot"
    alias certbotinstallapache="sudo certbot --apache --verbose"
    alias certbotinstallnginx="sudo certbot --nginx --verbose"
    alias zletsencrypt="cd /etc/letsencrypt"

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

alias gensslcerts="ap_func_certbot_generate_certs"
# @$func $$ ap_func_certbot_generate_certs {
# ap_func_certbot_generate_certs
# Description
# 	Generate or renew SSL certs
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_certbot_generate_certs() {
    sudo rm -rf /etc/letsencrypt.bak
    sudo cp -R /etc/letsencrypt /etc/letsencrypt.bak

    sudo rm -rf /etc/nginx/conf.d.bak
    sudo cp -R /etc/nginx/conf.d /etc/nginx/conf.d.bak

    if [ -d "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew" ]; then
        sudo rm -rf /etc/nginx/conf.d
        sudo mkdir -p /etc/nginx/conf.d
        sudo cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew"/*.conf /etc/nginx/conf.d/
    fi

    sudo certbot --nginx

    sudo rm -rf /etc/nginx/conf.d
    sudo cp -R /etc/nginx/conf.d.bak /etc/nginx/conf.d
    sudo cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d"/*.conf /etc/nginx/conf.d/

    @ret_success
}

alias bksslcerts="ap_func_certbot_backup"
# @$func $$ ap_func_certbot_backup {
# ap_func_certbot_backup
# Description
# 	Backup SSL certs
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_certbot_backup() {
    if [ ! -d "${AP_SCRIPTO_COMMON_DIR}/sslcerts" ]; then
        mkdir -p "${AP_SCRIPTO_COMMON_DIR}/sslcerts"/{archive,live}
    fi

    sudo cp -R /etc/letsencrypt/archive/ "${AP_SCRIPTO_COMMON_DIR}/sslcerts/archive/"
    sudo cp -R /etc/letsencrypt/live/ "${AP_SCRIPTO_COMMON_DIR}/sslcerts/live/"

    @ret_success
}
