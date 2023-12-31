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
