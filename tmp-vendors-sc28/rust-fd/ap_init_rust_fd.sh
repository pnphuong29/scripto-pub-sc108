# https://github.com/sharkdp/fd
# Dependencies: ghq

export AP_VENDORS_RUST_FD_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-fd"
export AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_FD_SETUP_DIR}/configs"
export AP_VENDORS_FD_REPO_NAME="sharkdp/fd"
export AP_VENDORS_FD_REPO_URL="https://github.com/${AP_VENDORS_FD_REPO_NAME}"

if [[ "${USER}" != 'root' ]]; then
	# if type cargo &>/dev/null; then
	export AP_VENDORS_RUST_FD_DIR="${AP_GH_DIR}/${AP_VENDORS_FD_REPO_NAME}"
	# @addpath "${AP_VENDORS_RUST_FD_DIR}/target/release"

	# Autocomplete
	ap_tmp="$(gfind ${AP_VENDORS_RUST_FD_DIR} -name 'fd.bash' | grep release)"
	if [[ -f "${ap_tmp}" ]]; then
		source "${ap_tmp}"
	else
		# @merr "fd bash completion file [${ap_tmp}] not found!\n"
		source "${AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR}/fd.bash"
	fi

	[[ ! -d "${HOME}/.config/fd" ]] && mkdir -p "${HOME}/.config/fd"

	if [[ -f "${AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR}/fd.ignore" ]]; then
		ln -sf "${AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR}/fd.ignore" "${HOME}/.config/fd/ignore"
	else
		@merr "File [${AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR}/fd.ignore] not found!\n"
	fi
fi

# Aliases
alias fd="fd --hidden --no-ignore"
alias fdls='fd --max-depth 1 --list-details'
alias fdexclude="fd --hidden --no-ignore --exclude .git --exclude node_modules"
