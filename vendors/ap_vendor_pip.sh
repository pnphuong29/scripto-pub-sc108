alias @createdirstructpip="ap_func_create_dirstruct_pip"
ap_func_create_dirstruct_pip() {
    @logshow "Generate [pip] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pip.bash]\n"
    pip completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_pip.bash"

    @logshow "Generate [pip3] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash]\n"
    pip3 completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash"

    if alias @createdirstructpipcommon &>/dev/null; then
        @createdirstructpipcommon
    fi
}

alias @rmdirstructpip="ap_func_rm_dirstruct_pip"
ap_func_rm_dirstruct_pip() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pip.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pip.bash"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash"

    if alias @rmdirstructpipcommon &>/dev/null; then
        @rmdirstructpipcommon
    fi
}
