export AP_VENDORS_NVIM_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nvim"
export AP_VENDORS_NVIM_SETUP_CONFIGS_DIR="${AP_VENDORS_NVIM_SETUP_DIR}/configs"
export AP_VENDORS_NVIM_REPO_URL="https://github.com/neovim/neovim"
export AP_VENDORS_NVIM_DIR="${AP_SOFT_DIR}/nvim"

if type nvim &>/dev/null; then
	@logshow "Removing [nvim]\n"

	rm -rf "${AP_VENDORS_NVIM_DIR}"
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.config/coc

	rm -f "${AP_SYMLINKS_DIR}/init.vim"
	rm -f "${AP_SYMLINKS_DIR}/python3"
	sudo rm -f /usr/local/bin/nvim

	if [[ ! -d "${AP_VENDORS_NVIM_DIR}" && ! -d ~/.config/nvim && ! -d ~/.local/share/nvim && ! -d ~/.config/coc ]]; then
		@logshowpassed "[nvim] has been removed successfully\n"
	else
		@logshowfailed "[nvim] has been removed unsuccessfully\n"
	fi
fi
