alias @initrust="ap_func_init_rust"
ap_func_init_rust() {
    source "${HOME}/.cargo/env"
}

alias @createdirstructrust="ap_func_create_dirstruct_rust"
ap_func_create_dirstruct_rust() {
    @logshow "Generate [rust] bash autocomplete\n"
    rustup completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_rustup.bash"
    rustup completions bash cargo >"${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash"

    if alias @createdirstructrustcommon &>/dev/null; then
        @createdirstructrustcommon
    fi
}

alias @rmdirstructrust="ap_func_remove_dirstruct_rust"
ap_func_remove_dirstruct_rust() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_rustup.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rust.bash"

    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash"

    if alias @rmdirstructrustcommon &>/dev/null; then
        @rmdirstructrustcommon
    fi
}

alias @setuprust="ap_func_setup_rust"
ap_func_setup_rust() {
    # https://forge.rust-lang.org/infra/other-installation-methods.html
    @logshow "Install [rust]\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
    source "${HOME}/.cargo/env"
    rustup update # Update rust

    if alias @createdirstructrust &>/dev/null; then
        @createdirstructrust
    fi
}

alias @rmrust="ap_func_remove_rust"
ap_func_remove_rust() {
    @logshow "Remove [rust]\n"
    rustup self uninstall
    if alias @rmdirstructrust &>/dev/null; then
        @rmdirstructrust
    fi
}
