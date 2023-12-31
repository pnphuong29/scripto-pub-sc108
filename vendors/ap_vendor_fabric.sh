alias @initfabric="ap_func_init_fabric"
ap_func_init_fabric() {
    if alias @initfabricshare &>/dev/null; then
        @initfabricshare
    fi

    if alias @initfabriccommon &>/dev/null; then
        @initfabriccommon
    fi
}

alias @createdirstructfabric="ap_func_create_dirstruct_fabric"
ap_func_create_dirstruct_fabric() {
    @logshow "Generate [fabric] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    if type fab &>/dev/null; then
        fab --print-completion-script bash >"${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"
    fi

    if alias @createdirstructfabricshare &>/dev/null; then
        @createdirstructfabricshare
    fi

    if alias @createdirstructfabriccommon &>/dev/null; then
        @createdirstructfabriccommon
    fi
}

alias @rmdirstructfabric="ap_func_remove_dirstruct_fabric"
ap_func_remove_dirstruct_fabric() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"

    if alias @rmdirstructfabricshare &>/dev/null; then
        @rmdirstructfabricshare
    fi

    if alias @rmdirstructfabriccommon &>/dev/null; then
        @rmdirstructfabriccommon
    fi
}

alias @setupfabric="ap_func_setup_fabric"
ap_func_setup_fabric() {
    @logshow "Install [fabric]\n"
    pip install fabric2
    @initfabric

    if alias @createdirstructfabric &>/dev/null; then
        @createdirstructfabric
    fi
}

alias @rmfabric="ap_func_remove_fabric"
ap_func_remove_fabric() {
    @logshow "Remove [fabric]\n"
    pip uninstall fabric2

    if alias @rmdirstructfabric &>/dev/null; then
        @rmdirstructfabric
    fi

    if alias @rmglobalsymlinkfabric &>/dev/null; then
        @rmglobalsymlinkfabric
    fi
}
