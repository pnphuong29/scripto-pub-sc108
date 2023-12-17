alias @genpipcompletion="ap_func_generate_pip_autocomplete"
ap_func_generate_pip_autocomplete() {
    @logshow "Generate [pip] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pip.bash]\n"
    pip completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_pip.bash"

    @logshow "Generate [pip3] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash]\n"
    pip3 completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_pip3.bash"
}
