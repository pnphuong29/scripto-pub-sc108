# https://gitlab.com/gitlab-org/cli#installation
export AP_VENDORS_GITLAB_CLI_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/gitlab-cli"
export AP_VENDORS_GITLAB_CLI_SETUP_CONFIGS_DIR="${AP_VENDORS_X_SETUP_DIR}/configs"
export AP_VENDORS_GITLAB_CLI_REPO_URL="https://gitlab.com/gitlab-org/cli"
export AP_VENDORS_GITLAB_CLI_GL_DIR="${AP_GL_DIR}/gitlab.com"

if ! type glab &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Installing [gitlab-cli] using [brew]\n"
        brew install glab

        if brew list --versions | grep glab &>/dev/null; then
            @logshowpassed "[gitlab-cli] has been installed successfully using [brew]\n"
        else
            @logshowfailed "[gitlab-cli] has been installed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Installing [gitlab-cli] using [apt]\n"
        wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1>/dev/null
        echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
        sudo apt update
        sudo apt install -y glab

        if type glab &>/dev/null; then
            @logshowpassed "[gitlab-cli] has been installed successfully using [apt]\n"
        else
            @logshowfailed "[gitlab-cli] has been installed unsuccessfully using [apt]\n"
        fi
    fi
fi
