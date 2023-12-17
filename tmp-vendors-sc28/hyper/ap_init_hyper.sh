# https://hyper.is/#cfg

export AP_VENDORS_HYPER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/hyper"
export AP_VENDORS_HYPER_SETUP_CONFIGS_DIR="${AP_VENDORS_HYPER_SETUP_DIR}/configs"
export AP_VENDORS_HYPER_REPO_URL="https://github.com/vercel/hyper"
export AP_VENDORS_HYPER_GH_DIR="${AP_GH_DIR}/vercel/hyper"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    [[ ! -d "${HOME}/Library/Application Support/Hyper" ]] && mkdir -p "${HOME}/Library/Application Support/Hyper"
    export AP_HYPER_CONFIG_FILE_PATH="${HOME}/Library/Application Support/Hyper/.hyper.js"
    # export AP_VENDORS_HYPER_SETUP_CONFIG_FILE="${AP_VENDORS_HYPER_SETUP_DIR}/configs/ap_hyper_macos.config.js"
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    [[ ! -d "${HOME}/.config/Hyper" ]] && mkdir -p "${HOME}/.config/Hyper"
    export AP_HYPER_CONFIG_FILE_PATH="${HOME}/.config/Hyper/.hyper.js"
    # export AP_VENDORS_HYPER_SETUP_CONFIG_FILE="${AP_VENDORS_HYPER_SETUP_DIR}/configs/ap_hyper_linux.config.js"
fi

export AP_VENDORS_HYPER_SETUP_CONFIG_FILE="${AP_VENDORS_HYPER_SETUP_DIR}/configs/ap_hyper.conf.js"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
    alias bkhyperconfigs='cp -f "${AP_HYPER_CONFIG_FILE_PATH}" "${AP_VENDORS_HYPER_SETUP_CONFIGS_DIR}/ap_hyper_macos.conf.js"'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    alias bkhyperconfigs='cp -f "${AP_HYPER_CONFIG_FILE_PATH}" "${AP_VENDORS_HYPER_SETUP_CONFIGS_DIR}/ap_hyper_linux.conf.js"'
fi

if [ ! -L "${AP_HYPER_CONFIG_FILE_PATH}" ]; then
    ln -sf "${AP_HYPER_CONFIG_FILE_PATH}" ~/.hyper.js
fi

if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    gsed -i "s@'Alt+\`'@'Alt+Shift+\`'@g" "${AP_HYPER_CONFIG_FILE_PATH}"
fi

alias vischyper="vi -p \
	${AP_VENDORS_HYPER_SETUP_DIR}/ap_init_hyper.sh \
	${AP_VENDORS_HYPER_SETUP_CONFIG_FILE} \
	"

alias hyperupdateconfigs='cp -f "${AP_VENDORS_HYPER_SETUP_CONFIG_FILE}" "${AP_HYPER_CONFIG_FILE_PATH}"'

alias dlhyper_keymaps_macos='curl -SL "https://raw.githubusercontent.com/vercel/hyper/canary/app/keymaps/darwin.json" >"${AP_VENDORS_HYPER_SETUP_CONFIGS_DIR}/origin/ap_keymaps_macos.config.json"'

alias dlhyper_keymaps_linux='curl -SL "https://raw.githubusercontent.com/vercel/hyper/canary/app/keymaps/linux.json" >"${AP_VENDORS_HYPER_SETUP_CONFIGS_DIR}/origin/ap_keymaps_linux.config.json"'

alias dlhyper_default_configs='curl -SL "https://raw.githubusercontent.com/vercel/hyper/canary/app/config/config-default.js" >"${AP_VENDORS_HYPER_SETUP_CONFIGS_DIR}/origin/ap_default.config.json"'
