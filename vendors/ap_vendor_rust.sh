alias @genrustcompletion="ap_func_generate_rust_autocomplete"
ap_func_generate_rust_autocomplete() {
    @logshow "Generate [rust] bash autocomplete\n"
    rustup completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_rustup.bash"
    rustup completions bash cargo >"${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash"
}

alias @initrust="ap_func_init_rust"
ap_func_init_rust() {
    source "${HOME}/.cargo/env"
}

alias @setuprust="ap_func_setup_rust"
ap_func_setup_rust() {
    # https://forge.rust-lang.org/infra/other-installation-methods.html
    @logshow "Install [rust]\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
    source "${HOME}/.cargo/env"
    rustup update # Update rust
    @genrustcompletion
}

alias @rmrust="ap_func_remove_rust"
ap_func_remove_rust() {
    @logshow "Remove [rust]\n"
    rustup self uninstall
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rustup.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash"
}
