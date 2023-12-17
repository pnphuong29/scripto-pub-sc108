export AP_BPYTHON_HISTORY_DIR="${AP_SCRIPTO_MAIN_DIR}/data/bpython/$(hostname)"
[[ ! -d "${AP_BPYTHON_HISTORY_DIR}" ]] && mkdir -p "${AP_BPYTHON_HISTORY_DIR}"

export AP_BPYTHON_HISTORY_FILE="${AP_BPYTHON_HISTORY_DIR}/bpython_history.py"
[[ ! -f "${AP_BPYTHON_HISTORY_FILE}" ]] && touch "${AP_BPYTHON_HISTORY_FILE}"

if [[ ! -L ~/.pythonhist ]]; then
	ln -sf "${AP_BPYTHON_HISTORY_FILE}" ~/.pythonhist
fi

alias viscbpy="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/bpython/ap_init_bpython.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/bpython/ap_bpython.config"

alias bp='bpython'

if [[ ! -L ~/.config/bpython/config ]]; then
	mkdir -p ~/.config/bpython
	ln -sf ${AP_SCRIPTO_COMMON_DIR}/vendors/bpython/ap_bpython.config ~/.config/bpython/config
fi
