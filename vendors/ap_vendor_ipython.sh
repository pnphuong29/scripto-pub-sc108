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

alias rmdirstructipython="ap_func_rm_dirstruct_ipython"
ap_func_rm_dirstruct_ipython() {
    if alias rmdirstructipythonshare &>/dev/null; then
        rmdirstructipythonshare
    fi

    if alias rmdirstructipythoncommon &>/dev/null; then
        rmdirstructipythoncommon
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

alias rmipython="ap_func_rm_ipython"
ap_func_rm_ipython() {
    aplogshow "Remove [ipython]\n"
    pip uninstall ipython

    if alias rmdirstructipython &>/dev/null; then
        rmdirstructipython
    fi

    if alias rmglobalsymlinkipython &>/dev/null; then
        rmglobalsymlinkipython
    fi
}
