alias apinitpik="ap_func_init_pik"
ap_func_init_pik() {
    alias pikall='pik -a -t -F'

    if alias apinitpikshare &>/dev/null; then
        apinitpikshare
    fi

    if alias apinitpikcommon &>/dev/null; then
        apinitpikcommon
    fi

    if alias apinitpikmain &>/dev/null; then
        apinitpikmain
    fi
}

alias apcreatedirstructpik="ap_func_create_dirstruct_pik"
ap_func_create_dirstruct_pik() {
    # Just need a global pik command to access all processes
    apshowmsginfo "Copy [pik] to [/usr/local/bin/]\n"
    sudo cp -f "${HOME}/.cargo/bin/pik" "/usr/local/bin/"
    cargo uninstall pik

    if alias apcreatedirstructpikshare &>/dev/null; then
        apcreatedirstructpikshare
    fi

    if alias apcreatedirstructpikcommon &>/dev/null; then
        apcreatedirstructpikcommon
    fi

    if alias apcreatedirstructpikmain &>/dev/null; then
        apcreatedirstructpikmain
    fi
}

alias aprmdirstructpik="ap_func_rm_dirstruct_pik"
ap_func_rm_dirstruct_pik() {
    if alias aprmdirstructpikshare &>/dev/null; then
        aprmdirstructpikshare
    fi

    if alias aprmdirstructpikcommon &>/dev/null; then
        aprmdirstructpikcommon
    fi

    if alias aprmdirstructpikmain &>/dev/null; then
        aprmdirstructpikmain
    fi
}

alias apcreateglobalsymlinkpik="ap_func_create_global_symlink_pik"
ap_func_create_global_symlink_pik() {
    if [ -f "${HOME}/.cargo/bin/pik" ]; then
        aplogshow "Create symlink from [/usr/local/bin/pik] to [${HOME}/.cargo/bin/pik]\n"
        sudo ln -sf "${HOME}/.cargo/bin/pik" "/usr/local/bin/pik"
    fi
}

alias aprmglobalsymlinkpik="ap_func_rm_global_symlink_pik"
ap_func_rm_global_symlink_pik() {
    if [ -f "/usr/local/bin/pik" ]; then
        aplogshow "Remove [/usr/local/bin/pik]\n"
        sudo rm -f "/usr/local/bin/pik"
    fi
}

alias apsetuppik="ap_func_setup_pik"
ap_func_setup_pik() {
    aplogshow "Setup [pik]\n"

    cargo install pik
    apinitpik
    # apcreateglobalsymlinkpik

    if alias apcreatedirstructpik &>/dev/null; then
        apcreatedirstructpik
    fi
}

alias aprmpik="ap_func_rm_pik"
ap_func_rm_pik() {
    aplogshow "Remove [pik]\n"
    cargo uninstall pik

    if alias aprmdirstructpik &>/dev/null; then
        aprmdirstructpik
    fi

    if alias aprmglobalsymlinkpik &>/dev/null; then
        aprmglobalsymlinkpik
    fi
}
