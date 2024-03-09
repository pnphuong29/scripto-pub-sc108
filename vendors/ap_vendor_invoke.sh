alias apinitinvoke="ap_func_init_invoke"
ap_func_init_invoke() {
    if alias apinitinvokeshare &>/dev/null; then
        apinitinvokeshare
    fi

    if alias apinitinvokecommon &>/dev/null; then
        apinitinvokecommon
    fi
}

alias apcreatedirstructinvoke="ap_func_create_dirstruct_invoke"
ap_func_create_dirstruct_invoke() {
    aplogshow "Generate [invoke] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash]\n"

    if type inv &>/dev/null; then
        inv --print-completion-script bash >"${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash"
    fi

    if alias apcreatedirstructinvokeshare &>/dev/null; then
        apcreatedirstructinvokeshare
    fi

    if alias apcreatedirstructinvokecommon &>/dev/null; then
        apcreatedirstructinvokecommon
    fi
}

alias rmdirstructinvoke="ap_func_rm_dirstruct_invoke"
ap_func_rm_dirstruct_invoke() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash"

    if alias rmdirstructinvokeshare &>/dev/null; then
        rmdirstructinvokeshare
    fi

    if alias rmdirstructinvokecommon &>/dev/null; then
        rmdirstructinvokecommon
    fi
}

alias apsetupinvoke="ap_func_setup_invoke"
ap_func_setup_invoke() {
    aplogshow "Install [invoke]\n"
    pip install invoke

    apinitinvoke
    if alias apcreatedirstructinvoke &>/dev/null; then
        apcreatedirstructinvoke
    fi
}

alias rminvoke="ap_func_rm_invoke"
ap_func_rm_invoke() {
    aplogshow "Remove [invoke]\n"
    pip uninstall invoke

    if alias rmdirstructinvoke &>/dev/null; then
        rmdirstructinvoke
    fi

    if alias rmglobalsymlinkinvoke &>/dev/null; then
        rmglobalsymlinkinvoke
    fi
}
