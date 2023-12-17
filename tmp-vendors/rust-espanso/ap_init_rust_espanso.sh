# https://espanso.org/docs/get-started/

export AP_VENDORS_RUST_ESPANSO_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-espanso"
export AP_VENDORS_RUST_ESPANSO_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/configs"
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	export AP_ESPANSO_CONFIGS_DIR="$("$(brew --prefix)/bin/espanso" path config)"
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	export AP_ESPANSO_CONFIGS_DIR="$("${AP_SOFT_DIR}/bin/espanso" path config)"
fi

export AP_VENDORS_ESPANSO_GH_DIR="${AP_GH_DIR}/federico-terzi/espanso"

# Override default config file
cp "${AP_VENDORS_RUST_ESPANSO_SETUP_CONFIGS_DIR}/ap_default.config.yml" "${AP_ESPANSO_CONFIGS_DIR}/config/default.yml"

# Symlink match files
ln -sf "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/match/ap_base.match.yml" "${AP_ESPANSO_CONFIGS_DIR}/match/base.yml"
ln -sf "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/match/ap_general.match.yml" "${AP_ESPANSO_CONFIGS_DIR}/match/ap_general.match.yml"

# Aliases
alias zespansosetupdir='cd "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}"'
alias zespansosetupconfigsdir='cd "${AP_VENDORS_RUST_ESPANSO_SETUP_CONFIGS_DIR}"'
alias viespansomatch-sc='vi "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/match/ap_scripts.match.yml"'
alias viespansomatch-sn7='vi "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/match/ap_sn7.match.yml"'
alias viespansomatch-others='vi "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/match/ap_others.match.yml"'
alias viespansomatch-tests='vi "${AP_VENDORS_RUST_ESPANSO_SETUP_DIR}/match/ap_tests.match.yml"'
alias viespansoconfigs='vi "${AP_VENDORS_RUST_ESPANSO_SETUP_CONFIGS_DIR}/ap_default.config.yml"'
