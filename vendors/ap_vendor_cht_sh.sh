alias @initchtsh="ap_func_init_chtsh"
ap_func_init_chtsh() {
    export CHTSH_CONF="${AP_SCRIPTO_DIR}/vendors/cht-sh/ap_cht_sh.conf"
    alias ref='cht.sh'
    alias chtdemostyles='curl cht.sh/:styles-demo'

    if alias @initchtshcommon &>/dev/null; then
        @initchtshcommon
    fi
}

alias @createdirstructchtsh="ap_func_create_dirstruct_chtsh"
ap_func_create_dirstruct_chtsh() {
    @logshow "Generate [chtsh] bash autocomplete\n"
    curl -SL "https://cheat.sh/:bash_completion" -o "${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash"
    if alias @createdirstructchtshcommon &>/dev/null; then
        @createdirstructchtshcommon
    fi
}

alias @rmdirstructchtsh="ap_func_remove_dirstruct_chtsh"
ap_func_remove_dirstruct_chtsh() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_chtsh.bash"
    if alias @rmdirstructchtshcommon &>/dev/null; then
        @rmdirstructchtshcommon
    fi
}

alias @setupchtsh="ap_func_setup_chtsh"
ap_func_setup_chtsh() {
    # https://github.com/chubin/cheat.sh
    @logshow "Install [chtsh]\n"
    curl -L https://cht.sh/:cht.sh >"${AP_SOFT_DIR}/bin/cht.sh"
    chmod +x "${AP_SOFT_DIR}/bin/cht.sh"
    if alias @createdirstructchtsh &>/dev/null; then
        @createdirstructchtsh
    fi
}

alias @rmchtsh="ap_func_remove_chtsh"
ap_func_remove_chtsh() {
    @logshow "Remove [chtsh]\n"
    rm -rf "${AP_SOFT_DIR}/bin/cht.sh"
    if alias @rmdirstructchtsh &>/dev/null; then
        @rmdirstructchtsh
    fi
}
