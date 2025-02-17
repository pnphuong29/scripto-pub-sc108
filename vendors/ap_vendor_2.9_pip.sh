alias apinitpip="ap_func_init_pip"
ap_func_init_pip() {
    if alias apinitpipshare &>/dev/null; then
        apinitpipshare
    fi

    if alias apinitpipcommon &>/dev/null; then
        apinitpipcommon
    fi
}

alias apcreatedirstructpip="ap_func_create_dirstruct_pip"
ap_func_create_dirstruct_pip() {
    aplogshow "Generate [pip] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pip.bash]\n"
    pip completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_pip.bash"

    aplogshow "Generate [pip3] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash]\n"
    pip3 completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash"

    if alias apcreatedirstructpipshare &>/dev/null; then
        apcreatedirstructpipshare
    fi

    if alias apcreatedirstructpipcommon &>/dev/null; then
        apcreatedirstructpipcommon
    fi
}

alias aprmdirstructpip="ap_func_rm_dirstruct_pip"
ap_func_rm_dirstruct_pip() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pip.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pip.bash"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash"

    if alias aprmdirstructpipshare &>/dev/null; then
        aprmdirstructpipshare
    fi

    if alias aprmdirstructpipcommon &>/dev/null; then
        aprmdirstructpipcommon
    fi
}
