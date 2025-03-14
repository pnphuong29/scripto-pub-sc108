alias apinitfnm="ap_func_init_fnm"
ap_func_init_fnm() {
    if alias apinitfnmshare &>/dev/null; then
        apinitfnmshare
    fi

    if alias apinitfnmcommon &>/dev/null; then
        apinitfnmcommon
    fi

    if alias apinitfnmmain &>/dev/null; then
        apinitfnmmain
    fi
}

alias apcreatedirstructfnm="ap_func_create_dirstruct_fnm"
ap_func_create_dirstruct_fnm() {
    if alias apcreatedirstructfnmshare &>/dev/null; then
        apcreatedirstructfnmshare
    fi

    if alias apcreatedirstructfnmcommon &>/dev/null; then
        apcreatedirstructfnmcommon
    fi

    if alias apcreatedirstructfnmmain &>/dev/null; then
        apcreatedirstructfnmmain
    fi
}

alias aprmdirstructfnm="ap_func_rm_dirstruct_fnm"
ap_func_rm_dirstruct_fnm() {
    if alias aprmdirstructfnmshare &>/dev/null; then
        aprmdirstructfnmshare
    fi

    if alias aprmdirstructfnmcommon &>/dev/null; then
        aprmdirstructfnmcommon
    fi

    if alias aprmdirstructfnmmain &>/dev/null; then
        aprmdirstructfnmmain
    fi
}

alias apsetupfnm="ap_func_setup_fnm"
ap_func_setup_fnm() {
    aplogshow "Install [fnm]\n"
    cargo install fnm

    aplogshow "Install node version [${AP_NODE_VERSION_DEFAULT}]\n"
    fnm install "${AP_NODE_VERSION_DEFAULT}"

    aplogshow "Set default node version [${AP_NODE_VERSION_DEFAULT}]\n"
    fnm default "${AP_NODE_VERSION_DEFAULT}"

    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell bash)"
    npm install -g pnpm

    apinitfnm
    if alias apcreatedirstructfnm &>/dev/null; then
        apcreatedirstructfnm
    fi
}

alias aprmfnm="ap_func_rm_fnm"
ap_func_rm_fnm() {
    aplogshow "Remove [fnm]\n"
    cargo uninstall fnm

    if alias aprmdirstructfnm &>/dev/null; then
        aprmdirstructfnm
    fi

    if alias aprmglobalsymlinkfnm &>/dev/null; then
        aprmglobalsymlinkfnm
    fi
}
