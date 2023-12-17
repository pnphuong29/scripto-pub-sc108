# https://github.com/noctuid/tdrop

export AP_VENDORS_TDROP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tdrop"
export AP_VENDORS_TDROP_SETUP_CONFIGS_DIR="${AP_VENDORS_TDROP_SETUP_DIR}/configs"
export AP_VENDORS_TDROP_REPO_URL="https://github.com/noctuid/tdrop"
export AP_VENDORS_TDROP_GH_DIR="${AP_GH_DIR}/noctuid/tdrop"

if ! which tdrop &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Installing [tdrop]\n"
        ghq get "${AP_VENDORS_TDROP_REPO_URL}"
        cd "${AP_VENDORS_TDROP_GH_DIR}"
        sudo make
        sudo make install

        if which tdrop &>/dev/null; then
            @logshowpassed "[tdrop] has been installed successfully\n"
        else
            @logshowfailed "[tdrop] has been installed unsuccessfully\n"
        fi
    fi
fi
