alias apiniteza="ap_func_init_eza"
ap_func_init_eza() {
    if alias apinitezashare &>/dev/null; then
        apinitezashare
    fi

    if alias apinitezacommon &>/dev/null; then
        apinitezacommon
    fi

    if alias apinitezamain &>/dev/null; then
        apinitezamain
    fi
}

alias apcreatedirstructeza="ap_func_create_dirstruct_eza"
ap_func_create_dirstruct_eza() {
    aplogshow "Generate [eza] bash autocomplete\n"
    curl -SL "https://raw.githubusercontent.com/eza-community/eza/refs/heads/main/completions/bash/eza" >"${AP_COMPLETIONS_DIR}/ap_completion_eza.bash"

    if alias apcreatedirstructezashare &>/dev/null; then
        apcreatedirstructezashare
    fi

    if alias apcreatedirstructezacommon &>/dev/null; then
        apcreatedirstructezacommon
    fi

    if alias apcreatedirstructezamain &>/dev/null; then
        apcreatedirstructezamain
    fi
}

alias aprmdirstructeza="ap_func_rm_dirstruct_eza"
ap_func_rm_dirstruct_eza() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_eza.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_eza.bash"

    if alias aprmdirstructezashare &>/dev/null; then
        aprmdirstructezashare
    fi

    if alias aprmdirstructezacommon &>/dev/null; then
        aprmdirstructezacommon
    fi

    if alias aprmdirstructezamain &>/dev/null; then
        aprmdirstructezamain
    fi
}

alias apcreateglobalsymlinkeza="ap_func_create_global_symlink_eza"
ap_func_create_global_symlink_eza() {
    if [ -f "${HOME}/.cargo/bin/eza" ]; then
        aplogshow "Create symlink from [/usr/local/bin/eza] to [${HOME}/.cargo/bin/eza]\n"
        sudo ln -sf "${HOME}/.cargo/bin/eza" "/usr/local/bin/eza"
    fi
}

alias aprmglobalsymlinkeza="ap_func_rm_global_symlink_eza"
ap_func_rm_global_symlink_eza() {
    if [ -f "/usr/local/bin/eza" ]; then
        aplogshow "Remove [/usr/local/bin/eza]\n"
        sudo rm -f "/usr/local/bin/eza"
    fi
}

alias apsetupeza="ap_func_setup_eza"
ap_func_setup_eza() {
    aplogshow "Install [eza]\n"

    cargo install eza
    apiniteza
    apcreateglobalsymlinkeza

    if alias apcreatedirstructeza &>/dev/null; then
        apcreatedirstructeza
    fi
}

alias aprmeza="ap_func_rm_eza"
ap_func_rm_eza() {
    aplogshow "Remove [eza]\n"
    cargo uninstall eza

    if alias aprmdirstructeza &>/dev/null; then
        aprmdirstructeza
    fi

    if alias aprmglobalsymlinkeza &>/dev/null; then
        aprmglobalsymlinkeza
    fi
}
