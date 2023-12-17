# https://nginx.org/en/linux_packages.html

export AP_VENDORS_NGINX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nginx"
export AP_VENDORS_NGINX_SETUP_CONFIGS_DIR="${AP_VENDORS_NGINX_SETUP_DIR}/configs"

if ! type nginx &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [nginx] using [brew]\n"
		brew install nginx

		if brew list --versions | grep nginx &>/dev/null; then
			@logshowpassed "[nginx] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[nginx] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [nginx] using [apt]\n"

		# Install the prerequisites:
		sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring

		# Import an official nginx signing key so apt could verify the packages authenticity. Fetch the key
		curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null

		# Verify that the downloaded file contains the proper key
		gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

		@minfo "Output should be as followings\n"
		@minfo "pub   	rsa2048 2011-08-19 [SC] [expires: 2024-06-14]\n
						573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62\n
				uid		nginx signing key <signing-key@nginx.co\n"

		# Set up the apt repository for stable nginx packages
		echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

		# Install nginx
		sudo apt update
		sudo apt install -y nginx

		if type nginx &>/dev/null; then
			@logshowpassed "[nginx] has been installed successfully using [apt]\n"
		else
			@logshowfailed "[nginx] has been installed unsuccessfully using [apt]\n"
		fi
	fi
fi
