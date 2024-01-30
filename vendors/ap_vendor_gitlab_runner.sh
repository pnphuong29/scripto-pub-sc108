alias @initgitlabrunner="ap_func_init_gitlabrunner"
ap_func_init_gitlabrunner() {
    alias glabrunner="gitlab-runner"

    if alias @initgitlabrunnershare &>/dev/null; then
        @initgitlabrunnershare
    fi

    if alias @initgitlabrunnercommon &>/dev/null; then
        @initgitlabrunnercommon
    fi
}

alias @createdirstructgitlabrunner="ap_func_create_dirstruct_gitlabrunner"
ap_func_create_dirstruct_gitlabrunner() {
    if alias @createdirstructgitlabrunnershare &>/dev/null; then
        @createdirstructgitlabrunnershare
    fi

    if alias @createdirstructgitlabrunnercommon &>/dev/null; then
        @createdirstructgitlabrunnercommon
    fi
}

alias @rmdirstructgitlabrunner="ap_func_rm_dirstruct_gitlabrunner"
ap_func_rm_dirstruct_gitlabrunner() {
    if alias @rmdirstructgitlabrunnershare &>/dev/null; then
        @rmdirstructgitlabrunnershare
    fi

    if alias @rmdirstructgitlabrunnercommon &>/dev/null; then
        @rmdirstructgitlabrunnercommon
    fi
}

alias @setupgitlabrunner="ap_func_setup_gitlabrunner"
ap_func_setup_gitlabrunner() {
    # https://docs.gitlab.com/runner/install/linux-manually.html#using-binary-file
    # https://docs.gitlab.com/runner/install/osx.html
    @logshow "Install [gitlab-runner]\n"

    # Stop gitlab-runner before upgrading
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f /usr/local/bin/gitlab-runner ]; then
            gitlab-runner stop
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f /usr/local/bin/gitlab-runner ]; then
            sudo gitlab-runner stop
        fi
    fi

    # https://docs.gitlab.com/runner/install/osx.html#limitations-on-macos
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64 >/usr/local/bin/gitlab-runner"
        sudo chmod +x /usr/local/bin/gitlab-runner
        gitlab-runner install
        gitlab-runner start
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 >/usr/local/bin/gitlab-runner"
        sudo chmod +x /usr/local/bin/gitlab-runner
        sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
        sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
        sudo gitlab-runner start
    fi

    @initgitlabrunner
    if alias @createdirstructgitlabrunner &>/dev/null; then
        @createdirstructgitlabrunner
    fi
}

alias @rmgitlabrunner="ap_func_rm_gitlabrunner"
ap_func_rm_gitlabrunner() {
    @logshow "Remove [gitlab-runner]\n"
    sudo rm -f /usr/local/bin/gitlab-runner

    if alias @rmdirstructgitlabrunner &>/dev/null; then
        @rmdirstructgitlabrunner
    fi

    if alias @rmglobalsymlinkgitlabrunner &>/dev/null; then
        @rmglobalsymlinkgitlabrunner
    fi
}
