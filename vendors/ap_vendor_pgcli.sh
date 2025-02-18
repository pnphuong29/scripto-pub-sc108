alias apinitpgcli="ap_func_init_pgcli"
ap_func_init_pgcli() {
    if alias apinitpgclishare &>/dev/null; then
        apinitpgclishare
    fi

    if alias apinitpgclicommon &>/dev/null; then
        apinitpgclicommon
    fi
}

alias apcreatedirstructpgcli="ap_func_create_dirstruct_pgcli"
ap_func_create_dirstruct_pgcli() {
    if alias apcreatedirstructpgclishare &>/dev/null; then
        apcreatedirstructpgclishare
    fi

    if alias apcreatedirstructpgclicommon &>/dev/null; then
        apcreatedirstructpgclicommon
    fi
}

alias aprmdirstructpgcli="ap_func_rm_dirstruct_pgcli"
ap_func_rm_dirstruct_pgcli() {
    if alias aprmdirstructpgclishare &>/dev/null; then
        aprmdirstructpgclishare
    fi

    if alias aprmdirstructpgclicommon &>/dev/null; then
        aprmdirstructpgclicommon
    fi
}

alias apsetuppgcli="ap_func_setup_pgcli"
ap_func_setup_pgcli() {
    # https://github.com/dbcli/pgcli
    aplogshow "Install [pgcli]\n"
    pip install pgcli
    # pip install ipython-sql # you can call pgcli if using old ipython

    apinitpgcli
    if alias apcreatedirstructpgcli &>/dev/null; then
        apcreatedirstructpgcli
    fi
}

alias aprmpgcli="ap_func_rm_pgcli"
ap_func_rm_pgcli() {
    aplogshow "Remove [pgcli]\n"
    pip uninstall pgcli
    # pip uninstall ipython-sql

    if alias aprmdirstructpgcli &>/dev/null; then
        aprmdirstructpgcli
    fi

    if alias aprmglobalsymlinkpgcli &>/dev/null; then
        aprmglobalsymlinkpgcli
    fi
}
