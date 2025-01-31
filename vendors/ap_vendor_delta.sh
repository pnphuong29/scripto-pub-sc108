alias apinitdelta="ap_func_init_delta"
ap_func_init_delta() {
    if alias apinitdeltashare &>/dev/null; then
        apinitdeltashare
    fi

    if alias apinitdeltacommon &>/dev/null; then
        apinitdeltacommon
    fi

    if alias apinitdeltamain &>/dev/null; then
        apinitdeltamain
    fi
}

alias apcreatedirstructdelta="ap_func_create_dirstruct_delta"
ap_func_create_dirstruct_delta() {
    aplogshow "Generate [delta] bash autocomplete\n"
    delta --generate-completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_delta.bash"

    if alias apcreatedirstructdeltashare &>/dev/null; then
        apcreatedirstructdeltashare
    fi

    if alias apcreatedirstructdeltacommon &>/dev/null; then
        apcreatedirstructdeltacommon
    fi

    if alias apcreatedirstructdeltamain &>/dev/null; then
        apcreatedirstructdeltamain
    fi
}

alias aprmdirstructdelta="ap_func_rm_dirstruct_delta"
ap_func_rm_dirstruct_delta() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_delta.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_delta.bash"

    if alias aprmdirstructdeltashare &>/dev/null; then
        aprmdirstructdeltashare
    fi

    if alias aprmdirstructdeltacommon &>/dev/null; then
        aprmdirstructdeltacommon
    fi

    if alias aprmdirstructdeltamain &>/dev/null; then
        aprmdirstructdeltamain
    fi
}

alias apcreateglobalsymlinkdelta="ap_func_create_global_symlink_delta"
ap_func_create_global_symlink_delta() {
    if [ -f "${HOME}/.cargo/bin/delta" ]; then
        aplogshow "Create symlink from [/usr/local/bin/delta] to [${HOME}/.cargo/bin/delta]\n"
        sudo ln -sf "${HOME}/.cargo/bin/delta" "/usr/local/bin/delta"
    fi
}

alias aprmglobalsymlinkdelta="ap_func_rm_global_symlink_delta"
ap_func_rm_global_symlink_delta() {
    if [ -f "/usr/local/bin/delta" ]; then
        aplogshow "Remove [/usr/local/bin/delta]\n"
        sudo rm -f "/usr/local/bin/delta"
    fi
}

alias apsetupdelta="ap_func_setup_delta"
ap_func_setup_delta() {
    aplogshow "Install [delta]\n"

    cargo install delta
    apinitdelta

    if alias apcreatedirstructdelta &>/dev/null; then
        apcreatedirstructdelta
    fi
}

alias aprmdelta="ap_func_rm_delta"
ap_func_rm_delta() {
    aplogshow "Remove [delta]\n"
    cargo uninstall delta

    if alias aprmdirstructdelta &>/dev/null; then
        aprmdirstructdelta
    fi

    if alias aprmglobalsymlinkdelta &>/dev/null; then
        aprmglobalsymlinkdelta
    fi
}
