# https://www.vagrantup.com/docs/installation/uninstallation

export AP_VENDORS_RUBY_VAGRANT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-vagrant"
export AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR="${AP_VENDORS_RUBY_VAGRANT_SETUP_DIR}/configs"

if type vagrant &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [vagrant] using [brew]\n"
		brew uninstall vagrant
		sudo rm -rf /opt/vagrant /usr/local/bin/vagrant
		sudo pkgutil --forget com.vagrant.vagrant
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [vagrant] using [apt]\n"
		sudo apt purge -y vagrant
		sudo apt autoremove -y
		sudo rm -rf /opt/vagrant
		sudo rm -f /usr/bin/vagrant
	fi

	if ! type vagrant &>/dev/null; then
		@logshowpassed "[vagrant] has been removed successfully using [brew]\n"
	else
		@logshowfailed "[vagrant] has been removed unsuccessfully using [brew]\n"
	fi

	# Remove all vagrant data (boxes, etc.)
	rm -rf ~/.vagrant.d

	# Autocomplete
	rm -f "${AP_COMPLETIONS_DIR}/ap_completion_ruby_vagrant.bash"
fi
