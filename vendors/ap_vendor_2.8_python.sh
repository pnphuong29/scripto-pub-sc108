alias apinitpython="ap_func_init_python"
ap_func_init_python() {
    export AP_PYTHON_VERSION_DEFAULT="3.13.1"

    if alias apinitpythonshare &>/dev/null; then
        apinitpythonshare
    fi

    if alias apinitpythoncommon &>/dev/null; then
        apinitpythoncommon
    fi
}

alias apcreatedirstructpython="ap_func_create_dirstruct_python"
ap_func_create_dirstruct_python() {
    if alias apcreatedirstructpythonshare &>/dev/null; then
        apcreatedirstructpythonshare
    fi

    if alias apcreatedirstructpythoncommon &>/dev/null; then
        apcreatedirstructpythoncommon
    fi
}

alias aprmdirstructpython="ap_func_rm_dirstruct_python"
ap_func_rm_dirstruct_python() {
    if alias aprmdirstructpythonshare &>/dev/null; then
        aprmdirstructpythonshare
    fi

    if alias aprmdirstructpythoncommon &>/dev/null; then
        aprmdirstructpythoncommon
    fi
}
