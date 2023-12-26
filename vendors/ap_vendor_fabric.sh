alias @createdirstructfabric="ap_func_create_dirstruct_fabric"
ap_func_create_dirstruct_fabric() {
    @logshow "Generate [fabric] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    if type fab &>/dev/null; then
        fab --print-completion-script bash >"${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"
    fi

    if alias @createdirstructfabriccommon &>/dev/null; then
        @createdirstructfabriccommon
    fi
}

alias @rmdirstructfabric="ap_func_remove_dirstruct_fabric"
ap_func_remove_dirstruct_fabric() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"

    if alias @rmdirstructfabriccommon &>/dev/null; then
        @rmdirstructfabriccommon
    fi
}
