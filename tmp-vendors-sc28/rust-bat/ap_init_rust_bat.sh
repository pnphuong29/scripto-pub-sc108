# https://github.com/sharkdp/bat

export AP_VENDORS_BAT_DIR="${AP_SOFT_DIR}/bat"
export BAT_CONFIG_PATH="${AP_SCRIPTO_COMMON_DIR}/vendors/bat/ap_rust_bat.conf"
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
# export BAT_THEME="Visual Studio Dark+"
# export BAT_STYLE="numbers,changes,header"
# export BAT_PAGER="less -RF"

@addpath "${AP_VENDORS_BAT_DIR}"

if [[ "${USER}" != 'root' ]]; then
	source "${AP_VENDORS_BAT_DIR}/autocomplete/bat.bash"
fi
