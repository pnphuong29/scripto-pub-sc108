alias apinitchtsh="ap_func_init_chtsh"
ap_func_init_chtsh() {
    if alias apinitchtshshare &>/dev/null; then
        apinitchtshshare
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

alias aprmdirstructchtsh="ap_func_rm_dirstruct_chtsh"
ap_func_rm_dirstruct_chtsh() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash"

    if alias aprmdirstructchtshshare &>/dev/null; then
        aprmdirstructchtshshare
    fi

    if alias aprmdirstructchtshcommon &>/dev/null; then
        aprmdirstructchtshcommon
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

alias aprmchtsh="ap_func_rm_chtsh"
ap_func_rm_chtsh() {
    aplogshow "Remove [chtsh]\n"
    rm -rf "${AP_SOFT_DIR}/bin/cht.sh"

    if alias aprmdirstructchtsh &>/dev/null; then
        aprmdirstructchtsh
    fi

    if alias aprmglobalsymlinkchtsh &>/dev/null; then
        aprmglobalsymlinkchtsh
    fi
}
