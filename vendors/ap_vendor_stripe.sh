alias apinitstripe="ap_func_init_stripe"
ap_func_init_stripe() {
    export AP_XXX_SETUP_VERSION=''
    export AP_XXX_CONF_DIR="${HOME}/.config/stripe"

    alias zstripeconfig="cd /Applications/stripe.app/Contents/MacOS"
    alias zstripeconfig="cd \${HOME}/.stripe"
    alias zstripeconfig="cd \${HOME}/.config/stripe"

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
    apshowmsginfo "Generate [stripe] bash autocomplete\n"
    stripe >"${AP_COMPLETIONS_DIR}/ap_completion_stripe.bash"

    if [ -f "${HOME}/scripto-share/vendors/stripe/bindings.json" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/stripe/bindings.json] to [${HOME}/scripto-share/vendors/stripe/bindings.json]\n"
        ln -sf "${HOME}/scripto-share/vendors/stripe/bindings.json" "${HOME}/.config/stripe/bindings.json"
    fi

    if [ -f "${AP_SOFT_DIR}/stripe/stripe" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/stripe] to [${AP_SOFT_DIR}/stripe/bin/stripe]\n"
        ln -sf "${AP_SOFT_DIR}/stripe/bin/stripe" "${AP_SOFT_DIR}/bin/stripe"
    fi

    if [ -f "${AP_SOFT_DIR}/stripe/stripe" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_stripe.bash] to [${AP_SOFT_DIR}/stripe/complete/stripe.bash]\n"
        ln -sf "${AP_SOFT_DIR}/stripe/complete/stripe.bash" "${AP_COMPLETIONS_DIR}/ap_completion_stripe.bash"
    fi

    apshowmsginfo "Create symlink from [${AP_MAN_DIR}/man1/stripe.1] to [${AP_SOFT_DIR}/stripe/stripe.1]\n"
    ln -sf "${AP_SOFT_DIR}/stripe/stripe.1" "${AP_MAN_DIR}/man1/stripe.1"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/stripe/config.mac.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/stripe"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.base.env" "${XDG_CONFIG_HOME}/stripe/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.key.mac.env" "${XDG_CONFIG_HOME}/stripe/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.mac.env" "${XDG_CONFIG_HOME}/stripe/config"
            else
                mkdir -p "${HOME}/Library/Application Support/com.mitchellh.stripe"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.base.env" "${HOME}/Library/Application Support/com.mitchellh.stripe/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.key.mac.env" "${HOME}/Library/Application Support/com.mitchellh.stripe/config.key.mac.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.mac.env" "${HOME}/Library/Application Support/com.mitchellh.stripe/config"
            fi
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${HOME}/scripto-common/vendors/stripe/config.linux.env" ]; then
            if [ -d "${XDG_CONFIG_HOME}" ]; then
                mkdir -p "${XDG_CONFIG_HOME}/stripe"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.base.env" "${XDG_CONFIG_HOME}/stripe/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.key.linux.env" "${XDG_CONFIG_HOME}/stripe/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.linux.env" "${XDG_CONFIG_HOME}/stripe/config"
            else
                mkdir -p "${HOME}/.config/stripe"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.base.env" "${HOME}/.config/stripe/config.base.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.key.linux.env" "${HOME}/.config/stripe/config.key.linux.env"
                ln -sf "${HOME}/scripto-common/vendors/stripe/config.linux.env" "${HOME}/.config/stripe/config"
            fi
        fi
    fi

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
    apshowmsginfo "Remove [${HOME}/.config/stripe/]\n"
    rm -rf "${HOME}/.config/stripe/"

    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/stripe]\n"
    rm -f "${AP_SOFT_DIR}/bin/stripe"

    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_stripe.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_stripe.bash"

    apshowmsginfo "Remove [${AP_MAN_DIR}/man1/stripe.1]\n"
    rm -f "${AP_MAN_DIR}/man1/stripe.1"

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
    local ap_stripe_setup_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_stripe_setup_version="$1"
    fi

    apshowmsginfo "Install [stripe] version [${ap_stripe_setup_version}]\n"

    apshowmsginfo "Install [stripe]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/stripe"
    rm -rf "${AP_TMP_DIR}/stripe"

    # Install stripe
    mkdir -p "${AP_TMP_DIR}/stripe"
    cd "${AP_TMP_DIR}/stripe"

    apshowmsginfo "Download [stripe] version [${ap_stripe_setup_version}] from [https://ziglang.org/download/${ap_stripe_setup_version}/zig-${ap_os}-${ap_stripe_setup_version}.tar.xz]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install stripe
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/stripe/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep arm | grep -v sha256)" >stripe.tar.gz
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/owner/stripe/releases" | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >stripe.tar.gz
        fi

        rm -rf "/Applications/stripe"

        unzip stripe.zip
        mv stripe* stripe
        mv "stripe/stripe.app" /Applications/
        cd "/Applications"

        hdiutil attach -nobrowse stripe.dmg
        cp -R "/Volumes/stripe/stripe.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/stripe"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/owner/stripe/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep musl)" >stripe.tar.gz
        sudo dpkg -i stripe.deb
        sudo snap install -y stripe
        sudo apt install -y stripe
    fi

    local ap_os="macos"
    local ap_os="darwin"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/owner/stripe/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}" | grep x86_64 | grep -v sha256)" >stripe.tar.gz

    tar -zxf stripe.tar.gz
    rm -f stripe.tar.gz

    mv stripe* stripe
    mv stripe "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/stripe"
    # rm -rf "${AP_TMP_DIR}/stripe"

    ./configure
    make
    sudo make install

    cargo install stripe
    pip install stripe
    pnpm install -g stripe

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
    local ap_stripe_remove_version="${AP_XXX_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_stripe_remove_version="$1"
    fi

    apshowmsginfo "Remove [stripe] v${ap_stripe_remove_version}\n"

    apshowmsginfo "Remove [stripe]\n"
    cargo uninstall stripe
    pip uninstall stripe
    npm uninstall -g stripe

    rm -rf "${GOPATH}/pkg/mod/github.com/stripe/stripe@"*
    rm -f "${GOPATH}/bin/stripe"

    rm -rf "${AP_SOFT_DIR}/stripe"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/stripe"
        brew remove --cask stripe
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y stripe
        sudo snap remove --purge stripe
        sudo dpkg --purge stripe
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructstripe &>/dev/null; then
        aprmdirstructstripe
    fi

    if alias aprmglobalsymlinkstripe &>/dev/null; then
        aprmglobalsymlinkstripe
    fi
}
