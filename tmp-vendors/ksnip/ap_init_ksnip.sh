# https://github.com/ksnip/ksnip

export AP_VENDORS_KSNIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ksnip"
export AP_VENDORS_KSNIP_SETUP_CONFIGS_DIR="${AP_VENDORS_KSNIP_SETUP_DIR}/configs"

alias zscksnip="cd ${AP_VENDORS_KSNIP_SETUP_DIR}"

alias viscksnip="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ksnip/ap_init_ksnip.sh \
	${AP_VENDORS_KSNIP_SETUP_CONFIGS_DIR}/ap_ksnip.conf \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ksnip/ap_setup_ksnip.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ksnip/ap_remove_ksnip.sh \
	"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	alias ksnipupdateconfigs='cp -f ~/snap/ksnip/current/.config/ksnip/ksnip.conf ~/snap/ksnip/current/.config/ksnip/ksnip.conf.bak; cp -f "${AP_VENDORS_KSNIP_SETUP_CONFIGS_DIR}/ap_ksnip.conf" ~/snap/ksnip/current/.config/ksnip/ksnip.conf'
fi

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	alias bkksnipconfigs="cp -f ~/snap/ksnip/current/.config/ksnip/ksnip.conf ${AP_VENDORS_KSNIP_SETUP_CONFIGS_DIR}/ap_ksnip.conf"
fi
