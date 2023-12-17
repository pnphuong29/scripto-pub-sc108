@logshow "Removing [GitHub CLI]\n"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    brew uninstall gh
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    sudo apt purge -y gh
    sudo apt autoremove -y
fi

if ! type gh &>/dev/null; then
    @logshowpassed "[GitHub CLI] has been removed successfully\n"
else
    @logshowfailed "[GitHub CLI] has been removed unsuccessfully\n"
fi
