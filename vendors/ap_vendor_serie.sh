alias apinitserie="ap_func_init_serie"
ap_func_init_serie() {
    if alias apinitserieshare &>/dev/null; then
        apinitserieshare
    fi

    if alias apinitseriecommon &>/dev/null; then
        apinitseriecommon
    fi

    if alias apinitseriemain &>/dev/null; then
        apinitseriemain
    fi
}

alias apcreatedirstructserie="ap_func_create_dirstruct_serie"
ap_func_create_dirstruct_serie() {
    if alias apcreatedirstructserieshare &>/dev/null; then
        apcreatedirstructserieshare
    fi

    if alias apcreatedirstructseriecommon &>/dev/null; then
        apcreatedirstructseriecommon
    fi

    if alias apcreatedirstructseriemain &>/dev/null; then
        apcreatedirstructseriemain
    fi
}

alias aprmdirstructserie="ap_func_rm_dirstruct_serie"
ap_func_rm_dirstruct_serie() {
    if alias aprmdirstructserieshare &>/dev/null; then
        aprmdirstructserieshare
    fi

    if alias aprmdirstructseriecommon &>/dev/null; then
        aprmdirstructseriecommon
    fi

    if alias aprmdirstructseriemain &>/dev/null; then
        aprmdirstructseriemain
    fi
}

alias apsetupserie="ap_func_setup_serie"
ap_func_setup_serie() {
    aplogshow "Install [serie]\n"

    cargo install --locked serie

    apinitserie
    if alias apcreatedirstructserie &>/dev/null; then
        apcreatedirstructserie
    fi
}

alias aprmserie="ap_func_rm_serie"
ap_func_rm_serie() {
    aplogshow "Remove [serie]\n"

    cargo uninstall serie

    if alias aprmdirstructserie &>/dev/null; then
        aprmdirstructserie
    fi

    if alias aprmglobalsymlinkserie &>/dev/null; then
        aprmglobalsymlinkserie
    fi
}
