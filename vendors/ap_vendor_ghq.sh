alias @setupghq="ap_func_setup_ghq"
ap_func_setup_ghq() {
    # https://github.com/x-motemen/ghq
    @logshow "Install [ghq]\n"
    go install github.com/x-motemen/ghq@latest
}

alias @rmghq="ap_func_remove_ghq"
ap_func_remove_ghq() {
    @logshow "Remove [ghq]\n"
    local ap_go_path
    ap_go_path="$(go env GOPATH)"
    rm -rf "${ap_go_path}/pkg/mod/github.com/x-motemen/ghq@"*
    rm -f "${ap_go_path}/bin/ghq"
}
