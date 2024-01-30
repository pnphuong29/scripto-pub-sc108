alias @initmacport="ap_func_init_macport"
ap_func_init_macport() {
    # export DISPLAY=:0.0 # For macOS < 10.5

    if alias @initmacportshare &>/dev/null; then
        @initmacportshare
    fi

    if alias @initmacportcommon &>/dev/null; then
        @initmacportcommon
    fi
}

alias @createdirstructmacport="ap_func_create_dirstruct_macport"
ap_func_create_dirstruct_macport() {
    if alias @createdirstructmacportshare &>/dev/null; then
        @createdirstructmacportshare
    fi

    if alias @createdirstructmacportcommon &>/dev/null; then
        @createdirstructmacportcommon
    fi
}

alias @rmdirstructmacport="ap_func_rm_dirstruct_macport"
ap_func_rm_dirstruct_macport() {
    if alias @rmdirstructmacportshare &>/dev/null; then
        @rmdirstructmacportshare
    fi

    if alias @rmdirstructmacportcommon &>/dev/null; then
        @rmdirstructmacportcommon
    fi
}

alias @setupmacports="ap_func_setup_macports"
ap_func_setup_macports() {
    @logshow "Install [xcode-select]\n"
    xcode-select --install

    # https://www.macports.org/install.php
    @logshow "Download [MacPorts]\n"
    cd "${AP_TMP_DIR}"
    curl -SL \
        "$(curl --silent https://api.github.com/repos/macports/macports-base/releases | jq -r '.[0].assets[].browser_download_url' | grep ".tar.gz" | grep -v asc)" >macports.tar.gz
    tar -zxf "macports.tar.gz"

    @logshow "Build and install [MacPorts]"
    mv MacPorts* MacPorts

    cd "MacPorts"
    # Installing MacPorts into /usr/local is not supported.
    # If you understand this and wish to do so anyway, pass --with-unsupported-prefix to configure.
    # ./configure --prefix=/usr/local --with-unsupported-prefix
    ./configure
    make
    sudo make install
    cd ../
    rm -rf "MacPorts"

    @initmacport
    if alias @createdirstructmacport &>/dev/null; then
        @createdirstructmacport
    fi
}

alias @rmmacports="ap_func_rm_macports"
ap_func_rm_macports() {
    # https://guide.macports.org/chunked/installing.macports.uninstalling.html
    @logshow "Remove [Macports]\n"
    sudo port -fp uninstall installed

    # Remove Users and Groups
    @logshow "Remove Macports users and groups\n"
    sudo dscl . -delete /Users/macports
    sudo dscl . -delete /Groups/macports

    # Remove the rest of macports
    @logshow "Remove Macports directories\n"
    sudo rm -rf \
        /opt/local \
        /Applications/DarwinPorts \
        /Applications/MacPorts \
        /Library/LaunchDaemons/org.macports.* \
        /Library/Receipts/DarwinPorts*.pkg \
        /Library/Receipts/MacPorts*.pkg \
        /Library/StartupItems/DarwinPortsStartup \
        /Library/Tcl/darwinports1.0 \
        /Library/Tcl/macports1.0 \
        "${HOME}/.macports"

    if alias @rmdirstructmacport &>/dev/null; then
        @rmdirstructmacport
    fi

    if alias @rmglobalsymlinkmacport &>/dev/null; then
        @rmglobalsymlinkmacport
    fi
}
