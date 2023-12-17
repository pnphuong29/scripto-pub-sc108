# https://github.com/flameshot-org/flameshot#installation

export AP_VENDORS_FLAMESHOT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/flameshot"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    if ! brew list --versions | grep flameshot &>/dev/null; then
        @logshow "Installing [flameshot] using [brew]\n"
        brew install --cask flameshot

        if brew list --versions | grep flameshot &>/dev/null; then
            @logshowpassed "[flameshot] has been installed successfully using [brew]\n"
        else
            @logshowfailed "[flameshot] has been installed unsuccessfully using [brew]\n"
        fi
    fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    if ! type flameshot &>/dev/null; then
        @logshow "Installing [flameshot] using [snap]\n"
        # sudo snap install kde-frameworks-5-91-qt-5-15-3-core20
        sudo snap install flameshot

        if type flameshot &>/dev/null; then
            @logshowpassed "[flameshot] has been installed successfully using [snap]\n"
        else
            @logshowfailed "[flameshot] has been installed unsuccessfully using [snap]\n"
        fi
    fi
fi
