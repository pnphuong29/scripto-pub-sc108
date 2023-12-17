# https://docs.docker.com/engine/install/ubuntu/
# https://docs.docker.com/compose/install/

if ! type docker &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [docker] using [brew]\n"

		brew install --cask docker

		if brew list --versions | grep docker &>/dev/null; then
			@logshowpassed "[docker] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[docker] has been installed unsuccessfully using [brew]\n"
		fi
	else
		@logshow "Installing [docker]\n"

		sudo apt-get update
		sudo apt-get install -y \
			ca-certificates \
			curl \
			gnupg \
			lsb-release

		sudo mkdir -m 0755 -p /etc/apt/keyrings
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
		sudo chmod a+r /etc/apt/keyrings/docker.gpg

		echo \
			"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
			$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

		# cd "${AP_TMP_DIR}"
		# curl -fsSL https://get.docker.com -o get-docker.sh
		# DRY_RUN=1 sudo sh get-docker.sh

		# Install docker-compose v2
		# DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
		# mkdir -p $DOCKER_CONFIG/cli-plugins
		# curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
		# chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

		# Append docker group to current user's groups
		@minfo "Append group <docker> to current user\n"
		sudo usermod -aG docker "${USER}"

		if type docker &>/dev/null; then
			@logshowpassed "[docker] has been installed successfully\n"
		else
			@logshowfailed "[docker] has been installed unsuccessfully\n"
		fi
	fi
fi

# Install using docker repository
# Remove old versions (keep data)
# sudo apt-get remove docker docker-engine docker.io containerd runc

# sudo apt-get update
# sudo apt-get install \
# 	ca-certificates \
# 	curl \
# 	gnupg \
# 	lsb-release

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
# 	"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
