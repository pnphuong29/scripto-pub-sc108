# https://www.changeip.com/accounts/index.php?rp=/download/category/4/Linux-or-OSX.html

export AP_VENDORS_CHANGEIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/changeip"
export AP_VENDORS_CHANGEIP_DIR="${AP_SOFT_DIR}/changeip"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	rm -rf "${AP_VENDORS_CHANGEIP_DIR}"
fi
