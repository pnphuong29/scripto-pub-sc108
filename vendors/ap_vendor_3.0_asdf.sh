alias @initasdf="ap_func_init_asdf"
ap_func_init_asdf() {
    if [ -d "${HOME}/.asdf" ]; then
        source "${HOME}/.asdf/asdf.sh"
        source "${HOME}/.asdf/completions/asdf.bash"
    fi

    if alias @initasdfshare &>/dev/null; then
        @initasdfshare
    fi

    if alias @initasdfcommon &>/dev/null; then
        @initasdfcommon
    fi
}

alias @createdirstructasdf="ap_func_create_dirstruct_asdf"
ap_func_create_dirstruct_asdf() {
    @logshow "Generate [asdf] bash autocomplete\n"
    asdf >"${AP_COMPLETIONS_DIR}/ap_completion_asdf.bash"

    if alias @createdirstructasdfshare &>/dev/null; then
        @createdirstructasdfshare
    fi

    if alias @createdirstructasdfcommon &>/dev/null; then
        @createdirstructasdfcommon
    fi
}

alias @rmdirstructasdf="ap_func_rm_dirstruct_asdf"
ap_func_rm_dirstruct_asdf() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_asdf.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_asdf.bash"

    if alias @rmdirstructasdfshare &>/dev/null; then
        @rmdirstructasdfshare
    fi

    if alias @rmdirstructasdfcommon &>/dev/null; then
        @rmdirstructasdfcommon
    fi
}

alias @setupasdf="ap_func_setup_asdf"
ap_func_setup_asdf() {
    local ap_asdf_setup_version='0.14.0'
    if [ -n "$1" ]; then
        ap_asdf_setup_version="$1"
    fi

    @logshow "Install [asdf] v${ap_asdf_setup_version}\n"

    @logshow "Install [asdf]\n"

    # Remove old app dir if any
    rm -rf "${HOME}/.asdf"

    # Install asdf
    git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf" --branch "v${ap_asdf_setup_version}"

    @initasdf
    if alias @createdirstructasdf &>/dev/null; then
        @createdirstructasdf
    fi
}

alias @rmasdf="ap_func_rm_asdf"
ap_func_rm_asdf() {
    @logshow "Remove [asdf]\n"
    rm -rf "${HOME}/.asdf"

    if alias @rmdirstructasdf &>/dev/null; then
        @rmdirstructasdf
    fi

    if alias @rmglobalsymlinkasdf &>/dev/null; then
        @rmglobalsymlinkasdf
    fi
}
