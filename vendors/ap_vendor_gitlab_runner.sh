alias @initgitlabrunner="ap_func_init_gitlabrunner"
ap_func_init_gitlabrunner() {
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
    # https://docs.gitlab.com/runner/install/
    # https://gitlab-runner-downloads.s3.amazonaws.com/latest/index.html
    @logshow "Install [gitlab-runner]\n"

    # https://docs.gitlab.com/runner/install/osx.html#limitations-on-macos
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64 >"${AP_SOFT_DIR}/bin/gitlab-runner"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 >"${AP_SOFT_DIR}/bin/gitlab-runner"
    fi

    chmod +x "${AP_SOFT_DIR}/bin/gitlab-runner"

    @initgitlabrunner
    if alias @createdirstructgitlabrunner &>/dev/null; then
        @createdirstructgitlabrunner
    fi
}

alias @rmgitlabrunner="ap_func_rm_gitlabrunner"
ap_func_rm_gitlabrunner() {
    @logshow "Remove [gitlabrunner]\n"
    rm -f "${AP_SOFT_DIR}/bin/gitlab-runner"

    if alias @rmdirstructgitlabrunner &>/dev/null; then
        @rmdirstructgitlabrunner
    fi

    if alias @rmglobalsymlinkgitlabrunner &>/dev/null; then
        @rmglobalsymlinkgitlabrunner
    fi
}
