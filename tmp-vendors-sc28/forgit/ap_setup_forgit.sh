# https://github.com/wfxr/forgit
# Dependencies: fzf, bat, delta

if ! type forgit &>/dev/null; then
	@logshow "Installing [forgit]\n"

	export FORGIT_INSTALL_DIR="${AP_GH_DIR}/wfxr/forgit"
	rm -rf "${FORGIT_INSTALL_DIR}"
	mkdir -p "${AP_GH_DIR}/wfxr"
	cd "${AP_GH_DIR}/wfxr"

	git clone https://github.com/wfxr/forgit.git
	@addpath "${FORGIT_INSTALL_DIR}/bin"
	source "${FORGIT_INSTALL_DIR}/forgit.plugin.sh"

	if [[ -f "${FORGIT_INSTALL_DIR}/bin/git-forgit" ]]; then
		@logshowpassed "[forgit] has been installed successfully\n"
	else
		@logshowfailed "[forgit] has been installed unsuccessfully\n"
	fi
fi
