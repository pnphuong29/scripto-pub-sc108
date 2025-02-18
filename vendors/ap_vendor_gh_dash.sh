alias apinitghdash="ap_func_init_ghdash"
ap_func_init_ghdash() {
    if alias apinitghdashshare &>/dev/null; then
        apinitghdashshare
    fi

    if alias apinitghdashcommon &>/dev/null; then
        apinitghdashcommon
    fi

    if alias apinitghdashmain &>/dev/null; then
        apinitghdashmain
    fi
}

alias apcreatedirstructghdash="ap_func_create_dirstruct_ghdash"
ap_func_create_dirstruct_ghdash() {
    if alias apcreatedirstructghdashshare &>/dev/null; then
        apcreatedirstructghdashshare
    fi

    if alias apcreatedirstructghdashcommon &>/dev/null; then
        apcreatedirstructghdashcommon
    fi

    if alias apcreatedirstructghdashmain &>/dev/null; then
        apcreatedirstructghdashmain
    fi
}

alias aprmdirstructghdash="ap_func_rm_dirstruct_ghdash"
ap_func_rm_dirstruct_ghdash() {
    if alias aprmdirstructghdashshare &>/dev/null; then
        aprmdirstructghdashshare
    fi

    if alias aprmdirstructghdashcommon &>/dev/null; then
        aprmdirstructghdashcommon
    fi

    if alias aprmdirstructghdashmain &>/dev/null; then
        aprmdirstructghdashmain
    fi
}

alias apsetupghdash="ap_func_setup_ghdash"
ap_func_setup_ghdash() {
    aplogshow "Install [gh dash]\n"

    gh extension install dlvhdr/gh-dash
    apinitghdash

    if alias apcreatedirstructghdash &>/dev/null; then
        apcreatedirstructghdash
    fi
}

alias aprmghdash="ap_func_rm_ghdash"
ap_func_rm_ghdash() {
    aplogshow "Remove [gh dash]\n"

    gh extension remove dlvhdr/gh-dash

    if alias aprmdirstructghdash &>/dev/null; then
        aprmdirstructghdash
    fi

    if alias aprmglobalsymlinkghdash &>/dev/null; then
        aprmglobalsymlinkghdash
    fi
}
