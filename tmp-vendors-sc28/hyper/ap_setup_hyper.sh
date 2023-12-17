# https://github.com/vercel/hyper

export AP_VENDORS_HYPER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/hyper"
export AP_VENDORS_HYPER_SETUP_CONFIGS_DIR="${AP_VENDORS_HYPER_SETUP_DIR}/configs"
export AP_VENDORS_HYPER_REPO_URL="https://github.com/vercel/hyper"
export AP_VENDORS_HYPER_GH_DIR="${AP_GH_DIR}/vercel/hyper"

if ! which hyper &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Installing [hyper] using [brew]\n"
        brew install --cask hyper

        if brew list --versions | grep hyper &>/dev/null; then
            @logshowpassed "[hyper] has been installed successfully using [brew]\n"
        else
            @logshowfailed "[hyper] has been installed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Installing [hyper] using [dpkg]\n"
        cd "${AP_TMP_DIR}"
        curl -SOL https://github.com/vercel/hyper/releases/download/v3.4.1/hyper_3.4.1_amd64.deb
        sudo dpkg -i hyper_3.4.1_amd64.deb

        if which hyper &>/dev/null; then
            @logshowpassed "[hyper] has been installed successfully using [dpkg]\n"
        else
            @logshowfailed "[hyper] has been installed unsuccessfully using [dpkg]\n"
        fi
    fi
fi
