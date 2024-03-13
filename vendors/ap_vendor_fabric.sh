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

alias aprmdirstructfabric="ap_func_rm_dirstruct_fabric"
ap_func_rm_dirstruct_fabric() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"

    if alias aprmdirstructfabricshare &>/dev/null; then
        aprmdirstructfabricshare
    fi

    if alias aprmdirstructfabriccommon &>/dev/null; then
        aprmdirstructfabriccommon
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

alias aprmfabric="ap_func_rm_fabric"
ap_func_rm_fabric() {
    aplogshow "Remove [fabric]\n"
    pip uninstall fabric2

    if alias aprmdirstructfabric &>/dev/null; then
        aprmdirstructfabric
    fi

    if alias aprmglobalsymlinkfabric &>/dev/null; then
        aprmglobalsymlinkfabric
    fi
}
