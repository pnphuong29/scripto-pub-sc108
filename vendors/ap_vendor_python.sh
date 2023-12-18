alias @initpython="ap_func_init_python"
ap_func_init_python() {
    if alias @initpythoncommon &>/dev/null; then
        @initpythoncommon
    fi
}

alias @createdirstructpython="ap_func_create_dirstruct_python"
ap_func_create_dirstruct_python() {
    if alias @createdirstructpythoncommon &>/dev/null; then
        @createdirstructpythoncommon
    fi
}

alias @rmdirstructpython="ap_func_remove_dirstruct_python"
ap_func_remove_dirstruct_python() {
    if alias @rmdirstructpythoncommon &>/dev/null; then
        @rmdirstructpythoncommon
    fi
}
