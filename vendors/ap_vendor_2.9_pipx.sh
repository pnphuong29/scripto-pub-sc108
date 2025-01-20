alias apinitpipx="ap_func_init_pipx"
ap_func_init_pipx() {
    if alias apinitpipxshare &>/dev/null; then
        apinitpipxshare
    fi

    if alias apinitpipxcommon &>/dev/null; then
        apinitpipxcommon
    fi
}

alias apcreatedirstructpipx="ap_func_create_dirstruct_pipx"
ap_func_create_dirstruct_pipx() {
    aplogshow "Generate [pipx] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    register-python-argcomplete pipx >"${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"

    if alias apcreatedirstructpipxshare &>/dev/null; then
        apcreatedirstructpipxshare
    fi

    if alias apcreatedirstructpipxcommon &>/dev/null; then
        apcreatedirstructpipxcommon
    fi
}

alias aprmdirstructpipx="ap_func_rm_dirstruct_pipx"
ap_func_rm_dirstruct_pipx() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pipx.bash"

    if alias aprmdirstructpipxshare &>/dev/null; then
        aprmdirstructpipxshare
    fi

    if alias aprmdirstructpipxcommon &>/dev/null; then
        aprmdirstructpipxcommon
    fi
}

alias apsetuppipx="ap_func_setup_pipx"
ap_func_setup_pipx() {
    aplogshow "Install [pipx]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew install pipx
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt update
    #     sudo apt install pipx
    # fi

    pip install --user pipx
    pipx ensurepath

    apinitpipx
    if alias apcreatedirstructpipx &>/dev/null; then
        apcreatedirstructpipx
    fi
}

alias aprmpipx="ap_func_rm_pipx"
ap_func_rm_pipx() {
    aplogshow "Remove [pipx]\n"

    # if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    #     brew remove pipx
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    #     sudo apt purge -y pipx
    # fi

    pip uninstall --user pipx

    if alias aprmdirstructpipx &>/dev/null; then
        aprmdirstructpipx
    fi

    if alias aprmglobalsymlinkpipx &>/dev/null; then
        aprmglobalsymlinkpipx
    fi
}
