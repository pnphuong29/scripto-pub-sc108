alias apinitlazygit="ap_func_init_lazygit"
ap_func_init_lazygit() {
    alias lg='lazygit'

    if alias apinitlazygitshare &>/dev/null; then
        apinitlazygitshare
    fi

    if alias apinitlazygitcommon &>/dev/null; then
        apinitlazygitcommon
    fi
}

alias apcreatedirstructlazygit="ap_func_create_dirstruct_lazygit"
ap_func_create_dirstruct_lazygit() {
    if alias apcreatedirstructlazygitshare &>/dev/null; then
        apcreatedirstructlazygitshare
    fi

    if alias apcreatedirstructlazygitcommon &>/dev/null; then
        apcreatedirstructlazygitcommon
    fi
}

alias aprmdirstructlazygit="ap_func_rm_dirstruct_lazygit"
ap_func_rm_dirstruct_lazygit() {
    if alias aprmdirstructlazygitshare &>/dev/null; then
        aprmdirstructlazygitshare
    fi

    if alias aprmdirstructlazygitcommon &>/dev/null; then
        aprmdirstructlazygitcommon
    fi
}

alias apsetuplazygit="ap_func_setup_lazygit"
ap_func_setup_lazygit() {
    aplogshow "Install [lazygit]\n"
    go install github.com/jesseduffield/lazygit@latest

    apinitlazygit
    if alias apcreatedirstructlazygit &>/dev/null; then
        apcreatedirstructlazygit
    fi
}

alias aprmlazygit="ap_func_rm_lazygit"
ap_func_rm_lazygit() {
    aplogshow "Remove [lazygit]\n"
    rm -rf "${GOPATH}/pkg/mod/github.com/jesseduffield/lazygit@"*
    rm -f "${GOPATH}/bin/lazygit"

    if alias aprmdirstructlazygit &>/dev/null; then
        aprmdirstructlazygit
    fi

    if alias aprmglobalsymlinklazygit &>/dev/null; then
        aprmglobalsymlinklazygit
    fi
}
