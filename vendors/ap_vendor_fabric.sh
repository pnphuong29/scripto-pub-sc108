alias apinitfabric="ap_func_init_fabric"
ap_func_init_fabric() {
    if alias apinitfabricshare &>/dev/null; then
        apinitfabricshare
    fi

    if alias apinitfabriccommon &>/dev/null; then
        apinitfabriccommon
    fi
}

alias apcreatedirstructfabric="ap_func_create_dirstruct_fabric"
ap_func_create_dirstruct_fabric() {
    aplogshow "Generate [fabric] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    if type fab &>/dev/null; then
        fab --print-completion-script bash >"${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"
    fi

    if alias apcreatedirstructfabricshare &>/dev/null; then
        apcreatedirstructfabricshare
    fi

    if alias apcreatedirstructfabriccommon &>/dev/null; then
        apcreatedirstructfabriccommon
    fi
}

alias rmdirstructfabric="ap_func_rm_dirstruct_fabric"
ap_func_rm_dirstruct_fabric() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"

    if alias rmdirstructfabricshare &>/dev/null; then
        rmdirstructfabricshare
    fi

    if alias rmdirstructfabriccommon &>/dev/null; then
        rmdirstructfabriccommon
    fi
}

alias apsetupfabric="ap_func_setup_fabric"
ap_func_setup_fabric() {
    aplogshow "Install [fabric]\n"
    pip install fabric2
    apinitfabric

    if alias apcreatedirstructfabric &>/dev/null; then
        apcreatedirstructfabric
    fi
}

alias rmfabric="ap_func_rm_fabric"
ap_func_rm_fabric() {
    aplogshow "Remove [fabric]\n"
    pip uninstall fabric2

    if alias rmdirstructfabric &>/dev/null; then
        rmdirstructfabric
    fi

    if alias rmglobalsymlinkfabric &>/dev/null; then
        rmglobalsymlinkfabric
    fi
}
