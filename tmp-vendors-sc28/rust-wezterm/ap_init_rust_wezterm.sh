# https://wezfurlong.org/wezterm/installation.html

export AP_VENDORS_RUST_WEZTERM_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-wezterm"
export AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_WEZTERM_SETUP_DIR}/configs"
export AP_VENDORS_RUST_WEZTERM_REPO_URL="https://github.com/wez/wezterm"
export AP_VENDORS_RUST_WEZTERM_GH_DIR="${AP_GH_DIR}/wez/wezterm"

# export WEZTERM_CONFIG_FILE="${AP_VENDORS_WEZTERM_SETUP_CONFIGS_DIR}/ap_wezterm.config.lua"
ln -sf "${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_wezterm.config.lua" ~/.wezterm.lua
source "${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_completion_wezterm.bash"

alias weztermgenerate-bash-completions='wezterm shell-completion --shell bash >"${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_completion_wezterm.bash"'

# https://wezfurlong.org/wezterm/config/lua/config/term.html
alias weztermgenerate-terminfo='curl -SL "https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo" >"${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_wezterm.terminfo"'

alias viscwezterm="vi -p \
	${AP_VENDORS_RUST_WEZTERM_SETUP_DIR}/ap_init_rust_wezterm.sh \
	${AP_VENDORS_RUST_WEZTERM_SETUP_DIR}/ap_setup_rust_wezterm.sh \
	${AP_VENDORS_RUST_WEZTERM_SETUP_DIR}/ap_remove_rust_wezterm.sh \
	${AP_VENDORS_RUST_WEZTERM_SETUP_CONFIGS_DIR}/ap_wezterm.config.lua \
	"
