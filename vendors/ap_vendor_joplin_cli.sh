alias @initjoplincli="ap_func_init_joplin_cli"
ap_func_init_joplin_cli() {
    if alias @initjoplinclishare &>/dev/null; then
        @initjoplinclishare
    fi

    if alias @initjoplinclicommon &>/dev/null; then
        @initjoplinclicommon
    fi
}

alias @createdirstructjoplincli="ap_func_create_dirstruct_joplincli"
ap_func_create_dirstruct_joplincli() {
    if alias @createdirstructjoplinclishare &>/dev/null; then
        @createdirstructjoplinclishare
    fi

    if alias @createdirstructjoplinclicommon &>/dev/null; then
        @createdirstructjoplinclicommon
    fi
}

alias @rmdirstructjoplincli="ap_func_rm_dirstruct_joplincli"
ap_func_rm_dirstruct_joplincli() {
    if alias @rmdirstructjoplinclishare &>/dev/null; then
        @rmdirstructjoplinclishare
    fi

    if alias @rmdirstructjoplinclicommon &>/dev/null; then
        @rmdirstructjoplinclicommon
    fi
}

alias @setupjoplincli="ap_func_setup_joplin_cli"
ap_func_setup_joplin_cli() {
    @logshow "Install [Joplin cli]\n"
    npm -g install joplin

    @initjoplincli
    if alias @createdirstructjoplincli &>/dev/null; then
        @createdirstructjoplincli
    fi
}

alias @setupjoplinclibun="ap_func_setup_joplin_cli_bun"
ap_func_setup_joplin_cli_bun() {
    @logshow "Install [Joplin cli]\n"
    bun -g install joplin

    @initjoplincli
    if alias @createdirstructjoplincli &>/dev/null; then
        @createdirstructjoplincli
    fi
}

alias @rmjoplincli="ap_func_rm_joplin_cli"
ap_func_rm_joplin_cli() {
    @logshow "Remove [joplin_cli]\n"
    npm -g uninstall joplin

    if alias @rmdirstructjoplincli &>/dev/null; then
        @rmdirstructjoplincli
    fi

    if alias @rmglobalsymlinkjoplincli &>/dev/null; then
        @rmglobalsymlinkjoplincli
    fi
}

alias @rmjoplinclibun="ap_func_rm_joplin_cli_bun"
ap_func_rm_joplin_cli_bun() {
    @logshow "Remove [joplin_cli]\n"
    bun -g uninstall joplin

    if alias @rmdirstructjoplincli &>/dev/null; then
        @rmdirstructjoplincli
    fi

    if alias @rmglobalsymlinkjoplincli &>/dev/null; then
        @rmglobalsymlinkjoplincli
    fi
}
