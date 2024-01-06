alias @initipython="ap_func_init_ipython"
ap_func_init_ipython() {
    if alias @initipythonshare &>/dev/null; then
        @initipythonshare
    fi

    if alias @initipythoncommon &>/dev/null; then
        @initipythoncommon
    fi
}

alias @createdirstructipython="ap_func_create_dirstruct_ipython"
ap_func_create_dirstruct_ipython() {
    if alias @createdirstructipythonshare &>/dev/null; then
        @createdirstructipythonshare
    fi

    if alias @createdirstructipythoncommon &>/dev/null; then
        @createdirstructipythoncommon
    fi
}

alias @rmdirstructipython="ap_func_rm_dirstruct_ipython"
ap_func_rm_dirstruct_ipython() {
    if alias @rmdirstructipythonshare &>/dev/null; then
        @rmdirstructipythonshare
    fi

    if alias @rmdirstructipythoncommon &>/dev/null; then
        @rmdirstructipythoncommon
    fi
}

alias @setupipython="ap_func_setup_ipython"
ap_func_setup_ipython() {
    @logshow "Install [ipython]\n"
    pip install ipython

    @initipython
    if alias @createdirstructipython &>/dev/null; then
        @createdirstructipython
    fi
}

alias @rmipython="ap_func_rm_ipython"
ap_func_rm_ipython() {
    @logshow "Remove [ipython]\n"
    pip uninstall ipython

    if alias @rmdirstructipython &>/dev/null; then
        @rmdirstructipython
    fi

    if alias @rmglobalsymlinkipython &>/dev/null; then
        @rmglobalsymlinkipython
    fi
}
