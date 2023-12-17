export AP_VENDORS_XBINDKEYS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xbindkeys"
export AP_VENDORS_XBINDKEYS_SETUP_CONFIGS_DIR="${AP_VENDORS_XBINDKEYS_SETUP_DIR}/configs"

# Update config file
ln -sf "${AP_VENDORS_XBINDKEYS_SETUP_CONFIGS_DIR}/ap_xbindkeysrc.config" ~/.xbindkeysrc

# Force all xbindkeys processes to reload config file
killall -HUP xbindkeys
