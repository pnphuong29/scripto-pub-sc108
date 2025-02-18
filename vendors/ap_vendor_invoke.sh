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

alias aprmdirstructinvoke="ap_func_rm_dirstruct_invoke"
ap_func_rm_dirstruct_invoke() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_invoke.bash"

    if alias aprmdirstructinvokeshare &>/dev/null; then
        aprmdirstructinvokeshare
    fi

    if alias aprmdirstructinvokecommon &>/dev/null; then
        aprmdirstructinvokecommon
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

alias aprminvoke="ap_func_rm_invoke"
ap_func_rm_invoke() {
    aplogshow "Remove [invoke]\n"
    pip uninstall invoke

    if alias aprmdirstructinvoke &>/dev/null; then
        aprmdirstructinvoke
    fi

    if alias aprmglobalsymlinkinvoke &>/dev/null; then
        aprmglobalsymlinkinvoke
    fi
}
