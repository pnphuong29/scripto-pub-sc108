# https://github.com/baskerville/sxhkd
export AP_VENDORS_SXHKD_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/sxhkd"
export AP_VENDORS_SXHKD_SETUP_CONFIGS_DIR="${AP_VENDORS_SXHKD_SETUP_DIR}/configs"
export AP_VENDORS_SXHKD_REPO_URL="https://github.com/baskerville/sxhkd"
export AP_VENDORS_SXHKD_GH_DIR="${AP_GH_DIR}/baskerville/sxhkd"

alias sxhkd="sxhkd -c ${AP_VENDORS_SXHKD_SETUP_CONFIGS_DIR}/sxhkdrc"
alias viscsxhkd="vi -p \
	${AP_VENDORS_SXHKD_SETUP_DIR}/ap_init_sxhkd.sh \
	${AP_VENDORS_SXHKD_SETUP_CONFIGS_DIR}/sxhkdrc"
