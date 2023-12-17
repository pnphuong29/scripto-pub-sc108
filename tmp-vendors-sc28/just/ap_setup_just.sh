# https://github.com/casey/just

@logshow "Installing [just]\n"

curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to "${AP_SOFT_DIR}/bin"

if type just &>/dev/null; then
    @logshowpassed "[just] has been installed successfully\n"
else
    @logshowfailed "[just] has been installed unsuccessfully\n"
fi
