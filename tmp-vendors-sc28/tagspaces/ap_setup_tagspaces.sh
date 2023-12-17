# https://www.tagspaces.org/

export AP_VENDORS_TAGSPACES_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/tagspaces"

# ghq get https://github.com/nahoj/tss
# cd "${AP_GH_DIR}/nahoj/tss"
# make install

npm i -g @tagspaces/shell sharp

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    curl -SL "https://github.com/tagspaces/tagspaces/releases/download/v5.5.4/tagspaces-mac-x64-5.5.4.zip" >${AP_TMP_DIR}/tagspaces-mac-x64-5.5.4.zip
    cd "${AP_TMP_DIR}"
    unzip "${AP_TMP_DIR}/tagspaces-mac-x64-5.5.4.zip"
    # mv tagspaces-mac-x64-5.5.4/TagSpaces.app /Applications/
    mv TagSpaces.app /Applications/
    rm -rf tagspaces-mac-x64-5.5.4*
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    cd "${AP_TMP_DIR}"
    curl -SOL "https://github.com/tagspaces/tagspaces/releases/download/v5.5.4/tagspaces-linux-amd64-5.5.4.deb"
    sudo dpkg -i tagspaces-linux-amd64-5.5.4.deb
    rm -f tagspaces-linux-amd64-5.5.4.deb

    # Install TagSpaces as AppImage
    # mkdir -p "${AP_SOFT_DIR}/tagspaces/5.5.4/bin"
    # cd "${AP_SOFT_DIR}/tagspaces/5.5.4/bin"
    # curl -SL "https://github.com/tagspaces/tagspaces/releases/download/v5.5.4/tagspaces-linux-x86_64-5.5.4.AppImage" >${AP_SOFT_DIR}/tagspaces/5.5.4/bin/tagspaces.AppImage
    # ln -sf tagspaces.AppImage tagspaces
    # chmod +x tagspaces.AppImage
    # cp "${AP_VENDORS_TAGSPACES_SETUP_DIR}/configs/tagspaces.desktop" ~/.local/share/applications/
    # @addpath -a "${AP_SOFT_DIR}/tagspaces/5.5.4/bin"
fi
