alias @initjoplincli="ap_func_init_joplin_cli"
ap_func_init_joplin_cli() {
    if alias @initjoplinclicommon &>/dev/null; then
        @initjoplinclicommon
    fi
}

alias @setupjoplincli="ap_func_setup_joplin_cli"
ap_func_setup_joplin_cli() {
    @logshow "Install [Joplin cli]\n"
    npm -g install joplin
}

alias @setupjoplinclibun="ap_func_setup_joplin_cli_bun"
ap_func_setup_joplin_cli_bun() {
    @logshow "Install [Joplin cli]\n"
    bun -g install joplin
}

alias @rmjoplincli="ap_func_rm_joplin_cli"
ap_func_rm_joplin_cli() {
    @logshow "Remove [joplin_cli]\n"
    npm -g uninstall joplin
}

alias @rmjoplinclibun="ap_func_rm_joplin_cli_bun"
ap_func_rm_joplin_cli_bun() {
    @logshow "Remove [joplin_cli]\n"
    bun -g uninstall joplin
}
