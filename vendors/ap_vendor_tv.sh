alias apinittv="ap_func_init_tv"
ap_func_init_tv() {
    export AP_TV_CONF_DIR="${HOME}/.config/television"
    alias ztvconf="cd \${AP_TV_CONF_DIR}"

    if alias apinittvshare &>/dev/null; then
        apinittvshare
    fi

    if alias apinittvcommon &>/dev/null; then
        apinittvcommon
    fi

    if alias apinittvmain &>/dev/null; then
        apinittvmain
    fi
}

alias apcreatedirstructtv="ap_func_create_dirstruct_tv"
ap_func_create_dirstruct_tv() {
    # https://github.com/alexpasmantier/television/wiki/Shell-Autocompletion
    apshowmsginfo "Generate [tv] bash autocomplete\n"
    tv init bash >"${AP_COMPLETIONS_DIR}/ap_completion_tv.bash"

    if alias apcreatedirstructtvshare &>/dev/null; then
        apcreatedirstructtvshare
    fi

    if alias apcreatedirstructtvcommon &>/dev/null; then
        apcreatedirstructtvcommon
    fi

    if alias apcreatedirstructtvmain &>/dev/null; then
        apcreatedirstructtvmain
    fi
}

alias aprmdirstructtv="ap_func_rm_dirstruct_tv"
ap_func_rm_dirstruct_tv() {
    if alias aprmdirstructtvshare &>/dev/null; then
        aprmdirstructtvshare
    fi

    if alias aprmdirstructtvcommon &>/dev/null; then
        aprmdirstructtvcommon
    fi

    if alias aprmdirstructtvmain &>/dev/null; then
        aprmdirstructtvmain
    fi
}

alias apcreateglobalsymlinktv="ap_func_create_global_symlink_tv"
ap_func_create_global_symlink_tv() {
    if [ -f "${HOME}/.cargo/bin/tv" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/tv] to [${HOME}/.cargo/bin/tv]\n"
        sudo ln -sf "${HOME}/.cargo/bin/tv" "/usr/local/bin/tv"
    fi
}

alias aprmglobalsymlinktv="ap_func_rm_global_symlink_tv"
ap_func_rm_global_symlink_tv() {
    if [ -f "/usr/local/bin/tv" ]; then
        apshowmsginfo "Remove [/usr/local/bin/tv]\n"
        sudo rm -f "/usr/local/bin/tv"
    fi
}

alias apsetuptv="ap_func_setup_tv"
ap_func_setup_tv() {
    apshowmsginfo "Install [tv]\n"

    cargo install --locked television
    apinittv
    apcreateglobalsymlinktv

    if alias apcreatedirstructtv &>/dev/null; then
        apcreatedirstructtv
    fi
}

alias aprmtv="ap_func_rm_tv"
ap_func_rm_tv() {
    apshowmsginfo "Remove [tv]\n"

    cargo uninstall tv

    if alias aprmdirstructtv &>/dev/null; then
        aprmdirstructtv
    fi

    if alias aprmglobalsymlinktv &>/dev/null; then
        aprmglobalsymlinktv
    fi
}
