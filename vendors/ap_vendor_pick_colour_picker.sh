alias apinitpickcolourpicker="ap_func_init_pickcolourpicker"
ap_func_init_pickcolourpicker() {
    if alias apinitpickcolourpickershare &>/dev/null; then
        apinitpickcolourpickershare
    fi

    if alias apinitpickcolourpickercommon &>/dev/null; then
        apinitpickcolourpickercommon
    fi

    if alias apinitpickcolourpickermain &>/dev/null; then
        apinitpickcolourpickermain
    fi
}

alias apcreatedirstructpickcolourpicker="ap_func_create_dirstruct_pickcolourpicker"
ap_func_create_dirstruct_pickcolourpicker() {
    if alias apcreatedirstructpickcolourpickershare &>/dev/null; then
        apcreatedirstructpickcolourpickershare
    fi

    if alias apcreatedirstructpickcolourpickercommon &>/dev/null; then
        apcreatedirstructpickcolourpickercommon
    fi

    if alias apcreatedirstructpickcolourpickermain &>/dev/null; then
        apcreatedirstructpickcolourpickermain
    fi
}

alias aprmdirstructpickcolourpicker="ap_func_rm_dirstruct_pickcolourpicker"
ap_func_rm_dirstruct_pickcolourpicker() {
    if alias aprmdirstructpickcolourpickershare &>/dev/null; then
        aprmdirstructpickcolourpickershare
    fi

    if alias aprmdirstructpickcolourpickercommon &>/dev/null; then
        aprmdirstructpickcolourpickercommon
    fi

    if alias aprmdirstructpickcolourpickermain &>/dev/null; then
        aprmdirstructpickcolourpickermain
    fi
}

alias apsetuppickcolourpicker="ap_func_setup_pickcolourpicker"
ap_func_setup_pickcolourpicker() {
    aplogshow "Install [pickcolourpicker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap install -y pick-colour-picker
    fi

    apinitpickcolourpicker
    if alias apcreatedirstructpickcolourpicker &>/dev/null; then
        apcreatedirstructpickcolourpicker
    fi
}

alias aprmpickcolourpicker="ap_func_rm_pickcolourpicker"
ap_func_rm_pickcolourpicker() {
    aplogshow "Remove [pickcolourpicker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge pick-colour-picker
    fi

    if alias aprmdirstructpickcolourpicker &>/dev/null; then
        aprmdirstructpickcolourpicker
    fi

    if alias aprmglobalsymlinkpickcolourpicker &>/dev/null; then
        aprmglobalsymlinkpickcolourpicker
    fi
}
