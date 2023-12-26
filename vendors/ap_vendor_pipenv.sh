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
}
