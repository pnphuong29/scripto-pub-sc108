alias @initpipx="ap_func_init_pipx"
ap_func_init_pipx() {
    if alias @initpipxshare &>/dev/null; then
        @initpipxshare
    fi

    if alias @initpipxcommon &>/dev/null; then
        @initpipxcommon
    fi
}

alias @createdirstructpipx="ap_func_create_dirstruct_pipx"
ap_func_create_dirstruct_pipx() {
    @logshow "Generate [pipx] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    register-python-argcomplete pipx >"${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"

    if alias @createdirstructpipxshare &>/dev/null; then
        @createdirstructpipxshare
    fi

    if alias @createdirstructpipxcommon &>/dev/null; then
        @createdirstructpipxcommon
    fi
}

alias @rmdirstructpipx="ap_func_rm_dirstruct_pipx"
ap_func_rm_dirstruct_pipx() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"

    if alias @rmdirstructpipxshare &>/dev/null; then
        @rmdirstructpipxshare
    fi

    if alias @rmdirstructpipxcommon &>/dev/null; then
        @rmdirstructpipxcommon
    fi
}

alias @setuppipx="ap_func_setup_pipx"
ap_func_setup_pipx() {
    @logshow "Install [pipx]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew install pipx
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt update
    #     sudo apt install pipx
    # fi

    pip install --user pipx
    pipx ensurepath

    @initpipx
    if alias @createdirstructpipx &>/dev/null; then
        @createdirstructpipx
    fi
}

alias @rmpipx="ap_func_rm_pipx"
ap_func_rm_pipx() {
    @logshow "Remove [pipx]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew remove pipx
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt purge -y pipx
    # fi

    pip uninstall --user pipx

    if alias @rmdirstructpipx &>/dev/null; then
        @rmdirstructpipx
    fi

    if alias @rmglobalsymlinkpipx &>/dev/null; then
        @rmglobalsymlinkpipx
    fi
}
