alias @initbun="ap_func_init_bun"
ap_func_init_bun() {
    @addpath "${HOME}/.bun/bin"
}

alias @setupbun="ap_func_setup_bun"
ap_func_setup_bun() {
    # https://bun.sh
    @logshow "Install [bun]\n"
    curl -fsSL https://bun.sh/install | bash
}

alias @rmbun="ap_func_remove_bun"
ap_func_remove_bun() {
    # https://bun.sh/docs/installation#uninstall
    @logshow "Remove [bun]\n"
    rm -rf "${HOME}/.bun"
}
