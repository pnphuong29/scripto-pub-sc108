alias apinitexa="ap_func_init_exa"
ap_func_init_exa() {
    alias exa1="exa -a --long --header --icons --group --group-directories-first"
    alias l="exa1 --all --git"
    alias lgit="exa1 --all --git"
    alias lmodified="exa1 --all --sort=modified"
    alias ld="exa1 --all -D"
    alias l2="exa1 --tree --level 2"
    alias ld2="exa1 --tree --level 2 -D"
    alias l3="exa1 --tree --level 3"
    alias ld3="exa1 --tree --level 3 -D"

    if alias apinitexashare &>/dev/null; then
        apinitexashare
    fi

    if alias apinitexacommon &>/dev/null; then
        apinitexacommon
    fi
}

alias apcreatedirstructexa="ap_func_create_dirstruct_exa"
ap_func_create_dirstruct_exa() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/exa] to [${AP_SOFT_DIR}/exa/bin/exa]\n"
    ln -sf "${AP_SOFT_DIR}/exa/bin/exa" "${AP_SOFT_DIR}/bin/exa"

    aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_exa.bash] to [${AP_SOFT_DIR}/exa/completions/exa.bash]\n"
    ln -sf "${AP_SOFT_DIR}/exa/completions/exa.bash" "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/exa.1] to [${AP_SOFT_DIR}/exa/exa.1]\n"
    ln -sf "${AP_SOFT_DIR}/exa/man/exa.1" "${AP_MAN_DIR}/man1/exa.1"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man5/exa_colors.5] to [${AP_SOFT_DIR}/exa/man/exa_colors.5]\n"
    ln -sf "${AP_SOFT_DIR}/exa/man/exa_colors.5" "${AP_MAN_DIR}/man5/exa_colors.5"

    if alias apcreatedirstructexashare &>/dev/null; then
        apcreatedirstructexashare
    fi

    if alias apcreatedirstructexacommon &>/dev/null; then
        apcreatedirstructexacommon
    fi

}

alias aprmdirstructexa="ap_func_rm_dirstruct_exa"
ap_func_rm_dirstruct_exa() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/exa]\n"
    rm -f "${AP_SOFT_DIR}/bin/exa"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_exa.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"

    aplogshow "Remove [${AP_MAN_DIR}/man1/exa.1]\n"
    rm -f "${AP_MAN_DIR}/man1/exa.1"

    aplogshow "Remove [${AP_MAN_DIR}/man5/exa_colors.5]\n"
    rm -f "${AP_MAN_DIR}/man5/exa_colors.5"

    if alias aprmdirstructexashare &>/dev/null; then
        aprmdirstructexashare
    fi

    if alias aprmdirstructexacommon &>/dev/null; then
        aprmdirstructexacommon
    fi
}

alias apcreateglobalsymlinkexa="ap_func_create_global_symlink_exa"
ap_func_create_global_symlink_exa() {
    if [ -f "${AP_SOFT_DIR}/bin/exa" ]; then
        aplogshow "Create symlink from [/usr/local/bin/exa] to [${AP_SOFT_DIR}/bin/exa]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/exa" "/usr/local/bin/exa"
    fi
}

alias aprmglobalsymlinkexa="ap_func_rm_global_symlink_exa"
ap_func_rm_global_symlink_exa() {
    if [ -f "/usr/local/bin/exa" ]; then
        aplogshow "Remove [/usr/local/bin/exa]\n"
        sudo rm -f "/usr/local/bin/exa"
    fi
}

alias apsetupexa="ap_func_setup_exa"
ap_func_setup_exa() {
    # https://github.com/ogham/exa
    # https://pandoc.org
    # https://github.com/rust-lang/git2-rs
    # https://github.com/casey/just
    # Dependencies: just (rust), pandoc, libgit2 (rust), git-delta (rust)
    aplogshow "Install [exa]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/exa"

    # Install exa
    mkdir -p "${AP_SOFT_DIR}/exa"
    cd "${AP_SOFT_DIR}/exa"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/ogham/exa/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos" | grep x86_64 | grep -v sha256)" >exa.zip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/ogham/exa/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >exa.zip
    fi

    unzip exa.zip
    rm -f exa.zip

    apinitexa

    if alias apcreatedirstructexa &>/dev/null; then
        apcreatedirstructexa
    fi
}

alias aprmexa="ap_func_rm_exa"
ap_func_rm_exa() {
    aplogshow "Remove [exa]\n"
    rm -rf "${AP_SOFT_DIR}/exa"

    if alias aprmdirstructexa &>/dev/null; then
        aprmdirstructexa
    fi

    if alias aprmglobalsymlinkexa &>/dev/null; then
        aprmglobalsymlinkexa
    fi
}
