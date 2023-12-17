# I tested below env variable and it did not work!
# export PTPYTHON_CONFIG_HOME="${AP_SCRIPTO_COMMON_DIR}/vendors/ptpython"

export AP_PTPYTHON_HISTORY_DIR="${AP_SCRIPTO_MAIN_DIR}/data/ptpython/$(hostname)"
[[ ! -d "${AP_PTPYTHON_HISTORY_DIR}" ]] && mkdir -p "${AP_PTPYTHON_HISTORY_DIR}"

export AP_PTPYTHON_HISTORY_FILE="${AP_PTPYTHON_HISTORY_DIR}/ptpython_history.py"
[[ ! -f "${AP_PTPYTHON_HISTORY_FILE}" ]] && touch "${AP_PTPYTHON_HISTORY_FILE}"

alias viscptpy="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ptpython/ap_init_ptpython.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/ptpython/ap_config.py"

alias ptpython="ptpython --history-file ${AP_PTPYTHON_HISTORY_FILE}"
alias pt="ptpython"

if [[ ${AP_OS_TYPE} == ${AP_OS_TYPE_MACOS} ]]; then
	if [[ ! -L "${HOME}/Library/Application Support/ptpython/config.py" ]]; then
		mkdir -p "${HOME}/Library/Application Support/ptpython"
		ln -sf ${AP_SCRIPTO_COMMON_DIR}/vendors/ptpython/ap_config.py "${HOME}/Library/Application Support/ptpython/config.py"
	fi
else
	if [[ ! -L ~/.config/ptpython/config.py ]]; then
		mkdir -p ~/.config/ptpython
		ln -sf ${AP_SCRIPTO_COMMON_DIR}/vendors/ptpython/ap_config.py ~/.config/ptpython/config.py
	fi
fi
