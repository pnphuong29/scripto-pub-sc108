alias apinitnginx="ap_func_init_nginx"
ap_func_init_nginx() {
    alias rrnginx='sudo systemctl restart nginx'
    alias ssnginx='sudo systemctl status nginx'

    alias nginxreloadconfig='sudo nginx -s reload'
    alias nginxtestconfig='sudo nginx -t'

    alias znginx="cd /etc/nginx"
    alias znginxconfd="cd /etc/nginx/conf.d"
    alias znginxlogs="cd /var/log/nginx"

    alias zscnginxconfigs='cd "${HOME}/scripto-common/vendors/nginx/conf.d"'
    alias zsrnginxconfigs='cd "${HOME}/scripto-share/vendors/nginx/conf.d"'
    alias zsmnginxconfigs='cd "${HOME}/scripto-main/vendors/nginx/conf.d"'

    alias zsrnginxrenewconfigs='cd "${HOME}/scripto-share/vendors/nginx/conf.d"'
    alias zscnginxrenewconfigs='cd "${HOME}/scripto-common/vendors/nginx/conf.d"'
    alias zsmnginxrenewconfigs='cd "${HOME}/scripto-main/vendors/nginx/conf.d"'

    alias viscnginxrenewconfigs='vi -p \
        "${HOME}/scripto/vendors/ap_vendor_nginx.sh" \
        "${HOME}/scripto-common/vendors/nginx/renew"/*.conf \
	'
    alias viscnginxconfigs='vi -p \
        "${HOME}/scripto/vendors/ap_vendor_nginx.sh" \
        "${HOME}/scripto-common/vendors/nginx/conf.d"/*.conf \
	'

    if alias apinitnginxshare &>/dev/null; then
        apinitnginxshare
    fi

    if alias apinitnginxcommon &>/dev/null; then
        apinitnginxcommon
    fi
}

alias apcreatedirstructnginx="ap_func_create_dirstruct_nginx"
ap_func_create_dirstruct_nginx() {
    if alias apcreatedirstructnginxshare &>/dev/null; then
        apcreatedirstructnginxshare
    fi

    if alias apcreatedirstructnginxcommon &>/dev/null; then
        apcreatedirstructnginxcommon
    fi
}

alias aprmdirstructnginx="ap_func_rm_dirstruct_nginx"
ap_func_rm_dirstruct_nginx() {
    if alias aprmdirstructnginxshare &>/dev/null; then
        aprmdirstructnginxshare
    fi

    if alias aprmdirstructnginxcommon &>/dev/null; then
        aprmdirstructnginxcommon
    fi
}

alias apsetupnginx="ap_func_setup_nginx"
ap_func_setup_nginx() {
    # https://nginx.org/en/linux_packages.html
    aplogshow "Install [nginx]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install nginx
        sudo port install nginx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install required libraries
        aplogshow "Install required libraries [curl, gnupg2, ca-certificates, lsb-release, ubuntu-keyring]\n"
        sudo apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring

        # Import an official nginx signing key so apt could verify the packages authenticity. Fetch the key
        curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

        # Verify that the downloaded file contains the proper key
        gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

        apshowmsginfo "Output should be as followings\n"
        apshowmsginfo "pub   	rsa2048 2011-08-19 [SC] [expires: 2024-06-14]\n
						573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62\n
				uid		nginx signing key <signing-keynginx.co\n"

        # Set up the apt repository for stable nginx packages
        echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
                http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

        # Install nginx
        sudo apt update
        sudo apt install -y nginx
    fi

    apinitnginx
    if alias apcreatedirstructnginx &>/dev/null; then
        apcreatedirstructnginx
    fi
}

alias aprmnginx="ap_func_rm_nginx"
ap_func_rm_nginx() {
    aplogshow "Remove [nginx]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall nginx
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y nginx
        sudo apt autoremove -y
    fi

    if alias aprmdirstructnginx &>/dev/null; then
        aprmdirstructnginx
    fi
}

alias nginxupdateconfigs="ap_func_nginx_update_config"
ap_func_nginx_update_config() {
    local ap_nginx_config_dir="${HOME}/scripto-common/vendors/nginx/conf.d"
    if [ -d "${HOME}/scripto-main/vendors/nginx/conf.d" ]; then
        ap_nginx_config_dir="${HOME}/scripto-main/vendors/nginx/conf.d"
    fi

    sudo cp -f "${HOME}/scripto-share/vendors/nginx/conf.d"/*.conf /etc/nginx/conf.d/
    sudo cp -f "${ap_nginx_config_dir}"/*.conf /etc/nginx/conf.d/
}

alias nginxupdaterenewconfigs="ap_func_nginx_renew_config"
ap_func_nginx_renew_config() {
    local ap_nginx_renew_dir="${HOME}/scripto-common/vendors/nginx/renew"
    if [ -d "${HOME}/scripto-main/vendors/nginx/renew" ]; then
        ap_nginx_renew_dir="${HOME}/scripto-main/vendors/nginx/renew"
    fi

    sudo cp -f "${ap_nginx_renew_dir}"/*.conf /etc/nginx/conf.d/
}
