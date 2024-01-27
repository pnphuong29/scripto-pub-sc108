alias @initgitlabcli="ap_func_init_gitlabcli"
ap_func_init_gitlabcli() {
    # export GLAB_CONFIG_DIR="${HOME}/.config/glab-cli/config.yml"

    if alias @initgitlabclishare &>/dev/null; then
        @initgitlabclishare
    fi

    if alias @initgitlabclicommon &>/dev/null; then
        @initgitlabclicommon
    fi
}

alias @createdirstructgitlabcli="ap_func_create_dirstruct_gitlabcli"
ap_func_create_dirstruct_gitlabcli() {
    @logshow "Generate [gitlab cli] bash autocomplete\n"
    glab completion --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_glab.bash"

    if alias @createdirstructgitlabclishare &>/dev/null; then
        @createdirstructgitlabclishare
    fi

    if alias @createdirstructgitlabclicommon &>/dev/null; then
        @createdirstructgitlabclicommon
    fi
}

alias @rmdirstructgitlabcli="ap_func_rm_dirstruct_gitlabcli"
ap_func_rm_dirstruct_gitlabcli() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_glab.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_glab.bash"

    if alias @rmdirstructgitlabclishare &>/dev/null; then
        @rmdirstructgitlabclishare
    fi

    if alias @rmdirstructgitlabclicommon &>/dev/null; then
        @rmdirstructgitlabclicommon
    fi
}

alias @setupgitlabcli="ap_func_setup_gitlabcli"
ap_func_setup_gitlabcli() {
    # https://gitlab.com/gitlab-org/cli#installation
    @logshow "Install [GitLab cli]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew install glab
    #     # curl -s "https://gitlab.com/gitlab-org/cli/-/raw/main/scripts/install.sh" | sudo sh
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1>/dev/null
    #     echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
    #     sudo apt update
    #     sudo apt install -y glab
    # fi

    go install gitlab.com/gitlab-org/cli/cmd/glab@main

    @initgitlabcli
    if alias @createdirstructgitlabcli &>/dev/null; then
        @createdirstructgitlabcli
    fi
}

alias @rmgitlabcli="ap_func_rm_gitlabcli"
ap_func_rm_gitlabcli() {
    @logshow "Remove [GitLab cli]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew uninstall glab
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt purge -y glab
    # fi

    rm -rf "${GOPATH}/pkg/mod/gitlab.com/gitlab-org/cli/cmd/glab@"*
    rm -f "${GOPATH}/bin/glab"

    if alias @rmdirstructgitlabcli &>/dev/null; then
        @rmdirstructgitlabcli
    fi
}
