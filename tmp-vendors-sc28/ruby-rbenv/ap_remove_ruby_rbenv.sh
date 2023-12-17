# https://github.com/rbenv/rbenv

export AP_VENDORS_RUBY_RBENV_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-rbenv"
export AP_VENDORS_RUBY_RBENV_SETUP_CONFIGS_DIR="${AP_VENDORS_RUBY_RBENV_SETUP_DIR}/configs"
export AP_VENDORS_RUBY_RBENV_REPO_URL="https://github.com/mernen/completion-ruby"
export AP_VENDORS_RUBY_RBENV_GH_DIR="${AP_GH_DIR}/mernen/completion-ruby"

if type rbenv &>/dev/null; then
	@logshow "Removing [rbenv]\n"

	rm -rf "${HOME}/.rbenv"
	rm -rf "${AP_VENDORS_RUBY_RBENV_GH_DIR}"

	if [[ ! -d "${HOME}/.rbenv" ]]; then
		@logshowpassed "[rbenv] has been removed successfully\n"
	else
		@logshowfailed "[rbenv] has been removed unsuccessfully\n"
	fi
fi
