alias @initpython="ap_func_init_python"
ap_func_init_python() {
    if [ -f "${HOME}/scripto-common/vendors/python/ap_python_startup.py" ]; then
        export PYTHONSTARTUP="${HOME}/scripto-common/vendors/python/ap_python_startup.py"
    fi

    alias pipupgrade="pip install --upgrade pip"
    alias pipirequirementsdev="pip install --upgrade pip -r requirements_dev.txt"
    alias pipirequirements="pip install --upgrade pip -r requirements.txt"
    alias @venv="python -m venv"
    alias @venvactivate="source \$(find -type f -name activate | head -1)"

    if alias @initpythonshare &>/dev/null; then
        @initpythonshare
    fi

    if alias @initpythoncommon &>/dev/null; then
        @initpythoncommon
    fi
}

alias @createdirstructpython="ap_func_create_dirstruct_python"
ap_func_create_dirstruct_python() {
    if alias @createdirstructpythonshare &>/dev/null; then
        @createdirstructpythonshare
    fi

    if alias @createdirstructpythoncommon &>/dev/null; then
        @createdirstructpythoncommon
    fi
}

alias @rmdirstructpython="ap_func_rm_dirstruct_python"
ap_func_rm_dirstruct_python() {
    if alias @rmdirstructpythonshare &>/dev/null; then
        @rmdirstructpythonshare
    fi

    if alias @rmdirstructpythoncommon &>/dev/null; then
        @rmdirstructpythoncommon
    fi
}
