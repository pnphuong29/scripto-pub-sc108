# https://github.com/chubin/cheat.sh

export AP_VENDORS_CHT_SH_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/cht-sh"
export AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR="${AP_VENDORS_CHT_SH_SETUP_DIR}/configs"
export CHTSH_CONF="${AP_SCRIPTO_COMMON_DIR}/vendors/cht-sh/ap_cht_sh.conf"

# Bash completion
if [[ -f "${AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR}/ap_completion_cht_sh.bash" ]]; then
	source "${AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR}/ap_completion_cht_sh.bash"
fi

# Aliases
alias ref='cht.sh'
alias chtdemostyles='curl cht.sh/:styles-demo'
alias chtgeneratebashcompletions='curl -SsL "https://cheat.sh/:bash_completion" -o "${AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR}/ap_completion_cht_sh.bash"'
