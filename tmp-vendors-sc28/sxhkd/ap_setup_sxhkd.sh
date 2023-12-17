# https://github.com/baskerville/sxhkd
export AP_VENDORS_SXHKD_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/sxhkd"
export AP_VENDORS_SXHKD_SETUP_CONFIGS_DIR="${AP_VENDORS_SXHKD_SETUP_DIR}/configs"
export AP_VENDORS_SXHKD_REPO_URL="https://github.com/baskerville/sxhkd"
export AP_VENDORS_SXHKD_GH_DIR="${AP_GH_DIR}/baskerville/sxhkd"

if ! which sxhkd &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Installing [sxhkd]\n"
        ghq get "${AP_VENDORS_SXHKD_REPO_URL}"
        cd "${AP_VENDORS_SXHKD_GH_DIR}"
        sudo apt update
        sudo apt install -y libxcb-keysyms1-dev libxcb-util0-dev apt-file
        sudo make
        sudo make install

        if which sxhkd &>/dev/null; then
            @logshowpassed "[sxhkd] has been installed successfully\n"
        else
            @logshowfailed "[sxhkd] has been installed unsuccessfully\n"
        fi
    fi
fi
