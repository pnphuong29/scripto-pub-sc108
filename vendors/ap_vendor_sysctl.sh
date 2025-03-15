alias apinitsysctl="ap_func_init_sysctl"
ap_func_init_sysctl() {
    if alias apinitsysctlshare &>/dev/null; then
        apinitsysctlshare
    fi

    if alias apinitsysctlcommon &>/dev/null; then
        apinitsysctlcommon
    fi

    if alias apinitsysctlmain &>/dev/null; then
        apinitsysctlmain
    fi
}

alias apcreatedirstructsysctl="ap_func_create_dirstruct_sysctl"
ap_func_create_dirstruct_sysctl() {
    if alias apcreatedirstructsysctlshare &>/dev/null; then
        apcreatedirstructsysctlshare
    fi

    if alias apcreatedirstructsysctlcommon &>/dev/null; then
        apcreatedirstructsysctlcommon
    fi

    if alias apcreatedirstructsysctlmain &>/dev/null; then
        apcreatedirstructsysctlmain
    fi
}

alias aprmdirstructsysctl="ap_func_rm_dirstruct_sysctl"
ap_func_rm_dirstruct_sysctl() {
    if alias aprmdirstructsysctlshare &>/dev/null; then
        aprmdirstructsysctlshare
    fi

    if alias aprmdirstructsysctlcommon &>/dev/null; then
        aprmdirstructsysctlcommon
    fi

    if alias aprmdirstructsysctlmain &>/dev/null; then
        aprmdirstructsysctlmain
    fi
}
