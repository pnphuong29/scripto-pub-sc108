export AP_VENDORS_PDBPP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/pdbpp"
export AP_VENDORS_PDBPP_SETUP_CONFIGS_DIR="${AP_VENDORS_PDBPP_SETUP_DIR}/configs"
export AP_PDBPP_CONFIG_FILE="${AP_VENDORS_PDBPP_SETUP_CONFIGS_DIR}/ap_pdbpp.py"

alias viscpdbpp="vi -p \
	${AP_VENDORS_PDBPP_SETUP_DIR}/ap_init_pdbpp.sh \
	${AP_PDBPP_CONFIG_FILE}"

if [[ ! -L ~/.pdbrc.py ]]; then
	ln -sf "${AP_PDBPP_CONFIG_FILE}" ~/.pdbrc.py
fi
