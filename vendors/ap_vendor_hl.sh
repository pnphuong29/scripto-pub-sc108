# https://github.com/pamburus/hl
alias apinithl="ap_func_init_hl"
ap_func_init_hl() {
    if alias apinithlshare &>/dev/null; then
        apinithlshare
    fi

    if alias apinithlcommon &>/dev/null; then
        apinithlcommon
    fi

    if alias apinithlmain &>/dev/null; then
        apinithlmain
    fi
}

alias apcreatedirstructhl="ap_func_create_dirstruct_hl"
ap_func_create_dirstruct_hl() {
    aplogshow "Generate [hl] bash autocomplete\n"
    hl --shell-completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_hl.bash"

    if alias apcreatedirstructhlshare &>/dev/null; then
        apcreatedirstructhlshare
    fi

    if alias apcreatedirstructhlcommon &>/dev/null; then
        apcreatedirstructhlcommon
    fi

    if alias apcreatedirstructhlmain &>/dev/null; then
        apcreatedirstructhlmain
    fi
}

alias aprmdirstructhl="ap_func_rm_dirstruct_hl"
ap_func_rm_dirstruct_hl() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_hl.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_hl.bash"

    if alias aprmdirstructhlshare &>/dev/null; then
        aprmdirstructhlshare
    fi

    if alias aprmdirstructhlcommon &>/dev/null; then
        aprmdirstructhlcommon
    fi

    if alias aprmdirstructhlmain &>/dev/null; then
        aprmdirstructhlmain
    fi
}

alias apcreateglobalsymlinkhl="ap_func_create_global_symlink_hl"
ap_func_create_global_symlink_hl() {
    if [ -f "${AP_SOFT_DIR}/bin/hl" ]; then
        aplogshow "Create symlink from [/usr/local/bin/hl] to [${AP_SOFT_DIR}/bin/hl]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/hl" "/usr/local/bin/hl"
    fi
}

alias aprmglobalsymlinkhl="ap_func_rm_global_symlink_hl"
ap_func_rm_global_symlink_hl() {
    if [ -f "/usr/local/bin/hl" ]; then
        aplogshow "Remove [/usr/local/bin/hl]\n"
        sudo rm -f "/usr/local/bin/hl"
    fi
}

alias apsetuphl="ap_func_setup_hl"
ap_func_setup_hl() {
    aplogshow "Install [hl]\n"

    rm -f "${AP_SOFT_DIR}/bin/hl"
    cd "${AP_SOFT_DIR}/bin"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -sSfL https://github.com/pamburus/hl/releases/latest/download/hl-macos.tar.gz | tar xz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -sSfL https://github.com/pamburus/hl/releases/latest/download/hl-linux-x86_64-musl.tar.gz | tar xz
    fi

    apinithl
    apcreateglobalsymlinkhl

    if alias apcreatedirstructhl &>/dev/null; then
        apcreatedirstructhl
    fi
}

alias aprmhl="ap_func_rm_hl"
ap_func_rm_hl() {
    aplogshow "Remove [hl]\n"
    rm -f "${AP_SOFT_DIR}/bin/hl"

    if alias aprmdirstructhl &>/dev/null; then
        aprmdirstructhl
    fi

    if alias aprmglobalsymlinkhl &>/dev/null; then
        aprmglobalsymlinkhl
    fi
}
