alias @initredocly="ap_func_init_redocly"
ap_func_init_redocly() {
    if alias @initredoclyshare &>/dev/null; then
        @initredoclyshare
    fi

    if alias @initredoclycommon &>/dev/null; then
        @initredoclycommon
    fi
}

alias @createdirstructredocly="ap_func_create_dirstruct_redocly"
ap_func_create_dirstruct_redocly() {
    @logshow "Generate [redocly] bash autocomplete\n"
    redocly completion >"${AP_COMPLETIONS_DIR}/ap_completion_redocly.bash"

    if alias @createdirstructredoclyshare &>/dev/null; then
        @createdirstructredoclyshare
    fi

    if alias @createdirstructredoclycommon &>/dev/null; then
        @createdirstructredoclycommon
    fi
}

alias @rmdirstructredocly="ap_func_rm_dirstruct_redocly"
ap_func_rm_dirstruct_redocly() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_redocly.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_redocly.bash"

    if alias @rmdirstructredoclyshare &>/dev/null; then
        @rmdirstructredoclyshare
    fi

    if alias @rmdirstructredoclycommon &>/dev/null; then
        @rmdirstructredoclycommon
    fi
}

alias @setupredocly="ap_func_setup_redocly"
ap_func_setup_redocly() {
    @logshow "Install [redocly]\n"
    bun install -g redocly
    # npm install -g redocly

    @initredocly
    if alias @createdirstructredocly &>/dev/null; then
        @createdirstructredocly
    fi
}

alias @rmredocly="ap_func_rm_redocly"
ap_func_rm_redocly() {
    @logshow "Remove [redocly]\n"
    bun uninstall -g redocly
    # npm uninstall -g redocly

    if alias @rmdirstructredocly &>/dev/null; then
        @rmdirstructredocly
    fi

    if alias @rmglobalsymlinkredocly &>/dev/null; then
        @rmglobalsymlinkredocly
    fi
}
