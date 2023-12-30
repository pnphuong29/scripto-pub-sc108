alias @initpython="ap_func_init_python"
ap_func_init_python() {
    # https://docs.python.org/3/using/cmdline.html
    if [ -d "${AP_PRJ_LIB1_DIR}" ]; then
        export PYTHONPATH="${PYTHONPATH}:${AP_PRJ_LIB1_DIR}/python"
    fi

    if [ -f "${HOME}/scripto-common/vendors/python/ap_python_startup.py" ]; then
        export PYTHONSTARTUP="${HOME}/scripto-common/vendors/python/ap_python_startup.py"
    fi

    alias pipupgrade="pip install --upgrade pip"
    alias pipirequirementsdev="pip install --upgrade pip -r requirements_dev.txt"
    alias pipirequirements="pip install --upgrade pip -r requirements.txt"
    alias @venv="python -m venv"
    alias @venvactivate="source \$(find -type f -name activate | head -1)"

    if alias @initpythoncommon &>/dev/null; then
        @initpythoncommon
    fi
}

alias @createdirstructpython="ap_func_create_dirstruct_python"
ap_func_create_dirstruct_python() {
    local ap_python_history_dir
    ap_python_history_dir="${HOME}/scripto-main/data/python/$(hostname)"
    if [ ! -d "${ap_python_history_dir}" ]; then
        @logshow "Create directory ${ap_python_history_dir}\n"
        mkdir -p "${ap_python_history_dir}"
    fi

    if [ -f "${HOME}/.python_history" ]; then
        @logshow "Link [${ap_python_history_dir}/.python_history] to [${HOME}/.python_history]\n"
        ln -sf "${HOME}/.python_history" "${ap_python_history_dir}/.python_history"
    fi

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
