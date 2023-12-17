# https://www.vagrantup.com/downloads
# https://www.vagrantup.com/docs/installation/source

export AP_VENDORS_RUBY_VAGRANT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ruby-vagrant"
export AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR="${AP_VENDORS_RUBY_VAGRANT_SETUP_DIR}/configs"

if ! type vagrant &>/dev/null; then
	@logshow "Installing [vagrant]\n"

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		brew install vagrant
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
		sudo apt-add-repository -y "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
		sudo apt update
		sudo apt install -y vagrant
	fi

	# Autocomplete
	@logshow "Installing vagrant completion\n"
	curl -SL "https://raw.githubusercontent.com/hashicorp/vagrant/main/contrib/bash/completion.sh" >"${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"

	grep "complete -o default -F _vagrant vg" "${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash" &>/dev/null
	if [[ "$?" != 0 ]]; then
		echo >>"${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"
		echo "complete -o default -F _vagrant vg # vg is an alias of 'vagrant' command" >>"${AP_VENDORS_RUBY_VAGRANT_SETUP_CONFIGS_DIR}/ap_completion_ruby_vagrant.bash"
	fi

	if type vagrant &>/dev/null; then
		@logshowpassed "[vagrant] has been installed successfully\n"
	else
		@logshowfailed "[vagrant] has been installed unsuccessfully\n"
	fi
fi
