alias apinitasdf="ap_func_init_asdf"
ap_func_init_asdf() {
    if [ -d "${HOME}/.asdf" ]; then
        source "${HOME}/.asdf/asdf.sh"
        source "${HOME}/.asdf/completions/asdf.bash"
    fi

    if alias apinitasdfshare &>/dev/null; then
        apinitasdfshare
    fi

    if alias apinitasdfcommon &>/dev/null; then
        apinitasdfcommon
    fi
}

alias apcreatedirstructasdf="ap_func_create_dirstruct_asdf"
ap_func_create_dirstruct_asdf() {
    aplogshow "Generate [asdf] bash autocomplete\n"
    asdf >"${AP_COMPLETIONS_DIR}/ap_completion_asdf.bash"

    if alias apcreatedirstructasdfshare &>/dev/null; then
        apcreatedirstructasdfshare
    fi

    if alias apcreatedirstructasdfcommon &>/dev/null; then
        apcreatedirstructasdfcommon
    fi
}

alias rmdirstructasdf="ap_func_rm_dirstruct_asdf"
ap_func_rm_dirstruct_asdf() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_asdf.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_asdf.bash"

    if alias rmdirstructasdfshare &>/dev/null; then
        rmdirstructasdfshare
    fi

    if alias rmdirstructasdfcommon &>/dev/null; then
        rmdirstructasdfcommon
    fi
}

alias apsetupasdf="ap_func_setup_asdf"
ap_func_setup_asdf() {
    local ap_asdf_setup_version='0.14.0'
    if [ -n "$1" ]; then
        ap_asdf_setup_version="$1"
    fi

    aplogshow "Install [asdf] v${ap_asdf_setup_version}\n"

    aplogshow "Install [asdf]\n"

    # Remove old app dir if any
    rm -rf "${HOME}/.asdf"

    # Install asdf
    git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf" --branch "v${ap_asdf_setup_version}"

    apinitasdf
    if alias apcreatedirstructasdf &>/dev/null; then
        apcreatedirstructasdf
    fi
}

alias rmasdf="ap_func_rm_asdf"
ap_func_rm_asdf() {
    aplogshow "Remove [asdf]\n"
    rm -rf "${HOME}/.asdf"

    if alias rmdirstructasdf &>/dev/null; then
        rmdirstructasdf
    fi

    if alias rmglobalsymlinkasdf &>/dev/null; then
        rmglobalsymlinkasdf
    fi
}
