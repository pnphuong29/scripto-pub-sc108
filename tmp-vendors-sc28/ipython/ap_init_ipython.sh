export AP_VENDORS_IPYTHON_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ipython"
export AP_VENDORS_IPYTHON_CONFIGS_DIR="${AP_VENDORS_IPYTHON_DIR}/configs"
export IPYTHONDIR="${AP_SCRIPTO_MAIN_DIR}/data/ipython/$(hostname)"
# export IPYTHONDIR="${AP_VENDORS_IPYTHON_CONFIGS_DIR}"

if [ ! -d "${IPYTHONDIR}" ]; then
	mkdir -p "${IPYTHONDIR}"
fi

alias zscipy="cd ${AP_VENDORS_IPYTHON_DIR}"
alias viscipy="vi -p \
	${AP_VENDORS_IPYTHON_DIR}/ap_init_ipython.sh \
	${AP_VENDORS_IPYTHON_CONFIGS_DIR}/profile_default/ipython_config.py \
    "
alias lnipyconfigfile="ln -sf ${AP_VENDORS_IPYTHON_CONFIGS_DIR}/profile_default/ipython_config.py ${IPYTHONDIR}/profile_default/ipython_config.py"
