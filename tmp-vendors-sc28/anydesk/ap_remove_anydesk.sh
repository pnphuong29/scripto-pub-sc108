# http://deb.anydesk.com/howto.html
export AP_VENDORS_ANYDESK_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/anydesk"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Removing [anydesk] using [brew]\n"
    brew uninstall anydesk
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Removing [anydesk] using [apt]\n"
    sudo apt purge -y anydesk
    sudo apt autoremove -y
fi
