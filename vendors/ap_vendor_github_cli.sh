alias apinitgithubcli="ap_func_init_github_cli"
ap_func_init_github_cli() {
    apaddpath -m "${AP_SOFT_DIR}/github-cli/share/man"

    if alias apinitgithubclishare &>/dev/null; then
        apinitgithubclishare
    fi

    if alias apinitgithubclicommon &>/dev/null; then
        apinitgithubclicommon
    fi
}

alias apcreatedirstructgithubcli="ap_func_create_dirstruct_github_cli"
ap_func_create_dirstruct_github_cli() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/gh] to [${AP_SOFT_DIR}/github-cli/bin/gh]\n"
    ln -sf "${AP_SOFT_DIR}/github-cli/bin/gh" "${AP_SOFT_DIR}/bin/gh"

    aplogshow "Generate [github_cli] bash autocomplete\n"
    "${AP_SOFT_DIR}/bin/gh" completion --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_github_cli.bash"

    if alias apcreatedirstructgithubclishare &>/dev/null; then
        apcreatedirstructgithubclishare
    fi

    if alias apcreatedirstructgithubclicommon &>/dev/null; then
        apcreatedirstructgithubclicommon
    fi
}

alias aprmdirstructgithubcli="ap_func_rm_dirstruct_github_cli"
ap_func_rm_dirstruct_github_cli() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_github_cli.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_github_cli.bash"

    aplogshow "Remove [${AP_SOFT_DIR}/bin/gh]\n"
    rm -f "${AP_SOFT_DIR}/bin/gh"

    if alias aprmdirstructgithubclishare &>/dev/null; then
        aprmdirstructgithubclishare
    fi

    if alias aprmdirstructgithubclicommon &>/dev/null; then
        aprmdirstructgithubclicommon
    fi
}

alias apsetupgithubcli="ap_func_setup_github_cli"
ap_func_setup_github_cli() {
    aplogshow "Install [GitHub cli]\n"

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
    # rm -rf "${AP_TMP_DIR}/github-cli"

    apinitgithubcli
    if alias apcreatedirstructgithubcli &>/dev/null; then
        apcreatedirstructgithubcli
    fi
}

alias aprmgithubcli="ap_func_rm_github_cli"
ap_func_rm_github_cli() {
    aplogshow "Remove [GitHub cli]\n"
    rm -rf "${AP_SOFT_DIR}/github-cli"

    if alias aprmdirstructgithubcli &>/dev/null; then
        aprmdirstructgithubcli
    fi

    if alias aprmglobalsymlinkgithubcli &>/dev/null; then
        aprmglobalsymlinkgithubcli
    fi
}
