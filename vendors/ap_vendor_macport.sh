alias @setupmacports="ap_func_setup_macports"
ap_func_setup_macports() {
    @logshow "Install [xcode-select]\n"
    xcode-select --install

    # https://www.macports.org/install.php
    @logshow "Download [MacPorts v2.8.1]\n"
    cd "${HOME}/tmp"
    curl -SOL "https://github.com/macports/macports-base/releases/download/v2.8.1/MacPorts-2.8.1.tar.gz"
    tar -zxf "MacPorts-2.8.1.tar.gz"

    @logshow "Build and install [MacPorts v2.8.1]"
    cd "MacPorts-2.8.1"
    ./configure && make && sudo make install
    cd ../
    rm -rf "MacPorts-2.8.1"
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
}
