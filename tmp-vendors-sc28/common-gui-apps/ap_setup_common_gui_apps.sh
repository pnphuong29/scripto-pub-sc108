if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Installing [google-chrome, teamviewer, iterm2] using [brew]\n"

    brew install --cask \
        google-chrome
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Installing [xclip, xsel, x11-utils, x11-xserver-utils, gparted, ibus-unikey usb-creator-gtk dconf-editor, gnome-shell-extensions, gnome-tweaks, chrome-gnome-shell, gnome-shell-extension-installer, google-chrome, teamviewer] using [apt]\n"

    sudo apt install -y \
        xclip \
        xsel \
        x11-utils \
        gparted \
        ibus-unikey \
        usb-creator-gtk \
        dconf-editor \
        gnome-shell-extensions \
        gnome-tweaks \
        chrome-gnome-shell

    # Flatpak
    sudo apt install gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # Google Chrome
    cd "${AP_TMP_DIR}"
    curl -SLO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb

    # Configure ibus
    ibus-daemon -R
    ibus restart
fi
