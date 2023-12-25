alias @initgitlabcli="ap_func_init_gitlabcli"
ap_func_init_gitlabcli() {
    # source <(glab completion --shell bash)
    if alias @initgitlabclicommon &>/dev/null; then
        @initgitlabclicommon
    fi
}

alias @setupgitlabcli="ap_func_setup_gitlabcli"
ap_func_setup_gitlabcli() {
    # https://gitlab.com/gitlab-org/cli#installation
    @logshow "Install [GitLab cli]\n"

    if ! type glab &>/dev/null; then
        if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
            brew install glab
        elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
            wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1>/dev/null
            echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
            sudo apt update
            sudo apt install -y glab
        fi
    fi

    if alias @createdirstructgitlabcli &>/dev/null; then
        @createdirstructgitlabcli
    fi
}

alias @rmgitlabcli="ap_func_remove_gitlabcli"
ap_func_remove_gitlabcli() {
    @logshow "Remove [GitLab cli]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall glab
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y glab
    fi

    if alias @rmdirstructgitlabcli &>/dev/null; then
        @rmdirstructgitlabcli
    fi
}
