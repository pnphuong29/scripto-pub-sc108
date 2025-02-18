alias apinitsentry="ap_func_init_sentry"
ap_func_init_sentry() {
    alias sentrycli='sentry-cli'

    if alias apinitsentryshare &>/dev/null; then
        apinitsentryshare
    fi

    if alias apinitsentrycommon &>/dev/null; then
        apinitsentrycommon
    fi

    if alias apinitsentrymain &>/dev/null; then
        apinitsentrymain
    fi
}

alias apcreatedirstructsentry="ap_func_create_dirstruct_sentry"
ap_func_create_dirstruct_sentry() {
    aplogshow "Generate [sentry] bash autocomplete\n"
    sentry-cli completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_sentry.bash"

    if alias apcreatedirstructsentryshare &>/dev/null; then
        apcreatedirstructsentryshare
    fi

    if alias apcreatedirstructsentrycommon &>/dev/null; then
        apcreatedirstructsentrycommon
    fi

    if alias apcreatedirstructsentrymain &>/dev/null; then
        apcreatedirstructsentrymain
    fi
}

alias aprmdirstructsentry="ap_func_rm_dirstruct_sentry"
ap_func_rm_dirstruct_sentry() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_sentry.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_sentry.bash"

    if alias aprmdirstructsentryshare &>/dev/null; then
        aprmdirstructsentryshare
    fi

    if alias aprmdirstructsentrycommon &>/dev/null; then
        aprmdirstructsentrycommon
    fi

    if alias aprmdirstructsentrymain &>/dev/null; then
        aprmdirstructsentrymain
    fi
}

alias apsetupsentry="ap_func_setup_sentry"
ap_func_setup_sentry() {
    aplogshow "Install [sentry]\n"

    # curl -sL https://sentry.io/get-cli/ | sh
    npm install -g @sentry/cli --unsafe-perm

    apinitsentry
    if alias apcreatedirstructsentry &>/dev/null; then
        apcreatedirstructsentry
    fi
}

alias aprmsentry="ap_func_rm_sentry"
ap_func_rm_sentry() {
    aplogshow "Remove [sentry]\n"

    npm uninstall -g @sentry/cli --unsafe-perm

    if alias aprmdirstructsentry &>/dev/null; then
        aprmdirstructsentry
    fi

    if alias aprmglobalsymlinksentry &>/dev/null; then
        aprmglobalsymlinksentry
    fi
}
