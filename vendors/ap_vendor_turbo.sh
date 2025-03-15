alias apinitturbo="ap_func_init_turbo"
ap_func_init_turbo() {
    if alias apinitturboshare &>/dev/null; then
        apinitturboshare
    fi

    if alias apinitturbocommon &>/dev/null; then
        apinitturbocommon
    fi

    if alias apinitturbomain &>/dev/null; then
        apinitturbomain
    fi
}

alias apcreatedirstructturbo="ap_func_create_dirstruct_turbo"
ap_func_create_dirstruct_turbo() {
    apshowmsginfo "Generate [turbo] bash autocomplete\n"
    turbo completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash"

    if alias apcreatedirstructturboshare &>/dev/null; then
        apcreatedirstructturboshare
    fi

    if alias apcreatedirstructturbocommon &>/dev/null; then
        apcreatedirstructturbocommon
    fi

    if alias apcreatedirstructturbomain &>/dev/null; then
        apcreatedirstructturbomain
    fi
}

alias aprmdirstructturbo="ap_func_rm_dirstruct_turbo"
ap_func_rm_dirstruct_turbo() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_turbo.bash"

    if alias aprmdirstructturboshare &>/dev/null; then
        aprmdirstructturboshare
    fi

    if alias aprmdirstructturbocommon &>/dev/null; then
        aprmdirstructturbocommon
    fi

    if alias aprmdirstructturbomain &>/dev/null; then
        aprmdirstructturbomain
    fi
}

alias apsetupturbo="ap_func_setup_turbo"
ap_func_setup_turbo() {
    apshowmsginfo "Install [turbo]\n"

    pnpm install -g turbo
    apinitturbo

    if alias apcreatedirstructturbo &>/dev/null; then
        apcreatedirstructturbo
    fi
}

alias aprmturbo="ap_func_rm_turbo"
ap_func_rm_turbo() {
    apshowmsginfo "Remove [turbo]\n"
    pnpm uninstall -g turbo

    if alias aprmdirstructturbo &>/dev/null; then
        aprmdirstructturbo
    fi

    if alias aprmglobalsymlinkturbo &>/dev/null; then
        aprmglobalsymlinkturbo
    fi
}
