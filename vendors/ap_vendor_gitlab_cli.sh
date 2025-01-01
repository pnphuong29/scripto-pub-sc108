alias apinitgitlabcli="ap_func_init_gitlabcli"
ap_func_init_gitlabcli() {
    alias zglabconfig="cd ${HOME}/.config/glab-cli"
    alias glabauthstatus='glab auth status'
    alias glabversion='glab version'

    if alias apinitgitlabclishare &>/dev/null; then
        apinitgitlabclishare
    fi

    if alias apinitgitlabclicommon &>/dev/null; then
        apinitgitlabclicommon
    fi
}

alias apcreatedirstructgitlabcli="ap_func_create_dirstruct_gitlabcli"
ap_func_create_dirstruct_gitlabcli() {
    aplogshow "Generate [gitlab cli] bash autocomplete\n"
    glab completion --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_glab.bash"

    if alias apcreatedirstructgitlabclishare &>/dev/null; then
        apcreatedirstructgitlabclishare
    fi

    if alias apcreatedirstructgitlabclicommon &>/dev/null; then
        apcreatedirstructgitlabclicommon
    fi
}

alias aprmdirstructgitlabcli="ap_func_rm_dirstruct_gitlabcli"
ap_func_rm_dirstruct_gitlabcli() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_glab.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_glab.bash"

    if alias aprmdirstructgitlabclishare &>/dev/null; then
        aprmdirstructgitlabclishare
    fi

    if alias aprmdirstructgitlabclicommon &>/dev/null; then
        aprmdirstructgitlabclicommon
    fi
}

alias apsetupgitlabcli="ap_func_setup_gitlabcli"
ap_func_setup_gitlabcli() {
    # https://gitlab.com/gitlab-org/cli#installation
    aplogshow "Install [GitLab cli]\n"

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

    apinitgitlabcli
    if alias apcreatedirstructgitlabcli &>/dev/null; then
        apcreatedirstructgitlabcli
    fi
}

alias aprmgitlabcli="ap_func_rm_gitlabcli"
ap_func_rm_gitlabcli() {
    aplogshow "Remove [GitLab cli]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew uninstall glab
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt purge -y glab
    # fi

    rm -rf "${GOPATH}/pkg/mod/gitlab.com/gitlab-org/cli/cmd/glab@"*
    rm -f "${GOPATH}/bin/glab"

    if alias aprmdirstructgitlabcli &>/dev/null; then
        aprmdirstructgitlabcli
    fi
}
