# https://my.noip.com/dynamic-dns/duc

export AP_VENDORS_NOIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/noip"
export AP_VENDORS_NOIP_DIR="${AP_SOFT_DIR}/noip"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	cd "${AP_VENDORS_NOIP_SETUP_DIR}"
	tar -zxf noip-duc-linux.tar.gz
	rm -rf "${AP_VENDORS_NOIP_DIR}"
	rm -f "${AP_VENDORS_NOIP_SETUP_DIR}/._noip-2.1.9-1"
	mv "${AP_VENDORS_NOIP_SETUP_DIR}/noip-2.1.9-1" "${AP_VENDORS_NOIP_DIR}"
fi
