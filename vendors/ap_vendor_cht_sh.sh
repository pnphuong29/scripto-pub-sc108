alias apinitchtsh="ap_func_init_chtsh"
ap_func_init_chtsh() {
    export CHTSH_CONF="${HOME}/scripto/vendors/cht-sh/ap_cht_sh.conf"
    alias ref='cht.sh'
    alias chtdemostyles='curl cht.sh/:styles-demo'

    if alias apcreatedirstructchtshshare &>/dev/null; then
        apcreatedirstructchtshshare
    fi

    if alias apinitchtshcommon &>/dev/null; then
        apinitchtshcommon
    fi
}

alias apcreatedirstructchtsh="ap_func_create_dirstruct_chtsh"
ap_func_create_dirstruct_chtsh() {
    aplogshow "Generate [chtsh] bash autocomplete\n"
    curl -SL "https://cheat.sh/:bash_completion" -o "${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash"

    if alias apcreatedirstructchtshshare &>/dev/null; then
        apcreatedirstructchtshshare
    fi

    if alias apcreatedirstructchtshcommon &>/dev/null; then
        apcreatedirstructchtshcommon
    fi
}

alias rmdirstructchtsh="ap_func_rm_dirstruct_chtsh"
ap_func_rm_dirstruct_chtsh() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash"

    if alias rmdirstructchtshshare &>/dev/null; then
        rmdirstructchtshshare
    fi

    if alias rmdirstructchtshcommon &>/dev/null; then
        rmdirstructchtshcommon
    fi
}

alias apsetupchtsh="ap_func_setup_chtsh"
ap_func_setup_chtsh() {
    # https://github.com/chubin/cheat.sh
    aplogshow "Install [chtsh]\n"
    curl -L https://cht.sh/:cht.sh >"${AP_SOFT_DIR}/bin/cht.sh"
    chmod +x "${AP_SOFT_DIR}/bin/cht.sh"

    if alias apcreatedirstructchtsh &>/dev/null; then
        apcreatedirstructchtsh
    fi
}

alias rmchtsh="ap_func_rm_chtsh"
ap_func_rm_chtsh() {
    aplogshow "Remove [chtsh]\n"
    rm -rf "${AP_SOFT_DIR}/bin/cht.sh"

    if alias rmdirstructchtsh &>/dev/null; then
        rmdirstructchtsh
    fi

    if alias rmglobalsymlinkchtsh &>/dev/null; then
        rmglobalsymlinkchtsh
    fi
}
