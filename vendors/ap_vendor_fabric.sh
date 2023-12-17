alias @genfabriccompletion="ap_func_generate_fabric_autocomplete"
ap_func_generate_fabric_autocomplete() {
    @logshow "Generate [fabric] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash]\n"
    if type fab &>/dev/null; then
        fab --print-completion-script bash >"${AP_COMPLETIONS_DIR}/ap_completion_fabric.bash"
    fi
}
