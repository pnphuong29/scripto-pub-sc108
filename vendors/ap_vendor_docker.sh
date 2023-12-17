alias @initdocker="ap_func_init_docker"
ap_func_init_docker() {
    if alias @initdockercommon &>/dev/null; then
        @initdockercommon
    fi
}

alias @createdirstructdocker="ap_func_create_dirstruct_docker"
ap_func_create_dirstruct_docker() {
    # Append current user to group [docker] to prevent typing sudo for every docker command
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        @logshow "Append user [${USER}] to group [docker]\n"
        sudo usermod -aG docker "${USER}"
    fi

    if alias @createdirstructdockercommon &>/dev/null; then
        @createdirstructdockercommon
    fi
}

alias @rmdirstructdocker="ap_func_remove_dirstruct_docker"
ap_func_remove_dirstruct_docker() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        @logshow "Remove group [docker]\n"
        sudo groupdel docker
    fi

    if alias @rmdirstructdockercommon &>/dev/null; then
        @rmdirstructdockercommon
    fi
}

alias @setupdocker="ap_func_setup_docker"
ap_func_setup_docker() {
    # https://docs.docker.com/engine/install/ubuntu/
    # https://docs.docker.com/compose/install/
    @logshow "Install [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask docker
        # curl -SOL https://desktop.docker.com/mac/main/amd64/Docker.dmg # Intel chip
        # curl -SOL https://desktop.docker.com/mac/main/arm64/Docker.dmg # Apple chip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y \
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

        # Remove old versions (keep data)
        sudo apt remove -y docker docker-engine docker.io containerd runc

        # Install docker
        sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        # cd "${AP_TMP_DIR}"
        # curl -fsSL https://get.docker.com -o get-docker.sh
        # DRY_RUN=1 sudo sh get-docker.sh

        # Install docker-compose v2
        # DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
        # mkdir -p $DOCKER_CONFIG/cli-plugins
        # curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
        # chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    fi

    if alias @createdirstructdocker &>/dev/null; then
        @createdirstructdocker
    fi
}

alias @rmdocker="ap_func_remove_docker"
ap_func_remove_docker() {
    @logshow "Remove [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask docker
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y docker-ce docker-ce-cli containerd.io
        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd
    fi

    if alias @rmdirstructdocker &>/dev/null; then
        @rmdirstructdocker
    fi
}
