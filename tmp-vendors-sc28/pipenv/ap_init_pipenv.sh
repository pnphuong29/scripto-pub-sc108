export PIPENV_VENV_IN_PROJECT=1

alias viscpipenv="vi ${AP_SCRIPTO_COMMON_DIR}/vendors/pipenv/ap_init_pipenv.sh"

alias pipenvi="pipenv install"
alias pipenvidev="pipenv install --dev"
alias pipenvinstall="pipenv install"
alias pipenvinstalldev="pipenv install --dev"
alias pipenvrequirements="pipenv requirements > requirements.txt"
alias pipenvrequirementsdev="pipenv requirements --dev > requirements_dev.txt"
alias pipenvrun="pipenv run"
alias pipenvpip="pipenv run pip"
alias pipenvverify="pipenv verify" # Check if Pipfile.lock is out-of-date?
alias pipenvlock="pipenv lock"     # Generate Pipfile.lock

alias pipenvinstallcorelibs="pip install --upgrade pip; \
	pipenv install \
		pynvim \
		psycopg-binary \
		requests"

alias pipenvinstallessentiallibs="pip install --upgrade pip; \
	pipenv install \
		pipreqs \
		johnnydep"

alias pipenvinstalldgolibs="pip install --upgrade pip; \
	pipenv install \
		django \
		django-admin-tools \
		django-debug-toolbar \
		django-truncate \
		django-seed"

alias pipenvinstallall="\
	pipenvinstallcorelibs; \
	pipenvinstallessentiallibs; \
	pipenvinstalldgolibs"
