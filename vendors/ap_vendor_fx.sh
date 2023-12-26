alias @initfx="ap_func_init_fx"
ap_func_init_fx() {
    if alias @initfxcommon &>/dev/null; then
        @initfxcommon
    fi
}

alias @createdirstructfx="ap_func_create_dirstruct_fx"
ap_func_create_dirstruct_fx() {
    # https://github.com/antonmedv/fx-completion
    # It's author has already archived it, maybe it will be deprecated soonly
    @logshow "Generate [fx] bash autocomplete\n"
    fx-completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_fx.bash"
}

alias @rmdirstructfx="ap_func_remove_dirstruct_fx"
ap_func_remove_dirstruct_fx() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fx.bash"
}

alias @setupfx="ap_func_setup_fx"
ap_func_setup_fx() {
    # https://github.com/antonmedv/fx
    # https://github.com/antonmedv/fx-completion
    @logshow "Install [fx]\n"
    go install github.com/antonmedv/fx@latest
    # npm install --global fx fx-completion # npm performance is quite slow, should not use this way to install fx

    @logshow "Install [fx-completion]\n"
    npm install --global fx-completion

    if alias @createdirstructfx &>/dev/null; then
        @createdirstructfx
    fi
}

alias @rmfx="ap_func_remove_fx"
ap_func_remove_fx() {
    @logshow "Remove [fx]\n"

    local ap_go_path
    ap_go_path="$(go env GOPATH)"
    rm -rf "${ap_go_path}/pkg/mod/github.com/antonmedv/fx@"*
    rm -f "${ap_go_path}/bin/fx"
    npm uninstall -g fx-completion

    if alias @rmdirstructfx &>/dev/null; then
        @rmdirstructfx
    fi
}
