alias apinitnox="ap_func_init_nox"
ap_func_init_nox() {
    if alias apinitnoxshare &>/dev/null; then
        apinitnoxshare
    fi

    if alias apinitnoxcommon &>/dev/null; then
        apinitnoxcommon
    fi
}

alias apcreatedirstructnox="ap_func_create_dirstruct_nox"
ap_func_create_dirstruct_nox() {
    aplogshow "Generate [nox] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_nox.bash]\n"
    if type nox &>/dev/null; then
        register-python-argcomplete nox >"${AP_COMPLETIONS_DIR}/ap_completion_nox.bash"
    fi

    if alias apcreatedirstructnoxcommon &>/dev/null; then
        apcreatedirstructnoxcommon
    fi
}

alias aprmdirstructnox="ap_func_rm_dirstruct_nox"
ap_func_rm_dirstruct_nox() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_nox.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_nox.bash"

    if alias aprmdirstructnoxcommon &>/dev/null; then
        aprmdirstructnoxcommon
    fi
}

alias apsetupnox="ap_func_setup_nox"
ap_func_setup_nox() {
    aplogshow "Install [nox]\n"
    pip install nox

    apinitnox
    if alias apcreatedirstructnox &>/dev/null; then
        apcreatedirstructnox
    fi
}

alias aprmnox="ap_func_rm_nox"
ap_func_rm_nox() {
    aplogshow "Remove [nox]\n"
    pip uninstall nox

    if alias aprmdirstructnox &>/dev/null; then
        aprmdirstructnox
    fi

    if alias aprmglobalsymlinknox &>/dev/null; then
        aprmglobalsymlinknox
    fi
}
