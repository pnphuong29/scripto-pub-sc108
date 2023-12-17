# https://remotedesktop.google.com/access
export AP_VENDORS_CHROME_REMOTE_DESKTOP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/chrome-remote-desktop"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    # @logshow "Installing [chrome-remote-desktop] using [brew]\n"
    # brew install chrome-remote-desktop

    # if brew list --versions | grep chrome-remote-desktop &>/dev/null; then
    #     @logshowpassed "[chrome-remote-desktop] has been installed successfully using [brew]\n"
    # else
    #     @logshowfailed "[chrome-remote-desktop] has been installed unsuccessfully using [brew]\n"
    # fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Removing [chrome-remote-desktop]\n"
    # curl -SOL "https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb" >${AP_TMP_DIR}/chrome_remote_desktop.deb
    # sudo apt install -y xvfb
    # sudo apt --fix-broken install
    # sudo dpkg -i "${AP_TMP_DIR}/chrome_remote_desktop.deb"
    # Try installing using apt first, if cannot, then use the download file above
    sudo apt remove -y chrome-remote-desktop
fi
