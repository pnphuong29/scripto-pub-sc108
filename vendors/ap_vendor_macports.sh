alias @initmacports="ap_func_init_macports"
ap_func_init_macports() {
    # export DISPLAY=:0.0 # For macOS < 10.5
    alias @port='sudo port'
    alias portselfupdate='sudo port selfupdate'
    alias portinstall='sudo port install'

    if alias @initmacportsshare &>/dev/null; then
        @initmacportsshare
    fi

    if alias @initmacportscommon &>/dev/null; then
        @initmacportscommon
    fi
}

alias @createdirstructmacports="ap_func_create_dirstruct_macports"
ap_func_create_dirstruct_macports() {
    if alias @createdirstructmacportsshare &>/dev/null; then
        @createdirstructmacportsshare
    fi

    if alias @createdirstructmacportscommon &>/dev/null; then
        @createdirstructmacportscommon
    fi
}

alias @rmdirstructmacports="ap_func_rm_dirstruct_macports"
ap_func_rm_dirstruct_macports() {
    if alias @rmdirstructmacportsshare &>/dev/null; then
        @rmdirstructmacportsshare
    fi

    if alias @rmdirstructmacportscommon &>/dev/null; then
        @rmdirstructmacportscommon
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

    @initmacports
    if alias @createdirstructmacports &>/dev/null; then
        @createdirstructmacports
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

    if alias @rmdirstructmacports &>/dev/null; then
        @rmdirstructmacport
    fi

    if alias @rmglobalsymlinkmacports &>/dev/null; then
        @rmglobalsymlinkmacport
    fi
}
