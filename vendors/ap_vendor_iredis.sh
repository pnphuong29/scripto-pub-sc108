alias @initiredis="ap_func_init_iredis"
ap_func_init_iredis() {
    alias @iredis="iredis -a \$(showredispasswd)"

    if alias @initiredisshare &>/dev/null; then
        @initiredisshare
    fi

    if alias @initirediscommon &>/dev/null; then
        @initirediscommon
    fi
}

alias @createdirstructiredis="ap_func_create_dirstruct_iredis"
ap_func_create_dirstruct_iredis() {
    if alias @createdirstructiredisshare &>/dev/null; then
        @createdirstructiredisshare
    fi

    if alias @createdirstructirediscommon &>/dev/null; then
        @createdirstructirediscommon
    fi
}

alias @rmdirstructiredis="ap_func_rm_dirstruct_iredis"
ap_func_rm_dirstruct_iredis() {
    if alias @rmdirstructiredisshare &>/dev/null; then
        @rmdirstructiredisshare
    fi

    if alias @rmdirstructirediscommon &>/dev/null; then
        @rmdirstructirediscommon
    fi
}

alias @setupiredis="ap_func_setup_iredis"
ap_func_setup_iredis() {
    @logshow "Install [iredis]\n"
    pip install iredis

    @initiredis
    if alias @createdirstructiredis &>/dev/null; then
        @createdirstructiredis
    fi
}

alias @rmiredis="ap_func_rm_iredis"
ap_func_rm_iredis() {
    @logshow "Remove [iredis]\n"
    pip uninstall iredis

    if alias @rmdirstructiredis &>/dev/null; then
        @rmdirstructiredis
    fi

    if alias @rmglobalsymlinkiredis &>/dev/null; then
        @rmglobalsymlinkiredis
    fi
}
