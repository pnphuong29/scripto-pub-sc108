alias @createdirstructpipx="ap_func_create_dirstruct_pipx"
ap_func_create_dirstruct_pipx() {
    @logshow "Generate [pipx] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    register-python-argcomplete pipx >"${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"

    if alias @createdirstructpipxcommon &>/dev/null; then
        @createdirstructpipxcommon
    fi
}

alias @rmdirstructpipx="ap_func_rm_dirstruct_pipx"
ap_func_rm_dirstruct_pipx() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"

    if alias @rmdirstructpipxcommon &>/dev/null; then
        @rmdirstructpipxcommon
    fi
}
