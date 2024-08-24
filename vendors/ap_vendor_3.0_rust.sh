alias apinitrust="ap_func_init_rust"
ap_func_init_rust() {
    source "${HOME}/.cargo/env"
    alias zcargo="cd \${HOME}/.cargo"
    alias zcargobin="cd \${HOME}/.cargo/bin"

    alias rustupdatestable="rustup update stable"
    alias rustdoc="rustup doc" # local documentation

    alias cargonew="cargo new"
    alias cargocheck="cargo check" # check codes to make sure it compiles but doesn't produce an executable
    alias cargobuild="cargo build"
    alias cargobuildrelease="cargo build --releasse"
    alias cargorun="cargo run"

    if alias apinitrustshare &>/dev/null; then
        apinitrustshare
    fi

    if alias apinitrustcommon &>/dev/null; then
        apinitrustcommon
    fi
}

alias apcreatedirstructrust="ap_func_create_dirstruct_rust"
ap_func_create_dirstruct_rust() {
    aplogshow "Generate [rust] bash autocomplete\n"
    rustup completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_rustup.bash"
    rustup completions bash cargo >"${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash"

    if alias apcreatedirstructrustshare &>/dev/null; then
        apcreatedirstructrustshare
    fi

    if alias apcreatedirstructrustcommon &>/dev/null; then
        apcreatedirstructrustcommon
    fi
}

alias aprmdirstructrust="ap_func_rm_dirstruct_rust"
ap_func_rm_dirstruct_rust() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_rustup.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_rust.bash"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_cargo.bash"

    if alias aprmdirstructrustshare &>/dev/null; then
        aprmdirstructrustshare
    fi

    if alias aprmdirstructrustcommon &>/dev/null; then
        aprmdirstructrustcommon
    fi
}

alias apsetuprust="ap_func_setup_rust"
ap_func_setup_rust() {
    # https://forge.rust-lang.org/infra/other-installation-methods.html
    aplogshow "Install [rust]\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
    source "${HOME}/.cargo/env"
    rustup update # Update rust

    apinitrust
    if alias apcreatedirstructrust &>/dev/null; then
        apcreatedirstructrust
    fi
}

alias aprmrust="ap_func_rm_rust"
ap_func_rm_rust() {
    aplogshow "Remove [rust]\n"
    rustup self uninstall

    if alias aprmdirstructrust &>/dev/null; then
        aprmdirstructrust
    fi
}
