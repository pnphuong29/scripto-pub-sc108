alias apinitjoplincli="ap_func_init_joplin_cli"
ap_func_init_joplin_cli() {
    if alias apinitjoplinclishare &>/dev/null; then
        apinitjoplinclishare
    fi

    if alias apinitjoplinclicommon &>/dev/null; then
        apinitjoplinclicommon
    fi
}

alias apcreatedirstructjoplincli="ap_func_create_dirstruct_joplincli"
ap_func_create_dirstruct_joplincli() {
    if alias apcreatedirstructjoplinclishare &>/dev/null; then
        apcreatedirstructjoplinclishare
    fi

    if alias apcreatedirstructjoplinclicommon &>/dev/null; then
        apcreatedirstructjoplinclicommon
    fi
}

alias aprmdirstructjoplincli="ap_func_rm_dirstruct_joplincli"
ap_func_rm_dirstruct_joplincli() {
    if alias aprmdirstructjoplinclishare &>/dev/null; then
        aprmdirstructjoplinclishare
    fi

    if alias aprmdirstructjoplinclicommon &>/dev/null; then
        aprmdirstructjoplinclicommon
    fi
}

alias apsetupjoplincli="ap_func_setup_joplin_cli"
ap_func_setup_joplin_cli() {
    aplogshow "Install [Joplin cli]\n"
    npm -g install joplin

    apinitjoplincli
    if alias apcreatedirstructjoplincli &>/dev/null; then
        apcreatedirstructjoplincli
    fi
}

alias apsetupjoplinclibun="ap_func_setup_joplin_cli_bun"
ap_func_setup_joplin_cli_bun() {
    aplogshow "Install [Joplin cli]\n"
    bun -g install joplin

    apinitjoplincli
    if alias apcreatedirstructjoplincli &>/dev/null; then
        apcreatedirstructjoplincli
    fi
}

alias aprmjoplincli="ap_func_rm_joplin_cli"
ap_func_rm_joplin_cli() {
    aplogshow "Remove [joplin_cli]\n"
    npm -g uninstall joplin

    if alias aprmdirstructjoplincli &>/dev/null; then
        aprmdirstructjoplincli
    fi

    if alias aprmglobalsymlinkjoplincli &>/dev/null; then
        aprmglobalsymlinkjoplincli
    fi
}

alias aprmjoplinclibun="ap_func_rm_joplin_cli_bun"
ap_func_rm_joplin_cli_bun() {
    aplogshow "Remove [joplin_cli]\n"
    bun -g uninstall joplin

    if alias aprmdirstructjoplincli &>/dev/null; then
        aprmdirstructjoplincli
    fi

    if alias aprmglobalsymlinkjoplincli &>/dev/null; then
        aprmglobalsymlinkjoplincli
    fi
}
