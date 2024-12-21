alias apinitmattermost="ap_func_init_mattermost"
ap_func_init_mattermost() {
    export AP_MATTERMOST_SETUP_VERSION='v8'

    if alias apinitmattermostshare &>/dev/null; then
        apinitmattermostshare
    fi

    if alias apinitmattermostcommon &>/dev/null; then
        apinitmattermostcommon
    fi

    if alias apinitmattermostmain &>/dev/null; then
        apinitmattermostmain
    fi
}

alias apcreatedirstructmattermost="ap_func_create_dirstruct_mattermost"
ap_func_create_dirstruct_mattermost() {
    aplogshow "Generate [mattermost] bash autocomplete\n"
    mmctl completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_mattermost.bash"

    if alias apcreatedirstructmattermostshare &>/dev/null; then
        apcreatedirstructmattermostshare
    fi

    if alias apcreatedirstructmattermostcommon &>/dev/null; then
        apcreatedirstructmattermostcommon
    fi

    if alias apcreatedirstructmattermostmain &>/dev/null; then
        apcreatedirstructmattermostmain
    fi
}

alias aprmdirstructmattermost="ap_func_rm_dirstruct_mattermost"
ap_func_rm_dirstruct_mattermost() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_mattermost.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_mattermost.bash"

    if alias aprmdirstructmattermostshare &>/dev/null; then
        aprmdirstructmattermostshare
    fi

    if alias aprmdirstructmattermostcommon &>/dev/null; then
        aprmdirstructmattermostcommon
    fi

    if alias aprmdirstructmattermostmain &>/dev/null; then
        aprmdirstructmattermostmain
    fi
}

alias apsetupmattermost="ap_func_setup_mattermost"
ap_func_setup_mattermost() {
    local ap_mattermost_setup_version="${AP_MATTERMOST_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_mattermost_setup_version="$1"
    fi

    aplogshow "Install [mattermost] v${ap_mattermost_setup_version}\n"
    go install github.com/mattermost/mattermost/server/v8/cmd/mmctl@master

    apinitmattermost
    if alias apcreatedirstructmattermost &>/dev/null; then
        apcreatedirstructmattermost
    fi
}

alias aprmmattermost="ap_func_rm_mattermost"
ap_func_rm_mattermost() {
    local ap_mattermost_remove_version=''
    if [ -n "$1" ]; then
        ap_mattermost_remove_version="$1"
    fi

    aplogshow "Remove [mattermost] v${ap_mattermost_remove_version}\n"
    rm -rf "${GOPATH}/pkg/mod/github.com/mattermost/mattermost@"*
    rm -f "${GOPATH}/bin/mattermost"

    if alias aprmdirstructmattermost &>/dev/null; then
        aprmdirstructmattermost
    fi

    if alias aprmglobalsymlinkmattermost &>/dev/null; then
        aprmglobalsymlinkmattermost
    fi
}
