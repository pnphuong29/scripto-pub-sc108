# https://my.noip.com/dynamic-dns/duc

export AP_VENDORS_NOIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/noip"
export AP_VENDORS_NOIP_DIR="${AP_SOFT_DIR}/noip"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	rm -rf "${AP_VENDORS_NOIP_DIR}"
	sudo rm -f /usr/local/bin/noip
fi
