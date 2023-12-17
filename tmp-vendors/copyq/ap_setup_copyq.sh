# https://github.com/hluk/CopyQ
export AP_VENDORS_COPYQ_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/copyq"
export AP_VENDORS_COPYQ_SETUP_CONFIGS_DIR="${AP_VENDORS_COPYQ_SETUP_DIR}/configs"
export AP_VENDORS_COPYQ_REPO_URL="https://github.com/hluk/CopyQ"

if ! type copyq &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Installing [copyq] using [brew]\n"
        brew install --cask copyq

        if brew list --versions | grep copyq &>/dev/null; then
            @logshowpassed "[copyq] has been installed successfully using [brew]\n"
        else
            @logshowfailed "[copyq] has been installed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Installing [copyq] using [apt]\n"
        sudo add-apt-repository -y ppa:hluk/copyq
        sudo apt update
        sudo apt install -y copyq

        if type copyq &>/dev/null; then
            @logshowpassed "[copyq] has been installed successfully using [apt]\n"
        else
            @logshowfailed "[copyq] has been installed unsuccessfully using [apt]\n"
        fi
    fi
fi
