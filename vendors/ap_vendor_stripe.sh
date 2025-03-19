# https://github.com/stripe/stripe-cli
alias apinitstripe="ap_func_init_stripe"
ap_func_init_stripe() {
    if alias apinitstripeshare &>/dev/null; then
        apinitstripeshare
    fi

    if alias apinitstripecommon &>/dev/null; then
        apinitstripecommon
    fi

    if alias apinitstripemain &>/dev/null; then
        apinitstripemain
    fi
}

alias apcreatedirstructstripe="ap_func_create_dirstruct_stripe"
ap_func_create_dirstruct_stripe() {
    if alias apcreatedirstructstripeshare &>/dev/null; then
        apcreatedirstructstripeshare
    fi

    if alias apcreatedirstructstripecommon &>/dev/null; then
        apcreatedirstructstripecommon
    fi

    if alias apcreatedirstructstripemain &>/dev/null; then
        apcreatedirstructstripemain
    fi
}

alias aprmdirstructstripe="ap_func_rm_dirstruct_stripe"
ap_func_rm_dirstruct_stripe() {
    if alias aprmdirstructstripeshare &>/dev/null; then
        aprmdirstructstripeshare
    fi

    if alias aprmdirstructstripecommon &>/dev/null; then
        aprmdirstructstripecommon
    fi

    if alias aprmdirstructstripemain &>/dev/null; then
        aprmdirstructstripemain
    fi
}

alias apcreateglobalsymlinkstripe="ap_func_create_global_symlink_stripe"
ap_func_create_global_symlink_stripe() {
    if [ -f "${AP_SOFT_DIR}/bin/stripe" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/stripe] to [${AP_SOFT_DIR}/bin/stripe]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/stripe" "/usr/local/bin/stripe"
    fi
}

alias aprmglobalsymlinkstripe="ap_func_rm_global_symlink_stripe"
ap_func_rm_global_symlink_stripe() {
    if [ -f "/usr/local/bin/stripe" ]; then
        apshowmsginfo "Remove [/usr/local/bin/stripe]\n"
        sudo rm -f "/usr/local/bin/stripe"
    fi
}

alias apsetupstripe="ap_func_setup_stripe"
ap_func_setup_stripe() {
    apshowmsginfo "Install [stripe]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/stripe"

    # Install stripe
    mkdir -p "${AP_TMP_DIR}/stripe"
    cd "${AP_TMP_DIR}/stripe"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install stripe
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/stripe/stripe-cli/releases" | jq -r '.[0].assets[].browser_download_url' | grep "mac-os" | grep arm64)" >stripe.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/stripe/stripe-cli/releases" | jq -r '.[0].assets[].browser_download_url' | grep "mac-os" | grep x86_64)" >stripe.tar.gz
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/stripe/stripe-cli/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64)" >stripe.tar.gz
    fi

    tar -zxf stripe.tar.gz
    mv stripe "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}/bin"
    # rm -rf "${AP_TMP_DIR}/stripe"

    apinitstripe

    apcreateglobalsymlinkstripe
    if alias apcreateglobalsymlinkstripe &>/dev/null; then
        apcreatedirstructstripe
    fi

    if alias apcreatedirstructstripe &>/dev/null; then
        apcreatedirstructstripe
    fi
}

alias aprmstripe="ap_func_rm_stripe"
ap_func_rm_stripe() {
    apshowmsginfo "Remove [stripe]\n"
    rm -f "${AP_SOFT_DIR}/bin/stripe"

    if alias aprmdirstructstripe &>/dev/null; then
        aprmdirstructstripe
    fi

    if alias aprmglobalsymlinkstripe &>/dev/null; then
        aprmglobalsymlinkstripe
    fi
}
