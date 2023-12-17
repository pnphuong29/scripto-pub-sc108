# https://github.com/hluk/CopyQ
export AP_VENDORS_COPYQ_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/copyq"
export AP_VENDORS_COPYQ_SETUP_CONFIGS_DIR="${AP_VENDORS_COPYQ_SETUP_DIR}/configs"
export AP_VENDORS_COPYQ_REPO_URL="https://github.com/hluk/CopyQ"

if type copyq &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Removing [copyq] using [brew]\n"
        brew uninstall --cask copyq

        if ! brew list --versions | grep copyq &>/dev/null; then
            @logshowpassed "[copyq] has been removed successfully using [brew]\n"
        else
            @logshowfailed "[copyq] has been removed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Removing [copyq] using [apt]\n"
        sudo add-apt-repository -r -y ppa:hluk/copyq
        sudo apt update
        sudo apt purge -y copyq

        if ! type copyq &>/dev/null; then
            @logshowpassed "[copyq] has been removed successfully using [apt]\n"
        else
            @logshowfailed "[copyq] has been removed unsuccessfully using [apt]\n"
        fi
    fi
fi
