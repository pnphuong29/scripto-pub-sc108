alias apinitfx="ap_func_init_fx"
ap_func_init_fx() {
    alias fxthemes='fx --themes'

    if alias apinitfxshare &>/dev/null; then
        apinitfxshare
    fi

    if alias apinitfxcommon &>/dev/null; then
        apinitfxcommon
    fi
}

alias apcreatedirstructfx="ap_func_create_dirstruct_fx"
ap_func_create_dirstruct_fx() {
    # https://github.com/antonmedv/fx-completion
    # It's author has already archived it, maybe it will be deprecated soonly
    # aplogshow "Generate [fx] bash autocomplete\n"
    # fx-completion --bash >"${AP_COMPLETIONS_DIR}/ap_completion_fx.bash"

    if alias apcreatedirstructfxshare &>/dev/null; then
        apcreatedirstructfxshare
    fi

    if alias apcreatedirstructfxcommon &>/dev/null; then
        apcreatedirstructfxcommon
    fi
}

alias aprmdirstructfx="ap_func_rm_dirstruct_fx"
ap_func_rm_dirstruct_fx() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_fx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_fx.bash"

    if alias aprmdirstructfxshare &>/dev/null; then
        aprmdirstructfxshare
    fi

    if alias aprmdirstructfxcommon &>/dev/null; then
        aprmdirstructfxcommon
    fi
}

alias apsetupfx="ap_func_setup_fx"
ap_func_setup_fx() {
    # https://github.com/antonmedv/fx
    # https://github.com/antonmedv/fx-completion
    aplogshow "Install [fx]\n"
    go install github.com/antonmedv/fx@latest
    # npm install --global fx # npm performance is quite slow, should not use this way to install fx

    # aplogshow "Install [fx-completion]\n"
    # npm install --global fx-completion

    apinitfx
    if alias apcreatedirstructfx &>/dev/null; then
        apcreatedirstructfx
    fi
}

alias aprmfx="ap_func_rm_fx"
ap_func_rm_fx() {
    aplogshow "Remove [fx]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/antonmedv/fx@"*
    rm -f "${GOPATH}/bin/fx"
    # npm uninstall -g fx-completion

    if alias aprmdirstructfx &>/dev/null; then
        aprmdirstructfx
    fi

    if alias aprmglobalsymlinkfx &>/dev/null; then
        aprmglobalsymlinkfx
    fi
}
