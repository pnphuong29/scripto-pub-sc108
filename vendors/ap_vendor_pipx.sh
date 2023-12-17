alias @genpipxcompletion="ap_func_generate_pipx_autocomplete"
ap_func_generate_pipx_autocomplete() {
    @logshow "Generate [pipx] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    register-python-argcomplete pipx >"${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"
}
