alias @initinvoke="ap_func_init_invoke"
ap_func_init_invoke() {
    if alias @initinvokeshare &>/dev/null; then
        @initinvokeshare
    fi

    if alias @initinvokecommon &>/dev/null; then
        @initinvokecommon
    fi
}

alias @createdirstructinvoke="ap_func_create_dirstruct_invoke"
ap_func_create_dirstruct_invoke() {
    @logshow "Generate [invoke] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash]\n"

    if type inv &>/dev/null; then
        inv --print-completion-script bash >"${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash"
    fi

    if alias @createdirstructinvokeshare &>/dev/null; then
        @createdirstructinvokeshare
    fi

    if alias @createdirstructinvokecommon &>/dev/null; then
        @createdirstructinvokecommon
    fi
}

alias @rmdirstructinvoke="ap_func_rm_dirstruct_invoke"
ap_func_rm_dirstruct_invoke() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash"

    if alias @rmdirstructinvokeshare &>/dev/null; then
        @rmdirstructinvokeshare
    fi

    if alias @rmdirstructinvokecommon &>/dev/null; then
        @rmdirstructinvokecommon
    fi
}

alias @setupinvoke="ap_func_setup_invoke"
ap_func_setup_invoke() {
    @logshow "Install [invoke]\n"
    pip install invoke

    @initinvoke
    if alias @createdirstructinvoke &>/dev/null; then
        @createdirstructinvoke
    fi
}

alias @rminvoke="ap_func_rm_invoke"
ap_func_rm_invoke() {
    @logshow "Remove [invoke]\n"
    pip uninstall invoke

    if alias @rmdirstructinvoke &>/dev/null; then
        @rmdirstructinvoke
    fi

    if alias @rmglobalsymlinkinvoke &>/dev/null; then
        @rmglobalsymlinkinvoke
    fi
}
