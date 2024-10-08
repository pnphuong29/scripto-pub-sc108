alias apinitpython="ap_func_init_python"
ap_func_init_python() {
    if [ -f "${HOME}/scripto-common/vendors/python/ap_python_startup.py" ]; then
        export PYTHONSTARTUP="${HOME}/scripto-common/vendors/python/ap_python_startup.py"
    fi

    alias pipupgrade="pip install --upgrade pip"
    alias pipirequirementsdev="pip install --upgrade pip -r requirements_dev.txt"
    alias pipirequirements="pip install --upgrade pip -r requirements.txt"
    alias venv="python -m venv"
    alias venvactivate="source \$(find -type f -name activate | head -1)"

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
