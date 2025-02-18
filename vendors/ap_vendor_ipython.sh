alias apinitipython="ap_func_init_ipython"
ap_func_init_ipython() {
    if alias apinitipythonshare &>/dev/null; then
        apinitipythonshare
    fi

    if alias apinitipythoncommon &>/dev/null; then
        apinitipythoncommon
    fi
}

alias apcreatedirstructipython="ap_func_create_dirstruct_ipython"
ap_func_create_dirstruct_ipython() {
    if alias apcreatedirstructipythonshare &>/dev/null; then
        apcreatedirstructipythonshare
    fi

    if alias apcreatedirstructipythoncommon &>/dev/null; then
        apcreatedirstructipythoncommon
    fi
}

alias aprmdirstructipython="ap_func_rm_dirstruct_ipython"
ap_func_rm_dirstruct_ipython() {
    if alias aprmdirstructipythonshare &>/dev/null; then
        aprmdirstructipythonshare
    fi

    if alias aprmdirstructipythoncommon &>/dev/null; then
        aprmdirstructipythoncommon
    fi
}

alias apsetupipython="ap_func_setup_ipython"
ap_func_setup_ipython() {
    aplogshow "Install [ipython]\n"
    pip install ipython

    apinitipython
    if alias apcreatedirstructipython &>/dev/null; then
        apcreatedirstructipython
    fi
}

alias aprmipython="ap_func_rm_ipython"
ap_func_rm_ipython() {
    aplogshow "Remove [ipython]\n"
    pip uninstall ipython

    if alias aprmdirstructipython &>/dev/null; then
        aprmdirstructipython
    fi

    if alias aprmglobalsymlinkipython &>/dev/null; then
        aprmglobalsymlinkipython
    fi
}
