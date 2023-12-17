# https://docs.python.org/3/using/cmdline.html
export PYTHONPATH="${PYTHONPATH}:${AP_GH_P29_DIR}/ap-lib-common-lib1/python"
export PYTHONSTARTUP="${AP_SCRIPTO_COMMON_DIR}/vendors/python/ap_python_startup_script.py"

export AP_PYTHON_HISTORY_DIR="${AP_SCRIPTO_MAIN_DIR}/data/python/$(hostname)"
[[ ! -d "${AP_PYTHON_HISTORY_DIR}" ]] && mkdir -p "${AP_PYTHON_HISTORY_DIR}"

if [[ -f ~/.python_history ]]; then
	ln -sf ~/.python_history "${AP_PYTHON_HISTORY_DIR}/.python_history"
fi

alias viscpy="vi -p \
	${AP_SCRIPTO_COMMON_DIR}/vendors/python/ap_init_python.sh \
	${AP_SCRIPTO_COMMON_DIR}/vendors/python/ap_python_startup_script.py"

alias pipinstall="pip install --upgrade pip"
alias pipinstallrequirements="pipinstall -r requirements.txt"
alias pipinstallrequirementsdev="pipinstall -r requirements_dev.txt"

alias pipi="pipinstall"
alias pipirequirements="pipinstallrequirements"
alias pipirequirementsdev="pipinstallrequirementsdev"

alias pipinstallcoreserver="pipinstall; \
	pip install \
		pipenv \
		pipx \
		pgcli \
		mycli \
		iredis \
		ipython \
		'xonsh[full]' \
		ipdb \
		asciidoc \
		bpytop \
	"

# black[jupyter] \
alias pipinstallcore="pipinstall; \
	pip install \
		pipenv \
		pipx \
		jupyter \
		gitsome \
		'xonsh[full]' \
		xxh-xxh \
		asciidoc \
		pdbpp \
		ipdb \
		pytest \
		Faker \
		mixer \
		autopep8 \
		black \
		isort \
		pylint \
		pyright \
		pynvim \
		pgcli \
		mycli \
		iredis \
		bpython \
		ptpython \
		ipython \
		httpie \
		invoke \
		fabric \
		python-dotenv[cli] \
		environs \
		bpytop \
		psutil \
		python-decouple \
		psycopg \
		psycopg-c \
		psycopg-binary \
		pipreqs \
		scrapy \
		markdown \
		pygments \
		watchdog \
		watchfiles \
		unidecode \
		johnnydep \
    "

alias pipinstalltest="pipinstall; \
	pip install \
	pytest \
	selenium \
	nox \
	tox \
	coverage \
	mixer \
	Faker \
    "

alias pipinstalldatalibs="pipinstall; \
	pip install \
	pandas \
	pandas[test] \
	pandas[excel] \
	pandas[performance] \
	pandas[plot, output_formatting] \
	pandas[html] \
	pandas[clipboard] \
	pandas[postgresql] \
	matplotlib \
    "

alias pipinstallextras="pipinstall; \
	pip install \
		prompt_toolkit \
		Werkzeug \
		pywatchman \
		pygraphviz \
		requests \
    "

alias pipinstalldgo="pipinstall; \
	pip install \
		django \
		pillow \
		Werkzeug \
        tblib \
        gunicorn \
		django-extensions \
		djangorestframework \
		djangorestframework-recursive \
		graphene-django \
		django-cors-headers \
		django-filter \
		django-imagekit \
		django-admin-tools \
		django-debug-toolbar \
		django-truncate \
		django-request-logging \
		django-log-request-id \
		django-browser-reload \
		django-livereload-server \
		django-seed \
    "

alias pipinstallall="\
	pipinstallcore; \
	pipinstallextras; \
	pipinstalldgo; \
    "
