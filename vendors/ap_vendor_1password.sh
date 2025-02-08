alias apinit1password="ap_func_init_1password"
ap_func_init_1password() {
    if alias apinit1passwordshare &>/dev/null; then
        apinit1passwordshare
    fi

    if alias apinit1passwordcommon &>/dev/null; then
        apinit1passwordcommon
    fi

    if alias apinit1passwordmain &>/dev/null; then
        apinit1passwordmain
    fi
}

alias apcreatedirstruct1password="ap_func_create_dirstruct_1password"
ap_func_create_dirstruct_1password() {
    apshowmsginfo "Generate [1password] bash autocomplete\n"
    op completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_1password.bash"

    if alias apcreatedirstruct1passwordshare &>/dev/null; then
        apcreatedirstruct1passwordshare
    fi

    if alias apcreatedirstruct1passwordcommon &>/dev/null; then
        apcreatedirstruct1passwordcommon
    fi

    if alias apcreatedirstruct1passwordmain &>/dev/null; then
        apcreatedirstruct1passwordmain
    fi
}

alias aprmdirstruct1password="ap_func_rm_dirstruct_1password"
ap_func_rm_dirstruct_1password() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_1password.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_1password.bash"

    if alias aprmdirstruct1passwordshare &>/dev/null; then
        aprmdirstruct1passwordshare
    fi

    if alias aprmdirstruct1passwordcommon &>/dev/null; then
        aprmdirstruct1passwordcommon
    fi

    if alias aprmdirstruct1passwordmain &>/dev/null; then
        aprmdirstruct1passwordmain
    fi
}

alias apsetup1password="ap_func_setup_1password"
ap_func_setup_1password() {
    apshowmsginfo "Install [1password]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # https://1password.com/downloads/mac
        brew install --cask 1password # Best to download and install manually from 1password.com
        brew install 1password-cli
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo -s \
            curl -sS https://downloads.1password.com/linux/keys/1password.asc |
            sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
            sudo tee /etc/apt/sources.list.d/1password.list
        sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
        curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol |
            sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
        sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
        curl -sS https://downloads.1password.com/linux/keys/1password.asc |
            sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
        sudo apt update
        sudo apt install 1password 1password-cli
    fi

    apinit1password
    if alias apcreatedirstruct1password &>/dev/null; then
        apcreatedirstruct1password
    fi
}

alias aprm1password="ap_func_rm_1password"
ap_func_rm_1password() {
    apshowmsginfo "Remove [1password]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove 1password-cli
        brew remove --cask 1password
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt-get remove --purge -y 1password 1password-cli
        sudo apt-get autoremove --purge -y
    fi

    if alias aprmdirstruct1password &>/dev/null; then
        aprmdirstruct1password
    fi

    if alias aprmglobalsymlink1password &>/dev/null; then
        aprmglobalsymlink1password
    fi
}
