alias @initnox="ap_func_init_nox"
ap_func_init_nox() {
    if alias @initnoxshare &>/dev/null; then
        @initnoxshare
    fi

    if alias @initnoxcommon &>/dev/null; then
        @initnoxcommon
    fi
}

alias @createdirstructnox="ap_func_create_dirstruct_nox"
ap_func_create_dirstruct_nox() {
    @logshow "Generate [nox] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_nox.bash]\n"
    if type nox &>/dev/null; then
        register-python-argcomplete nox >"${AP_COMPLETIONS_DIR}/ap_completion_nox.bash"
    fi

    if alias @createdirstructnoxcommon &>/dev/null; then
        @createdirstructnoxcommon
    fi
}

alias @rmdirstructnox="ap_func_rm_dirstruct_nox"
ap_func_rm_dirstruct_nox() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_nox.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_nox.bash"

    if alias @rmdirstructnoxcommon &>/dev/null; then
        @rmdirstructnoxcommon
    fi
}

alias @setupnox="ap_func_setup_nox"
ap_func_setup_nox() {
    @logshow "Install [nox]\n"
    pip install nox

    @initnox
    if alias @createdirstructnox &>/dev/null; then
        @createdirstructnox
    fi
}

alias @rmnox="ap_func_rm_nox"
ap_func_rm_nox() {
    @logshow "Remove [nox]\n"
    pip uninstall nox

    if alias @rmdirstructnox &>/dev/null; then
        @rmdirstructnox
    fi

    if alias @rmglobalsymlinknox &>/dev/null; then
        @rmglobalsymlinknox
    fi
}
