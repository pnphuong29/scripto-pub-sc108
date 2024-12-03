alias apinitaws="ap_func_init_aws"
ap_func_init_aws() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        complete -C '/usr/local/bin/aws_completer' aws
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        complete -C "${AP_SOFT_DIR}/bin/aws_completer" aws
    fi

    if alias apinitawsshare &>/dev/null; then
        apinitawsshare
    fi

    if alias apinitawscommon &>/dev/null; then
        apinitawscommon
    fi

    if alias apinitawsmain &>/dev/null; then
        apinitawsmain
    fi
}

alias apcreatedirstructaws="ap_func_create_dirstruct_aws"
ap_func_create_dirstruct_aws() {
    if alias apcreatedirstructawsshare &>/dev/null; then
        apcreatedirstructawsshare
    fi

    if alias apcreatedirstructawscommon &>/dev/null; then
        apcreatedirstructawscommon
    fi

    if alias apcreatedirstructawsmain &>/dev/null; then
        apcreatedirstructawsmain
    fi
}

alias aprmdirstructaws="ap_func_rm_dirstruct_aws"
ap_func_rm_dirstruct_aws() {
    if alias aprmdirstructawsshare &>/dev/null; then
        aprmdirstructawsshare
    fi

    if alias aprmdirstructawscommon &>/dev/null; then
        aprmdirstructawscommon
    fi

    if alias aprmdirstructawsmain &>/dev/null; then
        aprmdirstructawsmain
    fi
}

# alias apcreateglobalsymlinkaws="ap_func_create_global_symlink_aws"
# ap_func_create_global_symlink_aws() {
#     if [ -f "${AP_SOFT_DIR}/bin/aws" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/aws] to [${AP_SOFT_DIR}/bin/aws]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/aws" "/usr/local/bin/aws"
#     fi
# }

# alias aprmglobalsymlinkaws="ap_func_rm_global_symlink_aws"
# ap_func_rm_global_symlink_aws() {
#     if [ -f "/usr/local/bin/aws" ]; then
#         aplogshow "Remove [/usr/local/bin/aws]\n"
#         sudo rm -f "/usr/local/bin/aws"
#     fi
# }

alias apsetupaws="ap_func_setup_aws"
ap_func_setup_aws() {
    # https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    aplogshow "Install [aws cli]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/aws"
    rm -rf "${AP_TMP_DIR}/aws"

    # Install aws-cli using python (not recommended due to dependencies conflicts with other python libraries)
    # pip install awscli
    # pip install aws-shell

    # Install aws-cli using bundled installer
    mkdir -p "${AP_TMP_DIR}/aws"
    cd "${AP_TMP_DIR}/aws"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -OL "https://awscli.amazonaws.com/AWSCLIV2.pkg"
        sudo installer -pkg AWSCLIV2.pkg -target /

        # Install plugin session manager
        if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
            if [[ "$(uname -m)" == 'arm64' ]]; then
                curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac_arm64/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
            elif [[ "$(uname -m)" == 'x86_64' ]]; then
                curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "sessionmanager-bundle.zip"
            fi
            unzip sessionmanager-bundle.zip
            sudo ./sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin
        elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
            curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
            sudo dpkg -i session-manager-plugin.deb
        fi

    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -L "https://aws.amazonaws.com/aws-exe-linux-x86_64.zip" -o "awsv2.zip"
        unzip -u awsv2.zip
        # sudo ./aws/install --bin-dir "${AP_SOFT_DIR}/bin" --install-dir "${AP_SOFT_DIR}/aws-cli"
        ./aws/install --bin-dir "${AP_SOFT_DIR}/bin" --install-dir "${AP_SOFT_DIR}/aws-cli" --update
    fi



    cd "${AP_TMP_DIR}"
    rm -rf "${AP_TMP_DIR}/aws"
    apinitaws
    if alias apcreatedirstructaws &>/dev/null; then
        apcreatedirstructaws
    fi
}

alias aprmaws="ap_func_rm_aws"
ap_func_rm_aws() {
    aplogshow "Remove [aws cli]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        sudo rm -rf /usr/local/aws-cli
        sudo rm -rf /usr/local/sessionmanagerplugin
        sudo rm -f /usr/local/bin/session-manager-plugin
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/aws-cli"
        rm -rf "${AP_SOFT_DIR}/bin/aws"
        sudo dpkg -r session-manager-plugin
    fi

    if alias aprmdirstructaws &>/dev/null; then
        aprmdirstructaws
    fi

    if alias aprmglobalsymlinkaws &>/dev/null; then
        aprmglobalsymlinkaws
    fi
}
