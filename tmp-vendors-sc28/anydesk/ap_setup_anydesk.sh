# http://deb.anydesk.com/howto.html
export AP_VENDORS_ANYDESK_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/anydesk"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    @logshow "Installing [anydesk] using [brew]\n"
    brew install --cask anydesk
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    @logshow "Installing [anydesk] using [apt]\n"
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
    echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
    sudo apt update
    sudo apt install -y anydesk
fi
