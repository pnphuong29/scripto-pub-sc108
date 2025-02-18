alias apinitpyenv="ap_func_init_pyenv"
ap_func_init_pyenv() {
    # Defines the directory under which Python versions and shims reside.
    # pyenv root
    export PYENV_ROOT="${HOME}/.pyenv"

    # Sets a shell-specific Python version.
    # This version overrides application-specific versions and the global version.
    # pyenv shell
    # export PYENV_VERSION="3.12.2"

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
    apaddpath "${PYENV_ROOT}/bin"
    # eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        source "${PYENV_ROOT}/completions/pyenv.bash"
    fi

    alias unsetpyenvversion="unset PYENV_VERSION"

    if alias apinitpyenvshare &>/dev/null; then
        apinitpyenvshare
    fi

    if alias apinitpyenvcommon &>/dev/null; then
        apinitpyenvcommon
    fi

    if alias apinitpythonshare &>/dev/null; then
        apinitpythonshare
    fi

    if alias apinitpythoncommon &>/dev/null; then
        apinitpythoncommon
    fi

    if alias apinitpipshare &>/dev/null; then
        apinitpipshare
    fi

    if alias apinitpipcommon &>/dev/null; then
        apinitpipcommon
    fi
}

alias apcreatedirstructpyenv="ap_func_create_dirstruct_pyenv"
ap_func_create_dirstruct_pyenv() {
    if alias apcreatedirstructpyenvshare &>/dev/null; then
        apcreatedirstructpyenvshare
    fi

    if alias apcreatedirstructpyenvcommon &>/dev/null; then
        apcreatedirstructpyenvcommon
    fi

    if alias apcreatedirstructpython &>/dev/null; then
        apcreatedirstructpython
    fi

    if alias apcreatedirstructpip &>/dev/null; then
        apcreatedirstructpip
    fi
}

alias aprmdirstructpyenv="ap_func_rm_dirstruct_pyenv"
ap_func_rm_dirstruct_pyenv() {
    if alias aprmdirstructpyenvshare &>/dev/null; then
        aprmdirstructpyenvshare
    fi

    if alias aprmdirstructpyenvcommon &>/dev/null; then
        aprmdirstructpyenvcommon
    fi

    if alias aprmdirstructpython &>/dev/null; then
        aprmdirstructpython
    fi

    if alias aprmdirstructpip &>/dev/null; then
        aprmdirstructpip
    fi
}

alias apcreateglobalsymlinkpyenv="ap_func_create_global_symlink_pyenv"
ap_func_create_global_symlink_pyenv() {
    local ap_path

    if which python | grep shims &>/dev/null; then
        ap_path="$(which python)"
        aplogshow "Create symlink from [/usr/local/bin/python] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/python"
    fi

    if which python3 | grep shims &>/dev/null; then
        ap_path="$(which python3)"
        aplogshow "Create symlink from [/usr/local/bin/python3] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/python3"
    fi

    if which pip | grep shims &>/dev/null; then
        ap_path="$(which pip)"
        aplogshow "Create symlink from [/usr/local/bin/pip] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/pip"
    fi

    if which pip3 | grep shims &>/dev/null; then
        ap_path="$(which pip3)"
        aplogshow "Create symlink from [/usr/local/bin/pip3] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/pip3"
    fi
}

alias aprmglobalsymlinkpyenv="ap_func_rm_global_symlink_pyenv"
ap_func_rm_global_symlink_pyenv() {
    aplogshow "Remove [/usr/local/bin/python]\n"
    sudo rm -f "/usr/local/bin/python"

    aplogshow "Remove [/usr/local/bin/python3]\n"
    sudo rm -f "/usr/local/bin/python3"

    aplogshow "Remove [/usr/local/bin/pip]\n"
    sudo rm -f "/usr/local/bin/pip"

    aplogshow "Remove [/usr/local/bin/pip3]\n"
    sudo rm -f "/usr/local/bin/pip3"
}

alias apsetuppyenv="ap_func_setup_pyenv"
ap_func_setup_pyenv() {
    # https://github.com/pyenv/pyenv
    export PYENV_ROOT="${HOME}/.pyenv"

    aplogshow "Install dependent libraries before installing [pyenv]\n"
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
    aplogshow "Installing [pyenv]\n"
    rm -rf "${PYENV_ROOT}" # remove old pyenv dir if any
    curl https://pyenv.run | bash

    # Activate pyenv
    apaddpath "${PYENV_ROOT}/bin"
    # eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    # Install Python
    aplogshow "Installing [Python ${AP_PYTHON_VERSION_DEFAULT}]\n"
    # pyenv install "${AP_PYTHON_VERSION_DEFAULT}"

    # Use below command to install shared library such as tkinter for tcl/tk support
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # Uncomment below command to fix openssl@1.1 issue
        # https://github.com/pyenv/pyenv/issues/2805#issuecomment-1743536437
        # brew uninstall --ignore-dependencies openssl@1.1
        env LDFLAGS="-L$(brew --prefix openssl@1.1)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix sqlite3)/lib -L$(brew --prefix xz)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix tcl-tk)/lib" \
            CPPFLAGS="-I$(brew --prefix openssl@1.1)/include -I$(brew --prefix readline)/include -I$(brew --prefix sqlite3)/include -I$(brew --prefix xz)/include -I$(brew --prefix zlib)/include -I$(brew --prefix tcl-tk)/include" \
            PKG_CONFIG_PATH="$(brew --prefix openssl@1.1)/lib/pkgconfig:$(brew --prefix readline)/lib/pkgconfig:$(brew --prefix sqlite3)/lib/pkgconfig:$(brew --prefix xz)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig:$(brew --prefix tcl-tk)/lib/pkgconfig" \
            CONFIGURE_OPTS='--enable-optimizations' \
            pyenv install "${AP_PYTHON_VERSION_DEFAULT}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install "${AP_PYTHON_VERSION_DEFAULT}"
    fi

    aplogshow "Set pyenv global version [${AP_PYTHON_VERSION_DEFAULT}]\n"
    pyenv global "${AP_PYTHON_VERSION_DEFAULT}" # Set default global python
    # pyenv local "${AP_PYTHON_VERSION_DEFAULT}"  # Create and set .python-version file

    apinitpyenv
    apcreatedirstructpip

    if alias apcreatedirstructpyenv &>/dev/null; then
        apcreatedirstructpyenv
    fi
}

alias aprmpyenv="ap_func_rm_pyenv"
ap_func_rm_pyenv() {
    aplogshow "Remove [pyenv]\n"
    rm -rf "$(pyenv root)"

    if alias aprmdirstructpyenv &>/dev/null; then
        aprmdirstructpyenv
    fi

    if alias aprmglobalsymlinkpyenv &>/dev/null; then
        aprmglobalsymlinkpyenv
    fi
}
