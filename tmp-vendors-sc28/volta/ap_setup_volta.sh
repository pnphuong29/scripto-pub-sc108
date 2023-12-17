# https://volta.sh/

export AP_VENDORS_VOLTA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/volta"

if ! which volta &>/dev/null; then
    @logshow "Installing [volta]\n"
    curl https://get.volta.sh | bash

    if [ -f ~/.volta/bin/volta ]; then
        @logshowpassed "[volta] has been installed successfully\n"
    else
        @logshowfailed "[volta] has been installed unsuccessfully\n"
    fi
fi
