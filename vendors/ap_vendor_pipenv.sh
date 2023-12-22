alias @initpipenv="ap_func_init_pipenv"
ap_func_init_pipenv() {
    export PIPENV_VENV_IN_PROJECT=1
    alias @penvi="pipenv install"
    alias @penvidev="pipenv install --dev"
    alias @penvrequirements="pipenv requirements > requirements.txt"
    alias @penvrequirementsdev="pipenv requirements --dev > requirements_dev.txt"
    alias @penvverify="pipenv verify" # Check if Pipfile.lock is out-of-date?
    alias @penvlock="pipenv lock"     # Generate Pipfile.lock
    alias @penvrun="pipenv run"
    alias @penvpip="pipenv run pip"
}
