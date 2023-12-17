# https://gitlab.com/gitlab-org/cli#installation
export AP_VENDORS_GITLAB_CLI_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/gitlab-cli"
export AP_VENDORS_GITLAB_CLI_SETUP_CONFIGS_DIR="${AP_VENDORS_X_SETUP_DIR}/configs"
export AP_VENDORS_GITLAB_CLI_REPO_URL="https://gitlab.com/gitlab-org/cli"
export AP_VENDORS_GITLAB_CLI_GL_DIR="${AP_GL_DIR}/gitlab.com"

if type glab &>/dev/null; then
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        @logshow "Removing [gitlab-cli] using [brew]\n"
        brew uninstall glab

        if ! brew list --versions | grep glab &>/dev/null; then
            @logshowpassed "[gitlab-cli] has been removed successfully using [brew]\n"
        else
            @logshowfailed "[gitlab-cli] has been removed unsuccessfully using [brew]\n"
        fi
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        @logshow "Removing [gitlab-cli] using [apt]\n"
        sudo apt purge -y glab

        if ! type glab &>/dev/null; then
            @logshowpassed "[gitlab-cli] has been removed successfully using [apt]\n"
        else
            @logshowfailed "[gitlab-cli] has been removed unsuccessfully using [apt]\n"
        fi
    fi
fi
