# http://doxfer.webmin.com/Webmin/Installation

if ! type webmin &>/dev/null; then
	@logshow "Installing [webmin] using [apt]\n"

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
		sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
		sudo apt update
		sudo apt install -y webmin
	fi

	if type webmin &>/dev/null; then
		@logshowpassed "[webmin] has been installed successfully using [apt]\n"
	else
		@logshowfailed "[webmin] has been installed unsuccessfully using [apt]\n"
	fi
fi
