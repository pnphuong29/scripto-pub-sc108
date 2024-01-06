alias @initpyenv="ap_func_init_pyenv"
ap_func_init_pyenv() {
    # Defines the directory under which Python versions and shims reside.
    # pyenv root
    export PYENV_ROOT="${HOME}/.pyenv"
    export AP_PYTHON_VERSION_DEFAULT="3.10.0"

    # Sets a shell-specific Python version.
    # This version overrides application-specific versions and the global version.
    # pyenv shell
    # export PYENV_VERSION="3.10.0"

    # Outputs debug information.
    # Also as: pyenv --debug <subcommand>
    # export PYENV_DEBUG=1

    # Colon-separated list of paths searched for pyenv hooks.
    # export PYENV_HOOK_PATH=""

    # Directory to start searching for .python-version files.
    # Default to $PWD
    # export PYENV_DIR=""

    # prompt changing will be removed from future release | configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior
    # export PYENV_VIRTUALENV_DISABLE_PROMPT=1

    # Activate python
    @addpath "${PYENV_ROOT}/bin"
    # eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        source "${PYENV_ROOT}/completions/pyenv.bash"
    fi

    alias @unsetpyenvversion="unset PYENV_VERSION"

    if alias @initpyenvshare &>/dev/null; then
        @initpyenvshare
    fi

    if alias @initpyenvcommon &>/dev/null; then
        @initpyenvcommon
    fi

    if alias @initpythonshare &>/dev/null; then
        @initpythonshare
    fi

    if alias @initpythoncommon &>/dev/null; then
        @initpythoncommon
    fi

    if alias @initpipshare &>/dev/null; then
        @initpipshare
    fi

    if alias @initpipcommon &>/dev/null; then
        @initpipcommon
    fi
}

alias @createdirstructpyenv="ap_func_create_dirstruct_pyenv"
ap_func_create_dirstruct_pyenv() {
    if alias @createdirstructpyenvshare &>/dev/null; then
        @createdirstructpyenvshare
    fi

    if alias @createdirstructpyenvcommon &>/dev/null; then
        @createdirstructpyenvcommon
    fi

    if alias @createdirstructpython &>/dev/null; then
        @createdirstructpython
    fi

    if alias @createdirstructpip &>/dev/null; then
        @createdirstructpip
    fi
}

alias @rmdirstructpyenv="ap_func_rm_dirstruct_pyenv"
ap_func_rm_dirstruct_pyenv() {
    if alias @rmdirstructpyenvshare &>/dev/null; then
        @rmdirstructpyenvshare
    fi

    if alias @rmdirstructpyenvcommon &>/dev/null; then
        @rmdirstructpyenvcommon
    fi

    if alias @rmdirstructpython &>/dev/null; then
        @rmdirstructpython
    fi

    if alias @rmdirstructpip &>/dev/null; then
        @rmdirstructpip
    fi
}

alias @setuppyenv="ap_func_setup_pyenv"
ap_func_setup_pyenv() {
    # https://github.com/pyenv/pyenv
    export PYENV_ROOT="${HOME}/.pyenv"

    @logshow "Install dependent libraries before installing [pyenv]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install openssl readline sqlite3 xz zlib
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y \
            make \
            build-essential \
            wget \
            curl \
            xz-utils \
            llvm \
            libssl-dev \
            zlib1g-dev \
            libbz2-dev \
            libreadline-dev \
            libsqlite3-dev \
            libncursesw5-dev \
            tk-dev \
            libxml2-dev \
            libxmlsec1-dev \
            libffi-dev \
            liblzma-dev \
            libpq-dev
    fi

    # Install pyenv
    @logshow "Installing [pyenv]\n"
    rm -rf "${PYENV_ROOT}" # remove old pyenv dir if any
    curl https://pyenv.run | bash

    # Activate pyenv
    @addpath "${PYENV_ROOT}/bin"
    # eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    # Install Python
    @logshow "Installing [Python ${AP_PYTHON_VERSION_DEFAULT}]\n"
    pyenv install "${AP_PYTHON_VERSION_DEFAULT}"

    @logshow "Set pyenv global version [${AP_PYTHON_VERSION_DEFAULT}]\n"
    pyenv global "${AP_PYTHON_VERSION_DEFAULT}" # Set default global python

    @initpyenv
    if alias @createdirstructpyenv &>/dev/null; then
        @createdirstructpyenv
    fi
}

alias @rmpyenv="ap_func_rm_pyenv"
ap_func_rm_pyenv() {
    @logshow "Remove [pyenv]\n"
    rm -rf "$(pyenv root)"

    if alias @rmdirstructpyenv &>/dev/null; then
        @rmdirstructpyenv
    fi
}
