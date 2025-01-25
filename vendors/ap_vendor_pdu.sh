alias apinitpdu="ap_func_init_pdu"
ap_func_init_pdu() {
    if alias apinitpdushare &>/dev/null; then
        apinitpdushare
    fi

    if alias apinitpducommon &>/dev/null; then
        apinitpducommon
    fi

    if alias apinitpdumain &>/dev/null; then
        apinitpdumain
    fi
}

alias apcreatedirstructpdu="ap_func_create_dirstruct_pdu"
ap_func_create_dirstruct_pdu() {
    # aplogshow "Generate [pdu] bash autocomplete\n"
    # curl -SL "https://raw.githubusercontent.com/KSXGitHub/parallel-disk-usage/refs/heads/master/generate-completions.sh" >"${AP_COMPLETIONS_DIR}/ap_completion_pdu.bash"

    if alias apcreatedirstructpdushare &>/dev/null; then
        apcreatedirstructpdushare
    fi

    if alias apcreatedirstructpducommon &>/dev/null; then
        apcreatedirstructpducommon
    fi

    if alias apcreatedirstructpdumain &>/dev/null; then
        apcreatedirstructpdumain
    fi
}

alias aprmdirstructpdu="ap_func_rm_dirstruct_pdu"
ap_func_rm_dirstruct_pdu() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pdu.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pdu.bash"

    if alias aprmdirstructpdushare &>/dev/null; then
        aprmdirstructpdushare
    fi

    if alias aprmdirstructpducommon &>/dev/null; then
        aprmdirstructpducommon
    fi

    if alias aprmdirstructpdumain &>/dev/null; then
        aprmdirstructpdumain
    fi
}

alias apcreateglobalsymlinkpdu="ap_func_create_global_symlink_pdu"
ap_func_create_global_symlink_pdu() {
    # if [ -f "${HOME}/.cargo/bin/pdu" ]; then
    if [ -f "${AP_SOFT_DIR}/bin/pdu" ]; then
        aplogshow "Create symlink from [/usr/local/bin/pdu] to [${AP_SOFT_DIR}/bin/pdu]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/pdu" "/usr/local/bin/pdu"
    fi
}

alias aprmglobalsymlinkpdu="ap_func_rm_global_symlink_pdu"
ap_func_rm_global_symlink_pdu() {
    if [ -f "/usr/local/bin/pdu" ]; then
        aplogshow "Remove [/usr/local/bin/pdu]\n"
        sudo rm -f "/usr/local/bin/pdu"
    fi
}

alias apsetuppdu="ap_func_setup_pdu"
ap_func_setup_pdu() {
    aplogshow "Install [pdu]\n"

    # Install binary only
    # cargo install parallel-disk-usage --bin pdu

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/bin/pdu"
    rm -rf "${AP_TMP_DIR}/pdu"

    # Install pdu
    mkdir -p "${AP_TMP_DIR}/pdu"
    cd "${AP_TMP_DIR}/pdu"

    git clone "https://github.com/KSXGitHub/parallel-disk-usage.git"
    cd "parallel-disk-usage"

    cargo build --bin pdu --release
    cp -f target/release/pdu "${AP_SOFT_DIR}/bin/pdu"

    ./generate-completions.sh
    cp -f exports/completion.bash "${AP_COMPLETIONS_DIR}/ap_completion_pdu.bash"

    cd "${AP_SOFT_DIR}/bin"
    rm -rf "${AP_TMP_DIR}/pdu"

    apinitpdu
    apcreateglobalsymlinkpdu

    if alias apcreatedirstructpdu &>/dev/null; then
        apcreatedirstructpdu
    fi
}

alias aprmpdu="ap_func_rm_pdu"
ap_func_rm_pdu() {
    aplogshow "Remove [pdu]\n"
    # cargo uninstall pdu
    rm -f "${AP_SOFT_DIR}/bin/pdu"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pdu.bash"

    if alias aprmdirstructpdu &>/dev/null; then
        aprmdirstructpdu
    fi

    if alias aprmglobalsymlinkpdu &>/dev/null; then
        aprmglobalsymlinkpdu
    fi
}
