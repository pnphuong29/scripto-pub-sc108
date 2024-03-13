alias apinitpipenv="ap_func_init_pipenv"
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

    if alias apinitpipenvshare &>/dev/null; then
        apinitpipenvshare
    fi

    if alias apinitpipenvcommon &>/dev/null; then
        apinitpipenvcommon
    fi
}

alias apcreatedirstructpipenv="ap_func_create_dirstruct_pipenv"
ap_func_create_dirstruct_pipenv() {
    if alias apcreatedirstructpipenvshare &>/dev/null; then
        apcreatedirstructpipenvshare
    fi

    if alias apcreatedirstructpipenvcommon &>/dev/null; then
        apcreatedirstructpipenvcommon
    fi
}

alias aprmdirstructpipenv="ap_func_rm_dirstruct_pipenv"
ap_func_rm_dirstruct_pipenv() {
    if alias aprmdirstructpipenvshare &>/dev/null; then
        aprmdirstructpipenvshare
    fi

    if alias aprmdirstructpipenvcommon &>/dev/null; then
        aprmdirstructpipenvcommon
    fi
}

alias apsetuppipenv="ap_func_setup_pipenv"
ap_func_setup_pipenv() {
    aplogshow "Install [pipenv]\n"
    pip install pipenv

    apinitpipenv
    if alias apcreatedirstructpipenv &>/dev/null; then
        apcreatedirstructpipenv
    fi
}

alias aprmpipenv="ap_func_rm_pipenv"
ap_func_rm_pipenv() {
    aplogshow "Remove [pipenv]\n"
    pip uninstall pipenv

    if alias aprmdirstructpipenv &>/dev/null; then
        aprmdirstructpipenv
    fi

    if alias aprmglobalsymlinkpipenv &>/dev/null; then
        aprmglobalsymlinkpipenv
    fi
}
