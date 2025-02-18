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
    aplogshow "Generate [dnote] bash autocomplete\n"
    curl -SL "https://raw.githubusercontent.com/dnote/dnote/b47c792d5fcf610db103ab49c57862e49333e13f/pkg/cli/dnote-completion.bash" >"${AP_COMPLETIONS_DIR}/ap_completion_dnote.bash"

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

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            brew tap dnote/dnote
            brew install dnote
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -s https://www.getdnote.com/install | sh
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -s https://www.getdnote.com/install | sh
    fi

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
