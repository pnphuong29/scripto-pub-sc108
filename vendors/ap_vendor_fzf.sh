alias @initfzf="ap_func_init_fzf"
ap_func_init_fzf() {
    [ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

    if alias @initfzfshare &>/dev/null; then
        @initfzfshare
    fi

    if alias @initfzfcommon &>/dev/null; then
        @initfzfcommon
    fi
}

alias @createdirstructfzf="ap_func_create_dirstruct_fzf"
ap_func_create_dirstruct_fzf() {
    if alias @createdirstructfzfshare &>/dev/null; then
        @createdirstructfzfshare
    fi

    if alias @createdirstructfzfcommon &>/dev/null; then
        @createdirstructfzfcommon
    fi
}

alias @rmdirstructfzf="ap_func_remove_dirstruct_fzf"
ap_func_remove_dirstruct_fzf() {
    if alias @rmdirstructfzfshare &>/dev/null; then
        @rmdirstructfzfshare
    fi

    if alias @rmdirstructfzfcommon &>/dev/null; then
        @rmdirstructfzfcommon
    fi
}

alias @createglobalsymlinkfzf="ap_func_create_global_symlink_fzf"
ap_func_create_global_symlink_fzf() {
    if [ -f "${HOME}/.fzf/bin/fzf" ]; then
        @logshow "Create symlink from [/usr/local/bin/fzf] to [${HOME}/.fzf/bin/fzf]\n"
        sudo ln -sf "${HOME}/.fzf/bin/fzf" "/usr/local/bin/fzf"
    fi
}

alias @rmglobalsymlinkfzf="ap_func_remove_global_symlink_fzf"
ap_func_remove_global_symlink_fzf() {
    @logshow "Remove [/usr/local/bin/fzf]\n"
    sudo rm -f "/usr/local/bin/fzf"
}

alias @setupfzf="ap_func_setup_fzf"
ap_func_setup_fzf() {
    # https://github.com/junegunn/fzf#installation
    @logshow "Install [fzf]\n"

    # Remove old fzf dir if any
    rm -rf "${HOME}/.fzf"

    # Install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
    "${HOME}/.fzf/install" --no-zsh --no-fish --no-key-bindings --completion --no-update-rc

    # Autocomplete and configure PATH for fzf
    [ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

    @initfzf
    if alias @createdirstructfzf &>/dev/null; then
        @createdirstructfzf
    fi
}

alias @rmfzf="ap_func_remove_fzf"
ap_func_remove_fzf() {
    @logshow "Remove [fzf]\n"
    rm -rf "${HOME}/.fzf"

    if alias @rmdirstructfzf &>/dev/null; then
        @rmdirstructfzf
    fi

    if alias @rmglobalsymlinkfzf &>/dev/null; then
        @rmglobalsymlinkfzf
    fi
}
