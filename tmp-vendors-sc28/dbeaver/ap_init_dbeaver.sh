export AP_VENDORS_DBEAVER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/dbeaver"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    ap_ws_dir=~/Library/DBeaverData
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    ap_ws_dir=~/snap/dbeaver-ce/current/.local/share/DBeaverData
fi

if [ ! -L ${ap_ws_dir} ]; then
    rm -rf "${ap_ws_dir}"
    ln -sf "${AP_SCRIPTO_MAIN_DIR}/data/dbeaver/$(hostname)" "${ap_ws_dir}"
fi
