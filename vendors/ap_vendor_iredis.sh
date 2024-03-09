alias apinitiredis="ap_func_init_iredis"
ap_func_init_iredis() {
    alias @iredis="iredis -a \$(showredispasswd)"

    if alias apinitiredisshare &>/dev/null; then
        apinitiredisshare
    fi

    if alias apinitirediscommon &>/dev/null; then
        apinitirediscommon
    fi
}

alias apcreatedirstructiredis="ap_func_create_dirstruct_iredis"
ap_func_create_dirstruct_iredis() {
    if alias apcreatedirstructiredisshare &>/dev/null; then
        apcreatedirstructiredisshare
    fi

    if alias apcreatedirstructirediscommon &>/dev/null; then
        apcreatedirstructirediscommon
    fi
}

alias rmdirstructiredis="ap_func_rm_dirstruct_iredis"
ap_func_rm_dirstruct_iredis() {
    if alias rmdirstructiredisshare &>/dev/null; then
        rmdirstructiredisshare
    fi

    if alias rmdirstructirediscommon &>/dev/null; then
        rmdirstructirediscommon
    fi
}

alias apsetupiredis="ap_func_setup_iredis"
ap_func_setup_iredis() {
    aplogshow "Install [iredis]\n"
    pip install iredis

    apinitiredis
    if alias apcreatedirstructiredis &>/dev/null; then
        apcreatedirstructiredis
    fi
}

alias rmiredis="ap_func_rm_iredis"
ap_func_rm_iredis() {
    aplogshow "Remove [iredis]\n"
    pip uninstall iredis

    if alias rmdirstructiredis &>/dev/null; then
        rmdirstructiredis
    fi

    if alias rmglobalsymlinkiredis &>/dev/null; then
        rmglobalsymlinkiredis
    fi
}
