alias @rmjust="ap_func_remove_just"
ap_func_remove_just() {
    @logshow "Remove [just]\n"
    rm -f "${AP_SOFT_DIR}/bin/just"
}

alias @setupjust="ap_func_setup_just"
ap_func_setup_just() {
    # https://github.com/casey/just
    @logshow "Install [just]\n"
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to "${AP_SOFT_DIR}/bin"
}
