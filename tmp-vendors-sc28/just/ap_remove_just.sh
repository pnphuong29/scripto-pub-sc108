# https://github.com/casey/just

@logshow "Removing [just]\n"

rm -f "${AP_SOFT_DIR}/bin/just"

if ! type just &>/dev/null; then
    @logshowpassed "[just] has been removed successfully\n"
else
    @logshowfailed "[just] has been removed unsuccessfully\n"
fi
