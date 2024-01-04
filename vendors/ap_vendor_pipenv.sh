alias @initpipenv="ap_func_init_pipenv"
ap_func_init_pipenv() {
    export PIPENV_VENV_IN_PROJECT=1

    alias pipenvi="pipenv install"
    alias pipenvidev="pipenv install --dev"
    alias pipenvrequirements="pipenv requirements > requirements.txt"
    alias pipenvrequirementsdev="pipenv requirements --dev > requirements_dev.txt"
    alias pipenvverify="pipenv verify" # Check if Pipfile.lock is out-of-date?
    alias pipenvlock="pipenv lock"     # Generate Pipfile.lock
    alias pipenvrun="pipenv run"
    alias pipenvpip="pipenv run pip"

    if alias @initpipenvshare &>/dev/null; then
        @initpipenvshare
    fi

    if alias @initpipenvcommon &>/dev/null; then
        @initpipenvcommon
    fi
}

alias @createdirstructpipenv="ap_func_create_dirstruct_pipenv"
ap_func_create_dirstruct_pipenv() {
    if alias @createdirstructpipenvshare &>/dev/null; then
        @createdirstructpipenvshare
    fi

    if alias @createdirstructpipenvcommon &>/dev/null; then
        @createdirstructpipenvcommon
    fi
}

alias @rmdirstructpipenv="ap_func_rm_dirstruct_pipenv"
ap_func_rm_dirstruct_pipenv() {
    if alias @rmdirstructpipenvshare &>/dev/null; then
        @rmdirstructpipenvshare
    fi

    if alias @rmdirstructpipenvcommon &>/dev/null; then
        @rmdirstructpipenvcommon
    fi
}

alias @setuppipenv="ap_func_setup_pipenv"
ap_func_setup_pipenv() {
    @logshow "Install [pipenv]\n"
    pip install pipenv

    @initpipenv
    if alias @createdirstructpipenv &>/dev/null; then
        @createdirstructpipenv
    fi
}

alias @rmpipenv="ap_func_rm_pipenv"
ap_func_rm_pipenv() {
    @logshow "Remove [pipenv]\n"
    pip uninstall pipenv

    if alias @rmdirstructpipenv &>/dev/null; then
        @rmdirstructpipenv
    fi

    if alias @rmglobalsymlinkpipenv &>/dev/null; then
        @rmglobalsymlinkpipenv
    fi
}
