# https://github.com/baskerville/sxhkd
export AP_VENDORS_SXHKD_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/sxhkd"
export AP_VENDORS_SXHKD_SETUP_CONFIGS_DIR="${AP_VENDORS_SXHKD_SETUP_DIR}/configs"
export AP_VENDORS_SXHKD_REPO_URL="https://github.com/baskerville/sxhkd"
export AP_VENDORS_SXHKD_GH_DIR="${AP_GH_DIR}/baskerville/sxhkd"

if which sxhkd &>/dev/null; then
    @logshow "Removing [sxhkd]\n"
    ghq get "${AP_VENDORS_TDROP_REPO_URL}"
    cd "${AP_VENDORS_SXHKD_GH_DIR}"
    sudo make uninstall

    if ! which sxhkd &>/dev/null; then
        @logshowpassed "[sxhkd] has been removed successfully\n"
    else
        @logshowfailed "[sxhkd] has been removed unsuccessfully\n"
    fi
fi
