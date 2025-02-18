alias apinithttpie="ap_func_init_httpie"
ap_func_init_httpie() {
    if alias apinithttpieshare &>/dev/null; then
        apinithttpieshare
    fi

    if alias apinithttpiecommon &>/dev/null; then
        apinithttpiecommon
    fi
}

alias apcreatedirstructhttpie="ap_func_create_dirstruct_httpie"
ap_func_create_dirstruct_httpie() {
    if alias apcreatedirstructhttpieshare &>/dev/null; then
        apcreatedirstructhttpieshare
    fi

    if alias apcreatedirstructhttpiecommon &>/dev/null; then
        apcreatedirstructhttpiecommon
    fi
}

alias aprmdirstructhttpie="ap_func_rm_dirstruct_httpie"
ap_func_rm_dirstruct_httpie() {
    if alias aprmdirstructhttpieshare &>/dev/null; then
        aprmdirstructhttpieshare
    fi

    if alias aprmdirstructhttpiecommon &>/dev/null; then
        aprmdirstructhttpiecommon
    fi
}

alias apsetuphttpie="ap_func_setup_httpie"
ap_func_setup_httpie() {
    aplogshow "Install [httpie, httpcat, http-prompt]\n"

    # pip install --upgrade httpie
    uv tool install httpie
    uv tool install httpcat
    uv tool install http-prompt

    apinithttpie
    if alias apcreatedirstructhttpie &>/dev/null; then
        apcreatedirstructhttpie
    fi
}

alias aprmhttpie="ap_func_rm_httpie"
ap_func_rm_httpie() {
    aplogshow "Remove [httpie, httpcat, http-prompt]\n"

    # pip uninstall httpie
    ux tool uninstall httpie
    ux tool uninstall httpcat
    ux tool uninstall http-prompt

    if alias aprmdirstructhttpie &>/dev/null; then
        aprmdirstructhttpie
    fi

    if alias aprmglobalsymlinkhttpie &>/dev/null; then
        aprmglobalsymlinkhttpie
    fi
}
