alias @initvolta="ap_func_init_volta"
ap_func_init_volta() {
    export VOLTA_HOME="${HOME}/.volta"
    @addpath "${VOLTA_HOME}/bin"

    alias zvoltatools='cd "${HOME}/.volta/tools"'
    alias zvoltaimgs='cd "${HOME}/.volta/tools/image"'
    alias zvoltanode='cd "${HOME}/.volta/tools/image/node"'
    alias zvoltapkgs='cd "${HOME}/.volta/tools/image/node"'

    if alias @initvoltashare &>/dev/null; then
        @initvoltashare
    fi

    if alias @initvoltacommon &>/dev/null; then
        @initvoltacommon
    fi
}

alias @createdirstructvolta="ap_func_create_dirstruct_volta"
ap_func_create_dirstruct_volta() {
    @logshow "Generate [volta] bash autocomplete\n"
    "${HOME}/.volta/bin/volta" completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_volta.bash"

    if alias @createdirstructvoltashare &>/dev/null; then
        @createdirstructvoltashare
    fi

    if alias @createdirstructvoltacommon &>/dev/null; then
        @createdirstructvoltacommon
    fi
}

alias @rmdirstructvolta="ap_func_rm_dirstruct_volta"
ap_func_rm_dirstruct_volta() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_volta.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_volta.bash"

    if alias @rmdirstructvoltashare &>/dev/null; then
        @rmdirstructvoltashare
    fi

    if alias @rmdirstructvoltacommon &>/dev/null; then
        @rmdirstructvoltacommon
    fi
}

alias @createglobalsymlinkvolta="ap_func_create_global_symlink_volta"
ap_func_create_global_symlink_volta() {
    if [ -f "${AP_SOFT_DIR}/bin/volta" ]; then
        @logshow "Create symlink from [/usr/local/bin/volta] to [${AP_SOFT_DIR}/bin/volta]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/volta" "/usr/local/bin/volta"
    fi
}

alias @rmglobalsymlinkvolta="ap_func_rm_global_symlink_volta"
ap_func_rm_global_symlink_volta() {
    if [ -f "/usr/local/bin/volta" ]; then
        @logshow "Remove [/usr/local/bin/volta]\n"
        sudo rm -f "/usr/local/bin/volta"
    fi
}

alias @setupvolta="ap_func_setup_volta"
ap_func_setup_volta() {
    # https://volta.sh/
    @logshow "Install [volta]\n"

    # https://docs.volta.sh/advanced/installers#skipping-volta-setup
    # curl https://get.volta.sh | bash
    curl https://get.volta.sh | bash -s -- --skip-setup

    @initvolta
    if alias @createdirstructvolta &>/dev/null; then
        @createdirstructvolta
    fi
}

alias @rmvolta="ap_func_rm_volta"
ap_func_rm_volta() {
    @logshow "Remove [volta]\n"

    # volta modified `~/.profile`, please remove unnecessary lines related to volta
    rm -rf ~/.volta

    if alias @rmdirstructvolta &>/dev/null; then
        @rmdirstructvolta
    fi

    if alias @rmglobalsymlinkvolta &>/dev/null; then
        @rmglobalsymlinkvolta
    fi
}
