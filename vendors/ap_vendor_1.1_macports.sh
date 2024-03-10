alias apinitmacports="ap_func_init_macports"
ap_func_init_macports() {
    # export DISPLAY=:0.0 # For macOS < 10.5
    alias @port='sudo port'
    alias portselfupdate='sudo port selfupdate'
    alias portinstall='sudo port install'
    alias portinstallverbose='sudo port -v install'
    alias portclean='sudo port clean'
    alias portload='sudo port load'
    alias portunload='sudo port unload'
    alias portuninstall='sudo port uninstall'
    alias portuninstallforce='sudo port uninstall --force'
    alias portsearch='port search'
    alias portdeps='port deps'
    alias portlist='port list'
    alias portinstalled='port installed'
    alias portinfo='port info'
    alias portcontents='port -q contents --size --units KiB'

    if [ -f "/opt/local/etc/profile.d/bash_completion.sh" ]; then
        source "/opt/local/etc/profile.d/bash_completion.sh"
    fi

    if alias apinitmacportsshare &>/dev/null; then
        apinitmacportsshare
    fi

    if alias apinitmacportscommon &>/dev/null; then
        apinitmacportscommon
    fi
}

alias apcreatedirstructmacports="ap_func_create_dirstruct_macports"
ap_func_create_dirstruct_macports() {
    if alias apcreatedirstructmacportsshare &>/dev/null; then
        apcreatedirstructmacportsshare
    fi

    if alias apcreatedirstructmacportscommon &>/dev/null; then
        apcreatedirstructmacportscommon
    fi
}

alias aprmdirstructmacports="ap_func_rm_dirstruct_macports"
ap_func_rm_dirstruct_macports() {
    if alias aprmdirstructmacportsshare &>/dev/null; then
        aprmdirstructmacportsshare
    fi

    if alias aprmdirstructmacportscommon &>/dev/null; then
        aprmdirstructmacportscommon
    fi
}

alias apsetupmacports="ap_func_setup_macports"
ap_func_setup_macports() {
    aplogshow "Install [xcode-select]\n"
    xcode-select --install

    # https://www.macports.org/install.php
    aplogshow "Download [MacPorts]\n"
    cd "${AP_TMP_DIR}"
    curl -SL \
        "$(curl --silent https://api.github.com/repos/macports/macports-base/releases | jq -r '.[0].assets[].browser_download_url' | grep ".tar.gz" | grep -v asc)" >macports.tar.gz
    tar -zxf "macports.tar.gz"

    aplogshow "Build and install [MacPorts]"
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

    apinitmacports
    if alias apcreatedirstructmacports &>/dev/null; then
        apcreatedirstructmacports
    fi
}

alias aprmmacports="ap_func_rm_macports"
ap_func_rm_macports() {
    # https://guide.macports.org/chunked/installing.macports.uninstalling.html
    aplogshow "Remove [Macports]\n"
    sudo port -fp uninstall installed

    # Remove Users and Groups
    aplogshow "Remove Macports users and groups\n"
    sudo dscl . -delete /Users/macports
    sudo dscl . -delete /Groups/macports

    # Remove the rest of macports
    aplogshow "Remove Macports directories\n"
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

    if alias aprmdirstructmacports &>/dev/null; then
        aprmdirstructmacport
    fi

    if alias aprmglobalsymlinkmacports &>/dev/null; then
        rmglobalsymlinkmacport
    fi
}
