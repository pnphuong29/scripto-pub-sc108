alias apinitdnote="ap_func_init_dnote"
ap_func_init_dnote() {
    if alias apinitdnoteshare &>/dev/null; then
        apinitdnoteshare
    fi

    if alias apinitdnotecommon &>/dev/null; then
        apinitdnotecommon
    fi

    if alias apinitdnotemain &>/dev/null; then
        apinitdnotemain
    fi
}

alias apcreatedirstructdnote="ap_func_create_dirstruct_dnote"
ap_func_create_dirstruct_dnote() {
    if alias apcreatedirstructdnoteshare &>/dev/null; then
        apcreatedirstructdnoteshare
    fi

    if alias apcreatedirstructdnotecommon &>/dev/null; then
        apcreatedirstructdnotecommon
    fi

    if alias apcreatedirstructdnotemain &>/dev/null; then
        apcreatedirstructdnotemain
    fi
}

alias aprmdirstructdnote="ap_func_rm_dirstruct_dnote"
ap_func_rm_dirstruct_dnote() {
    if alias aprmdirstructdnoteshare &>/dev/null; then
        aprmdirstructdnoteshare
    fi

    if alias aprmdirstructdnotecommon &>/dev/null; then
        aprmdirstructdnotecommon
    fi

    if alias aprmdirstructdnotemain &>/dev/null; then
        aprmdirstructdnotemain
    fi
}

alias apsetupdnote="ap_func_setup_dnote"
ap_func_setup_dnote() {
    aplogshow "Install [dnote]\n"

    curl -s https://www.getdnote.com/install | sh

    apinitdnote
    if alias apcreatedirstructdnote &>/dev/null; then
        apcreatedirstructdnote
    fi
}

alias aprmdnote="ap_func_rm_dnote"
ap_func_rm_dnote() {
    aplogshow "Remove [dnote]\n"

    if alias aprmdirstructdnote &>/dev/null; then
        aprmdirstructdnote
    fi

    if alias aprmglobalsymlinkdnote &>/dev/null; then
        aprmglobalsymlinkdnote
    fi
}
