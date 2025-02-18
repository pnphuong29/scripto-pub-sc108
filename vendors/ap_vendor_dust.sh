alias apinitdust="ap_func_init_dust"
ap_func_init_dust() {
    alias dustmib="dust -o mib"
    alias dustgib="dust -o gib"
    alias dust1="dust -d 1"
    alias dustregex="dust -e regex"
    alias dustexcluderegex="dust -v regex"
    alias dustfiltermin="dust -z"
    alias dustgroupbytype="dust -t"

    if alias apinitdustshare &>/dev/null; then
        apinitdustshare
    fi

    if alias apinitdustcommon &>/dev/null; then
        apinitdustcommon
    fi

    if alias apinitdustmain &>/dev/null; then
        apinitdustmain
    fi
}

alias apcreatedirstructdust="ap_func_create_dirstruct_dust"
ap_func_create_dirstruct_dust() {
    if [ -f "${HOME}/scripto-share/vendors/dust/config.toml" ]; then
        aplogshow "Create symlink from [${HOME}/.config/dust/config.toml] to [${HOME}/scripto-share/vendors/dust/config.toml]\n"
        mkdir -p ~/.config/dust
        ln -sf "${HOME}/scripto-share/vendors/dust/config.toml" "${HOME}/.config/dust/config.toml"
    fi

    if alias apcreatedirstructdustshare &>/dev/null; then
        apcreatedirstructdustshare
    fi

    if alias apcreatedirstructdustcommon &>/dev/null; then
        apcreatedirstructdustcommon
    fi

    if alias apcreatedirstructdustmain &>/dev/null; then
        apcreatedirstructdustmain
    fi
}

alias aprmdirstructdust="ap_func_rm_dirstruct_dust"
ap_func_rm_dirstruct_dust() {
    aplogshow "Remove [~/.config/dust]\n"
    rm -rf ~/.config/dust

    if alias aprmdirstructdustshare &>/dev/null; then
        aprmdirstructdustshare
    fi

    if alias aprmdirstructdustcommon &>/dev/null; then
        aprmdirstructdustcommon
    fi

    if alias aprmdirstructdustmain &>/dev/null; then
        aprmdirstructdustmain
    fi
}

alias apcreateglobalsymlinkdust="ap_func_create_global_symlink_dust"
ap_func_create_global_symlink_dust() {
    if [ -f "${HOME}/.cargo/bin/dust" ]; then
        aplogshow "Create symlink from [/usr/local/bin/dust] to [${HOME}/.cargo/bin/dust]\n"
        sudo ln -sf "${HOME}/.cargo/bin/dust" "/usr/local/bin/dust"
    fi
}

alias aprmglobalsymlinkdust="ap_func_rm_global_symlink_dust"
ap_func_rm_global_symlink_dust() {
    if [ -f "/usr/local/bin/dust" ]; then
        aplogshow "Remove [/usr/local/bin/dust]\n"
        sudo rm -f "/usr/local/bin/dust"
    fi
}

alias apsetupdust="ap_func_setup_dust"
ap_func_setup_dust() {
    aplogshow "Install [dust]\n"

    cargo install du-dust

    apinitdust
    if alias apcreatedirstructdust &>/dev/null; then
        apcreatedirstructdust
    fi
}

alias aprmdust="ap_func_rm_dust"
ap_func_rm_dust() {
    aplogshow "Remove [dust]\n"
    cargo uninstall dust

    if alias aprmdirstructdust &>/dev/null; then
        aprmdirstructdust
    fi

    if alias aprmglobalsymlinkdust &>/dev/null; then
        aprmglobalsymlinkdust
    fi
}
