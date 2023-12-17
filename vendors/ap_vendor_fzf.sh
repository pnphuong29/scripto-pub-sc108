alias @initfzf="ap_func_init_fzf"
ap_func_init_fzf() {
    [ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"
    if alias @initfzfcommon &>/dev/null; then
        @initfzfcommon
    fi
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
}

alias @rmfzf="ap_func_remove_fzf"
ap_func_remove_fzf() {
    @logshow "Remove [fzf]\n"
    rm -rf "${HOME}/.fzf"

    # Unbind keys
    bind -r "\C-b" # Chrome bookmarks
    bind -r "\C-h" # Chrome history
}
