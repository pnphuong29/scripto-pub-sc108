alias apinitfzf="ap_func_init_fzf"
ap_func_init_fzf() {
    [ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

    alias historyf='history | fzf'

    if alias apinitfzfshare &>/dev/null; then
        apinitfzfshare
    fi

    if alias apinitfzfcommon &>/dev/null; then
        apinitfzfcommon
    fi
}

alias apcreatedirstructfzf="ap_func_create_dirstruct_fzf"
ap_func_create_dirstruct_fzf() {
    if alias apcreatedirstructfzfshare &>/dev/null; then
        apcreatedirstructfzfshare
    fi

    if alias apcreatedirstructfzfcommon &>/dev/null; then
        apcreatedirstructfzfcommon
    fi
}

alias aprmdirstructfzf="ap_func_rm_dirstruct_fzf"
ap_func_rm_dirstruct_fzf() {
    if alias aprmdirstructfzfshare &>/dev/null; then
        aprmdirstructfzfshare
    fi

    if alias aprmdirstructfzfcommon &>/dev/null; then
        aprmdirstructfzfcommon
    fi
}

alias apcreateglobalsymlinkfzf="ap_func_create_global_symlink_fzf"
ap_func_create_global_symlink_fzf() {
    if [ -f "${HOME}/.fzf/bin/fzf" ]; then
        aplogshow "Create symlink from [/usr/local/bin/fzf] to [${HOME}/.fzf/bin/fzf]\n"
        sudo ln -sf "${HOME}/.fzf/bin/fzf" "/usr/local/bin/fzf"
    fi
}

alias aprmglobalsymlinkfzf="ap_func_rm_global_symlink_fzf"
ap_func_rm_global_symlink_fzf() {
    aplogshow "Remove [/usr/local/bin/fzf]\n"
    sudo rm -f "/usr/local/bin/fzf"
}

alias apsetupfzf="ap_func_setup_fzf"
ap_func_setup_fzf() {
    # https://github.com/junegunn/fzf#installation
    aplogshow "Install [fzf]\n"

    # Remove old fzf dir if any
    rm -rf "${HOME}/.fzf"

    # Install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
    "${HOME}/.fzf/install" --no-zsh --no-fish --no-key-bindings --completion --no-update-rc

    # Autocomplete and configure PATH for fzf
    [ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

    apinitfzf
    if alias apcreatedirstructfzf &>/dev/null; then
        apcreatedirstructfzf
    fi
}

alias aprmfzf="ap_func_rm_fzf"
ap_func_rm_fzf() {
    aplogshow "Remove [fzf]\n"
    rm -rf "${HOME}/.fzf"

    if alias aprmdirstructfzf &>/dev/null; then
        aprmdirstructfzf
    fi

    if alias aprmglobalsymlinkfzf &>/dev/null; then
        aprmglobalsymlinkfzf
    fi
}
