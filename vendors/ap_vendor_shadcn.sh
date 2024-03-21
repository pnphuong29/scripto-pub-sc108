alias apinitshadcn="ap_func_init_shadcn"
ap_func_init_shadcn() {
    if alias apinitshadcnshare &>/dev/null; then
        apinitshadcnshare
    fi

    if alias apinitshadcncommon &>/dev/null; then
        apinitshadcncommon
    fi

    if alias apinitshadcnmain &>/dev/null; then
        apinitshadcnmain
    fi
}

alias apcreatedirstructshadcn="ap_func_create_dirstruct_shadcn"
ap_func_create_dirstruct_shadcn() {
    if alias apcreatedirstructshadcnshare &>/dev/null; then
        apcreatedirstructshadcnshare
    fi

    if alias apcreatedirstructshadcncommon &>/dev/null; then
        apcreatedirstructshadcncommon
    fi

    if alias apcreatedirstructshadcnmain &>/dev/null; then
        apcreatedirstructshadcnmain
    fi
}

alias aprmdirstructshadcn="ap_func_rm_dirstruct_shadcn"
ap_func_rm_dirstruct_shadcn() {
    if alias aprmdirstructshadcnshare &>/dev/null; then
        aprmdirstructshadcnshare
    fi

    if alias aprmdirstructshadcncommon &>/dev/null; then
        aprmdirstructshadcncommon
    fi

    if alias aprmdirstructshadcnmain &>/dev/null; then
        aprmdirstructshadcnmain
    fi
}

alias apsetupshadcn="ap_func_setup_shadcn"
ap_func_setup_shadcn() {
    aplogshow "Install [shadcn]\n"
    # npm install -g shadcn

    apinitshadcn
    if alias apcreatedirstructshadcn &>/dev/null; then
        apcreatedirstructshadcn
    fi
}

alias aprmshadcn="ap_func_rm_shadcn"
ap_func_rm_shadcn() {
    aplogshow "Remove [shadcn]\n"
    # npm uninstall -g shadcn

    if alias aprmdirstructshadcn &>/dev/null; then
        aprmdirstructshadcn
    fi

    if alias aprmglobalsymlinkshadcn &>/dev/null; then
        aprmglobalsymlinkshadcn
    fi
}
