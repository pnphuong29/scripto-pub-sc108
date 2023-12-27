alias @initnginx="ap_func_init_nginx"
ap_func_init_nginx() {
    alias nginxrestart='sudo systemctl restart nginx'
    alias nginxreloadconfig='sudo nginx -s reload'
    alias nginxtestconfig='sudo nginx -t'

    alias znginxconfd="cd /etc/nginx/conf.d"
    alias znginxlogs="cd /var/log/nginx"

    alias zscnginxconfigs='cd "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d"'
    alias zscnginxrenewconfigs='cd "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d"'

    alias nginxupdateconfigs='
        sudo cp -f "${AP_SCRIPTO_DIR}/vendors/nginx/conf.d"/*.conf /etc/nginx/conf.d/ \
        sudo cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d"/*.conf /etc/nginx/conf.d/ \
    '
    alias nginxupdaterenewconfigs='
        sudo cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew"/*.conf /etc/nginx/conf.d/ \
    '

    alias viscnginxrenewconfigs='vi -p \
        "${AP_SCRIPTO_DIR}/vendors/ap_vendor_nginx.sh" \
        "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/renew"/*.conf \
	'
    alias viscnginxconfigs='vi -p \
        "${AP_SCRIPTO_DIR}/vendors/ap_vendor_nginx.sh" \
        "${AP_SCRIPTO_COMMON_DIR}/vendors/nginx/conf.d"/*.conf \
	'

    if alias @initnginxcommon &>/dev/null; then
        @initnginxcommon
    fi
}

alias @createdirstructnginx="ap_func_create_dirstruct_nginx"
ap_func_create_dirstruct_nginx() {
    if alias @createdirstructnginxcommon &>/dev/null; then
        @createdirstructnginxcommon
    fi
}

alias @rmdirstructnginx="ap_func_remove_dirstruct_nginx"
ap_func_remove_dirstruct_nginx() {
    if alias @rmdirstructnginxcommon &>/dev/null; then
        @rmdirstructnginxcommon
    fi
}

alias @createglobalsymlinknginx="ap_func_create_global_symlink_nginx"
ap_func_create_global_symlink_nginx() {
    if [ -f "${AP_SOFT_DIR}/nginx/nginx" ]; then
        @logshow "Create symlink from [/usr/local/bin/nginx] to [${AP_SOFT_DIR}/nginx/nginx]\n"
        sudo ln -sf "${AP_SOFT_DIR}/nginx/nginx" "/usr/local/bin/nginx"
    fi
}

alias @rmglobalsymlinknginx="ap_func_remove_global_symlink_nginx"
ap_func_remove_global_symlink_nginx() {
    if [ -f "/usr/local/bin/nginx" ]; then
        @logshow "Remove [/usr/local/bin/nginx]\n"
        sudo rm -f "/usr/local/bin/nginx"
    fi
}

alias @setupnginx="ap_func_setup_nginx"
ap_func_setup_nginx() {
    # https://nginx.org/en/linux_packages.html
    @logshow "Install [nginx]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install nginx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install required libraries
        @logshow "Install required libraries [curl, gnupg2, ca-certificates, lsb-release, ubuntu-keyring]\n"
        sudo apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring

        # Import an official nginx signing key so apt could verify the packages authenticity. Fetch the key
        curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

        # Verify that the downloaded file contains the proper key
        gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

        @minfo "Output should be as followings\n"
        @minfo "pub   	rsa2048 2011-08-19 [SC] [expires: 2024-06-14]\n
						573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62\n
				uid		nginx signing key <signing-keynginx.co\n"

        # Set up the apt repository for stable nginx packages
        echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
                http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

        # Install nginx
        sudo apt update
        sudo apt install -y nginx
    fi

    if alias @createdirstructnginx &>/dev/null; then
        @createdirstructnginx
    fi
}

alias @rmnginx="ap_func_remove_nginx"
ap_func_remove_nginx() {
    @logshow "Remove [nginx]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall nginx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y nginx
        sudo apt autoremove -y
    fi

    if alias @rmdirstructnginx &>/dev/null; then
        @rmdirstructnginx
    fi
}
