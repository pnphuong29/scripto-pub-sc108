alias apinitlazydocker="ap_func_init_lazydocker"
ap_func_init_lazydocker() {
    if alias apinitlazydockershare &>/dev/null; then
        apinitlazydockershare
    fi

    if alias apinitlazydockercommon &>/dev/null; then
        apinitlazydockercommon
    fi

    if alias apinitlazydockermain &>/dev/null; then
        apinitlazydockermain
    fi
}

alias apcreatedirstructlazydocker="ap_func_create_dirstruct_lazydocker"
ap_func_create_dirstruct_lazydocker() {
    if alias apcreatedirstructlazydockershare &>/dev/null; then
        apcreatedirstructlazydockershare
    fi

    if alias apcreatedirstructlazydockercommon &>/dev/null; then
        apcreatedirstructlazydockercommon
    fi

    if alias apcreatedirstructlazydockermain &>/dev/null; then
        apcreatedirstructlazydockermain
    fi
}

alias aprmdirstructlazydocker="ap_func_rm_dirstruct_lazydocker"
ap_func_rm_dirstruct_lazydocker() {
    if alias aprmdirstructlazydockershare &>/dev/null; then
        aprmdirstructlazydockershare
    fi

    if alias aprmdirstructlazydockercommon &>/dev/null; then
        aprmdirstructlazydockercommon
    fi

    if alias aprmdirstructlazydockermain &>/dev/null; then
        aprmdirstructlazydockermain
    fi
}

alias apcreateglobalsymlinklazydocker="ap_func_create_global_symlink_lazydocker"
ap_func_create_global_symlink_lazydocker() {
    if [ -f "${HOME}/.local/bin/lazydocker" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/lazydocker] to [${HOME}/.local/bin/lazydocker]\n"
        sudo ln -sf "${HOME}/.local/bin/lazydocker" "/usr/local/bin/lazydocker"
    fi
}

alias aprmglobalsymlinklazydocker="ap_func_rm_global_symlink_lazydocker"
ap_func_rm_global_symlink_lazydocker() {
    if [ -f "/usr/local/bin/lazydocker" ]; then
        apshowmsginfo "Remove [/usr/local/bin/lazydocker]\n"
        sudo rm -f "/usr/local/bin/lazydocker"
    fi
}

alias apsetuplazydocker="ap_func_setup_lazydocker"
ap_func_setup_lazydocker() {
    apshowmsginfo "Install [lazydocker]\n"

    go install github.com/jesseduffield/lazydocker@latest
    apinitlazydocker
    apcreateglobalsymlinklazydocker

    if alias apcreateglobalsymlinklazydocker &>/dev/null; then
        apcreatedirstructlazydocker
    fi

    if alias apcreatedirstructlazydocker &>/dev/null; then
        apcreatedirstructlazydocker
    fi
}

alias aprmlazydocker="ap_func_rm_lazydocker"
ap_func_rm_lazydocker() {
    apshowmsginfo "Remove [lazydocker]\n"
    rm -f "${HOME}/.local/bin/lazydocker"

    if alias aprmdirstructlazydocker &>/dev/null; then
        aprmdirstructlazydocker
    fi

    if alias aprmglobalsymlinklazydocker &>/dev/null; then
        aprmglobalsymlinklazydocker
    fi
}
