# https://github.com/vercel/hyper

export AP_VENDORS_HYPER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/hyper"
export AP_VENDORS_HYPER_SETUP_CONFIGS_DIR="${AP_VENDORS_HYPER_SETUP_DIR}/configs"
export AP_VENDORS_HYPER_REPO_URL="https://github.com/vercel/hyper"
export AP_VENDORS_HYPER_GH_DIR="${AP_GH_DIR}/vercel/hyper"

if which hyper &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Removing [hyper] using [brew]\n"
        brew uninstall hyper

        if ! brew list --versions | grep hyper &>/dev/null; then
            @logshowpassed "[hyper] has been removed successfully using [brew]\n"
        else
            @logshowfailed "[hyper] has been removed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Removing [hyper] using [dpkg]\n"
        sudo dpkg --purge hyper

        if ! which hyper &>/dev/null; then
            @logshowpassed "[hyper] has been removed successfully using [dpkg]\n"
        else
            @logshowfailed "[hyper] has been removed unsuccessfully using [dpkg]\n"
        fi
    fi
fi
