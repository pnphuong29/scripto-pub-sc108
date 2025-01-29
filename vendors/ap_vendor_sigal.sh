alias apinitsigal="ap_func_init_sigal"
ap_func_init_sigal() {
    alias initsigalconfig="cp \${HOME}/scripto-common/vendors/sigal/sigal.conf.py ./"

    alias sigalinit="sigal init"
    alias sigalserve="sigal serve"
    alias sigalbuild="sigal build"

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

alias apsetupsigal="ap_func_setup_sigal"
ap_func_setup_sigal() {
    aplogshow "Install [sigal]\n"

    pip install sigal
    apinitsigal

    if alias apcreatedirstructsigal &>/dev/null; then
        apcreatedirstructsigal
    fi
}

alias aprmsigal="ap_func_rm_sigal"
ap_func_rm_sigal() {
    aplogshow "Remove [sigal]\n"
    pip uninstall sigal

    if alias aprmdirstructsigal &>/dev/null; then
        aprmdirstructsigal
    fi

    if alias aprmglobalsymlinksigal &>/dev/null; then
        aprmglobalsymlinksigal
    fi
}
