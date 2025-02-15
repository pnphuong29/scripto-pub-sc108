# https://sigal.saimon.org/en/latest/installation.html
alias apinitsigal="ap_func_init_sigal"
ap_func_init_sigal() {
    if alias apinitsigalshare &>/dev/null; then
        apinitsigalshare
    fi

    if alias apinitsigalcommon &>/dev/null; then
        apinitsigalcommon
    fi

    if alias apinitsigalmain &>/dev/null; then
        apinitsigalmain
    fi
}

alias apcreatedirstructsigal="ap_func_create_dirstruct_sigal"
ap_func_create_dirstruct_sigal() {
    if alias apcreatedirstructsigalshare &>/dev/null; then
        apcreatedirstructsigalshare
    fi

    if alias apcreatedirstructsigalcommon &>/dev/null; then
        apcreatedirstructsigalcommon
    fi

    if alias apcreatedirstructsigalmain &>/dev/null; then
        apcreatedirstructsigalmain
    fi
}

alias aprmdirstructsigal="ap_func_rm_dirstruct_sigal"
ap_func_rm_dirstruct_sigal() {
    if alias aprmdirstructsigalshare &>/dev/null; then
        aprmdirstructsigalshare
    fi

    if alias aprmdirstructsigalcommon &>/dev/null; then
        aprmdirstructsigalcommon
    fi

    if alias aprmdirstructsigalmain &>/dev/null; then
        aprmdirstructsigalmain
    fi
}

alias apcreateglobalsymlinksigal="ap_func_create_global_symlink_sigal"
ap_func_create_global_symlink_sigal() {
    if [ -f "${HOME}/.local/bin/sigal" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/sigal] to [${HOME}/.local/bin/sigal]\n"
        sudo ln -sf "${HOME}/.local/bin/sigal" "/usr/local/bin/sigal"
    fi
}

alias aprmglobalsymlinksigal="ap_func_rm_global_symlink_sigal"
ap_func_rm_global_symlink_sigal() {
    if [ -f "/usr/local/bin/sigal" ]; then
        apshowmsginfo "Remove [/usr/local/bin/sigal]\n"
        sudo rm -f "/usr/local/bin/sigal"
    fi
}

alias apsetupsigal="ap_func_setup_sigal"
ap_func_setup_sigal() {
    aplogshow "Install [sigal]\n"

    # pip install sigal
    # pip install "sigal[all]" # install with optional dependencies
    uv tool install "sigal[all]" # install with optional dependencies
    apinitsigal
    apcreateglobalsymlinksigal

    if alias apcreatedirstructsigal &>/dev/null; then
        apcreatedirstructsigal
    fi
}

alias aprmsigal="ap_func_rm_sigal"
ap_func_rm_sigal() {
    aplogshow "Remove [sigal]\n"
    # pip uninstall sigal
    # pip uninstall "sigal[all]"
    uv tool uninstall "sigal[all]"

    if alias aprmdirstructsigal &>/dev/null; then
        aprmdirstructsigal
    fi

    if alias aprmglobalsymlinksigal &>/dev/null; then
        aprmglobalsymlinksigal
    fi
}
