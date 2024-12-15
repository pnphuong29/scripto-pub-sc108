alias apinitnginxloganalyzer="ap_func_init_nginx_log_analyzer"
ap_func_init_nginx_log_analyzer() {
    if alias apinitnginxloganalyzershare &>/dev/null; then
        apinitnginxloganalyzershare
    fi

    if alias apinitnginxloganalyzercommon &>/dev/null; then
        apinitnginxloganalyzercommon
    fi

    if alias apinitnginxloganalyzermain &>/dev/null; then
        apinitnginxloganalyzermain
    fi
}

alias apcreatedirstructnginxloganalyzer="ap_func_create_dirstruct_nginx_log_analyzer"
ap_func_create_dirstruct_nginx_log_analyzer() {
    if alias apcreatedirstructnginxloganalyzershare &>/dev/null; then
        apcreatedirstructnginxloganalyzershare
    fi

    if alias apcreatedirstructnginxloganalyzercommon &>/dev/null; then
        apcreatedirstructnginxloganalyzercommon
    fi

    if alias apcreatedirstructnginxloganalyzermain &>/dev/null; then
        apcreatedirstructnginxloganalyzermain
    fi
}

alias aprmdirstructnginxloganalyzer="ap_func_rm_dirstruct_nginx_log_analyzer"
ap_func_rm_dirstruct_nginx_log_analyzer() {
    if alias aprmdirstructnginxloganalyzershare &>/dev/null; then
        aprmdirstructnginxloganalyzershare
    fi

    if alias aprmdirstructnginxloganalyzercommon &>/dev/null; then
        aprmdirstructnginxloganalyzercommon
    fi

    if alias aprmdirstructnginxloganalyzermain &>/dev/null; then
        aprmdirstructnginxloganalyzermain
    fi
}

alias apcreateglobalsymlinknginxloganalyzer="ap_func_create_global_symlink_nginx_log_analyzer"
ap_func_create_global_symlink_nginx_log_analyzer() {
    if [ -f "${AP_SOFT_DIR}/bin/nginx-log-analyzer" ]; then
        aplogshow "Create symlink from [/usr/local/bin/nginx-log-analyzer] to [${AP_SOFT_DIR}/bin/nginx-log-analyzer]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/nginx-log-analyzer" "/usr/local/bin/nginx-log-analyzer"
    fi
}

alias aprmglobalsymlinknginxloganalyzer="ap_func_rm_global_symlink_nginx_log_analyzer"
ap_func_rm_global_symlink_nginx_log_analyzer() {
    if [ -f "/usr/local/bin/nginx-log-analyzer" ]; then
        aplogshow "Remove [/usr/local/bin/nginx-log-analyzer]\n"
        sudo rm -f "/usr/local/bin/nginx-log-analyzer"
    fi
}

alias apsetupnginxloganalyzer="ap_func_setup_nginx_log_analyzer"
ap_func_setup_nginx_log_analyzer() {
    aplogshow "Install [nginx-log-analyzer]\n"

    # Remove old app dir if any
    rm -f "${AP_SOFT_DIR}/bin/nginx-log-analyzer"
    rm -rf "${AP_TMP_DIR}/nginx-log-analyzer"

    # Install nginx_log_analyzer
    mkdir -p "${AP_TMP_DIR}/nginx-log-analyzer"
    cd "${AP_TMP_DIR}/nginx-log-analyzer"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/fantasticmao/nginx-log-analyzer/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep arm)" >nginx-log-analyzer
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/fantasticmao/nginx-log-analyzer/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep amd)" >nginx-log-analyzer
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/fantasticmao/nginx-log-analyzer/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep amd64)" >nginx-log-analyzer
    fi

    chmod +x nginx-log-analyzer
    mv nginx-log-analyzer "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}/bin"
    rm -rf "${AP_TMP_DIR}/nginx-log-analyzer"

    apinitnginxloganalyzer
    apcreateglobalsymlinknginxloganalyzer
    if alias apcreatedirstructnginxloganalyzer &>/dev/null; then
        apcreatedirstructnginxloganalyzer
    fi
}

alias aprmnginxloganalyzer="ap_func_rm_nginx_log_analyzer"
ap_func_rm_nginx_log_analyzer() {
    aplogshow "Remove [nginx-log-analyzer]\n"
    rm -f "${AP_SOFT_DIR}/bin/nginx-log-analyzer"

    if alias aprmdirstructnginxloganalyzer &>/dev/null; then
        aprmdirstructnginxloganalyzer
    fi

    if alias aprmglobalsymlinknginxloganalyzer &>/dev/null; then
        aprmglobalsymlinknginxloganalyzer
    fi
}
