alias apinitpspg="ap_func_init_pspg"
ap_func_init_pspg() {
    if alias apinitpspgshare &>/dev/null; then
        apinitpspgshare
    fi

    if alias apinitpspgcommon &>/dev/null; then
        apinitpspgcommon
    fi

    if alias apinitpspgmain &>/dev/null; then
        apinitpspgmain
    fi
}

alias apcreatedirstructpspg="ap_func_create_dirstruct_pspg"
ap_func_create_dirstruct_pspg() {
    # apshowmsginfo "Generate [pspg] bash autocomplete\n"
    # curl -SL "https://raw.githubusercontent.com/okbob/pspg/refs/heads/master/bash-completion.sh" >"${AP_COMPLETIONS_DIR}/ap_completion_pspg.bash"

    apshowmsginfo "Generate [pspg] man page\n"
    curl -SL "https://raw.githubusercontent.com/okbob/pspg/refs/heads/master/pspg.1" >"${AP_MAN_DIR}/man1/pspg.1"

    if alias apcreatedirstructpspgshare &>/dev/null; then
        apcreatedirstructpspgshare
    fi

    if alias apcreatedirstructpspgcommon &>/dev/null; then
        apcreatedirstructpspgcommon
    fi

    if alias apcreatedirstructpspgmain &>/dev/null; then
        apcreatedirstructpspgmain
    fi
}

alias aprmdirstructpspg="ap_func_rm_dirstruct_pspg"
ap_func_rm_dirstruct_pspg() {
    if alias aprmdirstructpspgshare &>/dev/null; then
        aprmdirstructpspgshare
    fi

    if alias aprmdirstructpspgcommon &>/dev/null; then
        aprmdirstructpspgcommon
    fi

    if alias aprmdirstructpspgmain &>/dev/null; then
        aprmdirstructpspgmain
    fi
}

alias apsetuppspg="ap_func_setup_pspg"
ap_func_setup_pspg() {
    # https://github.com/okbob/pspg
    aplogshow "Install [pspg]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install pspg
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt-get install -y pspg
    fi

    apinitpspg
    if alias apcreatedirstructpspg &>/dev/null; then
        apcreatedirstructpspg
    fi
}

alias aprmpspg="ap_func_rm_pspg"
ap_func_rm_pspg() {
    aplogshow "Remove [pspg]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove pspg
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt-get purge -y pspg
    fi

    if alias aprmdirstructpspg &>/dev/null; then
        aprmdirstructpspg
    fi

    if alias aprmglobalsymlinkpspg &>/dev/null; then
        aprmglobalsymlinkpspg
    fi
}
