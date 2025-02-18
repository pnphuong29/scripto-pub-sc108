alias apinitcolorpicker="ap_func_init_colorpicker"
ap_func_init_colorpicker() {
    if alias apinitcolorpickershare &>/dev/null; then
        apinitcolorpickershare
    fi

    if alias apinitcolorpickercommon &>/dev/null; then
        apinitcolorpickercommon
    fi

    if alias apinitcolorpickermain &>/dev/null; then
        apinitcolorpickermain
    fi
}

alias apcreatedirstructcolorpicker="ap_func_create_dirstruct_colorpicker"
ap_func_create_dirstruct_colorpicker() {
    if alias apcreatedirstructcolorpickershare &>/dev/null; then
        apcreatedirstructcolorpickershare
    fi

    if alias apcreatedirstructcolorpickercommon &>/dev/null; then
        apcreatedirstructcolorpickercommon
    fi

    if alias apcreatedirstructcolorpickermain &>/dev/null; then
        apcreatedirstructcolorpickermain
    fi
}

alias aprmdirstructcolorpicker="ap_func_rm_dirstruct_colorpicker"
ap_func_rm_dirstruct_colorpicker() {
    if alias aprmdirstructcolorpickershare &>/dev/null; then
        aprmdirstructcolorpickershare
    fi

    if alias aprmdirstructcolorpickercommon &>/dev/null; then
        aprmdirstructcolorpickercommon
    fi

    if alias aprmdirstructcolorpickermain &>/dev/null; then
        aprmdirstructcolorpickermain
    fi
}

alias apsetupcolorpicker="ap_func_setup_colorpicker"
ap_func_setup_colorpicker() {
    aplogshow "Install [colorpicker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap install color-picker
    fi

    apinitcolorpicker
    if alias apcreatedirstructcolorpicker &>/dev/null; then
        apcreatedirstructcolorpicker
    fi
}

alias aprmcolorpicker="ap_func_rm_colorpicker"
ap_func_rm_colorpicker() {
    aplogshow "Remove [colorpicker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge color-picker
    fi

    if alias aprmdirstructcolorpicker &>/dev/null; then
        aprmdirstructcolorpicker
    fi

    if alias aprmglobalsymlinkcolorpicker &>/dev/null; then
        aprmglobalsymlinkcolorpicker
    fi
}
