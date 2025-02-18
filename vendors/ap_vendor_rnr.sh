alias apinitrnr="ap_func_init_rnr"
ap_func_init_rnr() {
    if alias apinitrnrshare &>/dev/null; then
        apinitrnrshare
    fi

    if alias apinitrnrcommon &>/dev/null; then
        apinitrnrcommon
    fi

    if alias apinitrnrmain &>/dev/null; then
        apinitrnrmain
    fi
}

alias apcreatedirstructrnr="ap_func_create_dirstruct_rnr"
ap_func_create_dirstruct_rnr() {
    if alias apcreatedirstructrnrshare &>/dev/null; then
        apcreatedirstructrnrshare
    fi

    if alias apcreatedirstructrnrcommon &>/dev/null; then
        apcreatedirstructrnrcommon
    fi

    if alias apcreatedirstructrnrmain &>/dev/null; then
        apcreatedirstructrnrmain
    fi
}

alias aprmdirstructrnr="ap_func_rm_dirstruct_rnr"
ap_func_rm_dirstruct_rnr() {
    if alias aprmdirstructrnrshare &>/dev/null; then
        aprmdirstructrnrshare
    fi

    if alias aprmdirstructrnrcommon &>/dev/null; then
        aprmdirstructrnrcommon
    fi

    if alias aprmdirstructrnrmain &>/dev/null; then
        aprmdirstructrnrmain
    fi
}

alias apcreateglobalsymlinkrnr="ap_func_create_global_symlink_rnr"
ap_func_create_global_symlink_rnr() {
    if [ -f "${HOME}/.cargo/bin/rnr" ]; then
        aplogshow "Create symlink from [/usr/local/bin/rnr] to [${HOME}/.cargo/bin/rnr]\n"
        sudo ln -sf "${HOME}/.cargo/bin/rnr" "/usr/local/bin/rnr"
    fi
}

alias aprmglobalsymlinkrnr="ap_func_rm_global_symlink_rnr"
ap_func_rm_global_symlink_rnr() {
    if [ -f "/usr/local/bin/rnr" ]; then
        aplogshow "Remove [/usr/local/bin/rnr]\n"
        sudo rm -f "/usr/local/bin/rnr"
    fi
}

alias apsetuprnr="ap_func_setup_rnr"
ap_func_setup_rnr() {
    aplogshow "Install [rnr]\n"
    cargo install rnr

    apinitrnr
    if alias apcreatedirstructrnr &>/dev/null; then
        apcreatedirstructrnr
    fi
}

alias aprmrnr="ap_func_rm_rnr"
ap_func_rm_rnr() {
    aplogshow "Remove [rnr]\n"
    cargo uninstall rnr

    if alias aprmdirstructrnr &>/dev/null; then
        aprmdirstructrnr
    fi

    if alias aprmglobalsymlinkrnr &>/dev/null; then
        aprmglobalsymlinkrnr
    fi
}
