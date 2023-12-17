# https://volta.sh/

export AP_VENDORS_VOLTA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/volta"

if which volta &>/dev/null; then
    @logshow "Removing [volta]\n"
    rm -rf ~/.volta
    # volta modified `~/.profile`, please remove unnecessary lines related to volta

    if [ ! -f ~/.volta/bin/volta ]; then
        @logshowpassed "[volta] has been uninstalled successfully\n"
    else
        @logshowfailed "[volta] has been uninstalled unsuccessfully\n"
    fi
fi
