alias apinitbun="ap_func_init_bun"
ap_func_init_bun() {
    apaddpath "${HOME}/.bun/bin"

    if alias apinitbunshare &>/dev/null; then
        apinitbunshare
    fi

    if alias apinitbuncommon &>/dev/null; then
        apinitbuncommon
    fi
}

alias apcreatedirstructbun="ap_func_create_dirstruct_bun"
ap_func_create_dirstruct_bun() {
    if alias apcreatedirstructbunshare &>/dev/null; then
        apcreatedirstructbunshare
    fi

    if alias apcreatedirstructbuncommon &>/dev/null; then
        apcreatedirstructbuncommon
    fi
}

alias aprmdirstructbun="ap_func_rm_dirstruct_bun"
ap_func_rm_dirstruct_bun() {
    if alias aprmdirstructbunshare &>/dev/null; then
        aprmdirstructbunshare
    fi

    if alias aprmdirstructbuncommon &>/dev/null; then
        aprmdirstructbuncommon
    fi
}

alias apsetupbun="ap_func_setup_bun"
ap_func_setup_bun() {
    # https://bun.sh
    aplogshow "Install [bun]\n"
    curl -fsSL https://bun.sh/install | bash
}

alias aprmbun="ap_func_rm_bun"
ap_func_rm_bun() {
    # https://bun.sh/docs/installation#uninstall
    aplogshow "Remove [bun]\n"
    rm -rf "${HOME}/.bun"
}
