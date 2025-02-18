alias apinitiredis="ap_func_init_iredis"
ap_func_init_iredis() {
    alias irds='iredis'
    alias iredispw="iredis -a \$(showredispasswd)"

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

alias aprmdirstructiredis="ap_func_rm_dirstruct_iredis"
ap_func_rm_dirstruct_iredis() {
    if alias aprmdirstructiredisshare &>/dev/null; then
        aprmdirstructiredisshare
    fi

    if alias aprmdirstructirediscommon &>/dev/null; then
        aprmdirstructirediscommon
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

alias aprmiredis="ap_func_rm_iredis"
ap_func_rm_iredis() {
    aplogshow "Remove [iredis]\n"
    pip uninstall iredis

    if alias aprmdirstructiredis &>/dev/null; then
        aprmdirstructiredis
    fi

    if alias aprmglobalsymlinkiredis &>/dev/null; then
        aprmglobalsymlinkiredis
    fi
}
