alias @initgithubcli="ap_func_init_github_cli"
ap_func_init_github_cli() {
    @addpath -m "${AP_SOFT_DIR}/github-cli/share/man"
    alias lsghrepos='gh repo list --limit 200'

    if alias @initgithubclishare &>/dev/null; then
        @initgithubclishare
    fi

    if alias @initgithubclicommon &>/dev/null; then
        @initgithubclicommon
    fi
}

alias @createdirstructgithubcli="ap_func_create_dirstruct_github_cli"
ap_func_create_dirstruct_github_cli() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/gh] to [${AP_SOFT_DIR}/github-cli/bin/gh]\n"
    ln -sf "${AP_SOFT_DIR}/github-cli/bin/gh" "${AP_SOFT_DIR}/bin/gh"

    @logshow "Generate [github_cli] bash autocomplete\n"
    gh completion --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_github_cli.bash"

    if alias @createdirstructgithubclishare &>/dev/null; then
        @createdirstructgithubclishare
    fi

    if alias @createdirstructgithubclicommon &>/dev/null; then
        @createdirstructgithubclicommon
    fi
}

alias @rmdirstructgithubcli="ap_func_remove_dirstruct_github_cli"
ap_func_remove_dirstruct_github_cli() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_github_cli.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_github_cli.bash"

    @logshow "Remove [${AP_SOFT_DIR}/bin/gh]\n"
    rm -f "${AP_SOFT_DIR}/bin/gh"

    if alias @rmdirstructgithubclishare &>/dev/null; then
        @rmdirstructgithubclishare
    fi

    if alias @rmdirstructgithubclicommon &>/dev/null; then
        @rmdirstructgithubclicommon
    fi
}

alias @setupgithubcli="ap_func_setup_github_cli"
ap_func_setup_github_cli() {
    @logshow "Install [GitHub cli]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/github-cli"
    rm -rf "${AP_TMP_DIR}/github-cli"

    # Install GitHub cli
    mkdir -p "${AP_TMP_DIR}/github-cli"
    cd "${AP_TMP_DIR}/github-cli"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/cli/cli/releases | jq -r '.[0].assets[].browser_download_url' | grep "macOS_amd64.zip$")" >gh.zip
        unzip gh.zip
        rm -f gh.zip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/cli/cli/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux_amd64.tar.gz$")" >gh.tar.gz
        tar -zxf gh.tar.gz
        rm -f gh.tar.gz
    fi

    mv gh* github-cli
    mv github-cli "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/github-cli"

    @initgithubcli
    if alias @createdirstructgithubcli &>/dev/null; then
        @createdirstructgithubcli
    fi
}

alias @rmgithubcli="ap_func_remove_github_cli"
ap_func_remove_github_cli() {
    @logshow "Remove [GitHub cli]\n"
    rm -rf "${AP_SOFT_DIR}/github-cli"

    if alias @rmdirstructgithubcli &>/dev/null; then
        @rmdirstructgithubcli
    fi

    if alias @rmglobalsymlinkgithubcli &>/dev/null; then
        @rmglobalsymlinkgithubcli
    fi
}
