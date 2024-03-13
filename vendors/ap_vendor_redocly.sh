alias apinitredocly="ap_func_init_redocly"
ap_func_init_redocly() {
    if alias apinitredoclyshare &>/dev/null; then
        apinitredoclyshare
    fi

    if alias apinitredoclycommon &>/dev/null; then
        apinitredoclycommon
    fi
}

alias apcreatedirstructredocly="ap_func_create_dirstruct_redocly"
ap_func_create_dirstruct_redocly() {
    aplogshow "Generate [redocly] bash autocomplete\n"
    redocly completion >"${AP_COMPLETIONS_DIR}/ap_completion_redocly.bash"

    if alias apcreatedirstructredoclyshare &>/dev/null; then
        apcreatedirstructredoclyshare
    fi

    if alias apcreatedirstructredoclycommon &>/dev/null; then
        apcreatedirstructredoclycommon
    fi
}

alias aprmdirstructredocly="ap_func_rm_dirstruct_redocly"
ap_func_rm_dirstruct_redocly() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_redocly.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_redocly.bash"

    if alias aprmdirstructredoclyshare &>/dev/null; then
        aprmdirstructredoclyshare
    fi

    if alias aprmdirstructredoclycommon &>/dev/null; then
        aprmdirstructredoclycommon
    fi
}

alias apsetupredocly="ap_func_setup_redocly"
ap_func_setup_redocly() {
    aplogshow "Install [redocly]\n"
    bun install -g redocly
    # npm install -g redocly

    apinitredocly
    if alias apcreatedirstructredocly &>/dev/null; then
        apcreatedirstructredocly
    fi
}

alias rapshowmsgredocly="ap_func_rm_redocly"
ap_func_rm_redocly() {
    aplogshow "Remove [redocly]\n"
    bun uninstall -g redocly
    # npm uninstall -g redocly

    if alias aprmdirstructredocly &>/dev/null; then
        aprmdirstructredocly
    fi

    if alias aprmglobalsymlinkredocly &>/dev/null; then
        aprmglobalsymlinkredocly
    fi
}
