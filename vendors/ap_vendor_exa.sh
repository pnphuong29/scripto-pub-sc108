alias @initexa="ap_func_init_exa"
ap_func_init_exa() {
    alias @exa="exa -a --long --header --icons --group --group-directories-first"
    alias @l="@exa --all"
    alias @ld="@exa --all -D"
    alias @l2="@exa --tree --level 2"
    alias @ld2="@exa --tree --level 2 -D"
    alias @l3="@exa --tree --level 3"
    alias @ld3="@exa --tree --level 3 -D"
    alias @lg="@exa --all --git"
}

alias @createdirstructexa="ap_func_create_dirstruct_exa"
ap_func_create_dirstruct_exa() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/exa] to [${AP_SOFT_DIR}/exa/bin/exa]\n"
    ln -sf "${AP_SOFT_DIR}/exa/bin/exa" "${AP_SOFT_DIR}/bin/exa"

    @logshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_exa.bash] to [${AP_SOFT_DIR}/exa/completions/exa.bash]\n"
    ln -sf "${AP_SOFT_DIR}/exa/completions/exa.bash" "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"

    @logshow "Create symlink from [${AP_MAN_DIR}/man1/exa.1] to [${AP_SOFT_DIR}/exa/exa.1]\n"
    ln -sf "${AP_SOFT_DIR}/exa/man/exa.1" "${AP_MAN_DIR}/man1/exa.1"

    @logshow "Create symlink from [${AP_MAN_DIR}/man5/exa_colors.5] to [${AP_SOFT_DIR}/exa/man/exa_colors.5]\n"
    ln -sf "${AP_SOFT_DIR}/exa/man/exa_colors.5" "${AP_MAN_DIR}/man5/exa_colors.5"
}

alias @rmdirstructexa="ap_func_remove_dirstruct_exa"
ap_func_remove_dirstruct_exa() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/exa]\n"
    rm -f "${AP_SOFT_DIR}/bin/exa"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_exa.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"

    @logshow "Remove [${AP_MAN_DIR}/man1/exa.1]\n"
    rm -f "${AP_MAN_DIR}/man1/exa.1"

    @logshow "Remove [${AP_MAN_DIR}/man5/exa_colors.5]\n"
    rm -f "${AP_MAN_DIR}/man5/exa_colors.5"
}

alias @createglobalsymlinkexa="ap_func_create_global_symlink_exa"
ap_func_create_global_symlink_exa() {
    if [ -f "${AP_SOFT_DIR}/exa/exa" ]; then
        @logshow "Create symlink from [/usr/local/bin/exa] to [${AP_SOFT_DIR}/exa/exa]\n"
        sudo ln -sf "${AP_SOFT_DIR}/exa/exa" "/usr/local/bin/exa"
    fi
}

alias @rmglobalsymlinkexa="ap_func_remove_global_symlink_exa"
ap_func_remove_global_symlink_exa() {
    if [ -f "/usr/local/bin/exa" ]; then
        @logshow "Remove [/usr/local/bin/exa]\n"
        sudo rm -f "/usr/local/bin/exa"
    fi
}

alias @setupexa="ap_func_setup_exa"
ap_func_setup_exa() {
    # https://github.com/ogham/exa
    # https://pandoc.org
    # https://github.com/rust-lang/git2-rs
    # https://github.com/casey/just
    # Dependencies: just (rust), pandoc, libgit2 (rust), git-delta (rust)
    @logshow "Install [exa]\n"

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

    @createdirstructexa
}

alias @rmexa="ap_func_remove_exa"
ap_func_remove_exa() {
    @logshow "Remove [exa]\n"
    rm -rf "${AP_SOFT_DIR}/exa"
    @rmdirstructexa
    @rmglobalsymlinkexa
}
