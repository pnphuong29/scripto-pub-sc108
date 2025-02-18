alias apinitgitlabrunner="ap_func_init_gitlabrunner"
ap_func_init_gitlabrunner() {
    alias glabrunner="gitlab-runner"

    if alias apinitgitlabrunnershare &>/dev/null; then
        apinitgitlabrunnershare
    fi

    if alias apinitgitlabrunnercommon &>/dev/null; then
        apinitgitlabrunnercommon
    fi
}

alias apcreatedirstructgitlabrunner="ap_func_create_dirstruct_gitlabrunner"
ap_func_create_dirstruct_gitlabrunner() {
    if alias apcreatedirstructgitlabrunnershare &>/dev/null; then
        apcreatedirstructgitlabrunnershare
    fi

    if alias apcreatedirstructgitlabrunnercommon &>/dev/null; then
        apcreatedirstructgitlabrunnercommon
    fi
}

alias aprmdirstructgitlabrunner="ap_func_rm_dirstruct_gitlabrunner"
ap_func_rm_dirstruct_gitlabrunner() {
    if alias aprmdirstructgitlabrunnershare &>/dev/null; then
        aprmdirstructgitlabrunnershare
    fi

    if alias aprmdirstructgitlabrunnercommon &>/dev/null; then
        aprmdirstructgitlabrunnercommon
    fi
}

alias apsetupgitlabrunner="ap_func_setup_gitlabrunner"
ap_func_setup_gitlabrunner() {
    # https://docs.gitlab.com/runner/install/linux-manually.html#using-binary-file
    # https://docs.gitlab.com/runner/install/osx.html
    aplogshow "Install [gitlab-runner]\n"

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
        curl -SL "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64" >/usr/local/bin/gitlab-runner
        sudo chmod +x /usr/local/bin/gitlab-runner
        gitlab-runner install
        gitlab-runner start
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64" >/usr/local/bin/gitlab-runner
        sudo chmod +x /usr/local/bin/gitlab-runner
        sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
        sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
        sudo gitlab-runner start
    fi

    apinitgitlabrunner
    if alias apcreatedirstructgitlabrunner &>/dev/null; then
        apcreatedirstructgitlabrunner
    fi
}

alias aprmgitlabrunner="ap_func_rm_gitlabrunner"
ap_func_rm_gitlabrunner() {
    aplogshow "Remove [gitlab-runner]\n"
    sudo rm -f /usr/local/bin/gitlab-runner

    if alias aprmdirstructgitlabrunner &>/dev/null; then
        aprmdirstructgitlabrunner
    fi

    if alias aprmglobalsymlinkgitlabrunner &>/dev/null; then
        aprmglobalsymlinkgitlabrunner
    fi
}
