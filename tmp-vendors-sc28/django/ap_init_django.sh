export AP_VENDORS_DJANGO_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/django"
alias zscdgo="cd ${AP_VENDORS_DJANGO_SETUP_DIR}"

# https://docs.djangoproject.com/en/4.2/ref/django-admin/#syntax-coloring
export DJANGO_COLORS="error=white/red,blink;notice=white/magenta;success=white/green;warning=black/yellow"

alias zdgolib='\
	AP_DJANGO_DIR=$(python -c "import django; print(django.__path__);"); \
	export AP_DJANGO_DIR="${AP_DJANGO_DIR:2:-2}"; \
	cd "${AP_DJANGO_DIR}"'

alias viscdgo="vi -p \
	\${AP_VENDORS_DJANGO_SETUP_DIR}/ap_init_django.sh \
	\${AP_VENDORS_DJANGO_SETUP_DIR}/django_bash_completon.sh"

# django-admin
alias dga="django-admin"
alias dgasetenv="export DJANGO_SETTINGS_MODULE=${PWD##*/}.settings"
alias dgastartproject="django-admin startproject"
alias dgadbshell="django-admin dbshell -c"

# manage.py
alias dgo="python manage.py"
alias dgostartapp="python manage.py startapp"
alias dgocreatesuperuser="python manage.py createsuperuser --username"
alias dgocreatesuperuserpnphuong29="python manage.py createsuperuser --username pnphuong29"
alias dgocreatesuperuserpnphuong29="python manage.py createsuperuser --username admin"
alias dgochangepassword="python manage.py changepassword"

alias dgoshell="python manage.py shell"
alias dgorunserver="python manage.py runserver"
alias dgorunserverpdb="python -m pdb manage.py runserver"
alias dgorunserveripdb="python -m ipdb manage.py runserver"

alias dgocheck="python manage.py check"
alias dgomigrate="python manage.py migrate"
alias dgomigratetest="python manage.py migrate --database test"
alias dgomigratefake="python manage.py migrate --fake"
alias dgomigratefakeinitial="python manage.py migrate --fake-initial"
alias dgomakemigrations="python manage.py makemigrations"
alias dgomakemigrationswithoutdata="python manage.py makemigrations --empty"
alias dgosqlmigrate="python manage.py sqlmigrate"
alias dgoshowmigrations="python manage.py showmigrations"
alias dgodumpdata="python manage.py dumpdata"
alias dgoloaddata="python manage.py loaddata"

alias dgofindstatic='python manage.py findstatic'
alias dgofindstaticv2='python manage.py findstatic --verbosity 2'
alias dgocollectstatic="python manage.py collectstatic --no-input"

alias dgotest='python -Wa manage.py test --no-input --failfast --timing --verbosity 2 --pattern="*.py"'
alias dgotestsql='dgotest --debug-sql'
alias dgotestpdb='dgotest --pdb'
alias dgotestkeepdb='dgotest --keepdb'
alias coveragedgotest="coverage run -Wa --source='.' manage.py test --no-input --failfast --pdb --timing --verbosity 2"
alias coveragedgotestkeepdb="coverage run -Wa --source='.' manage.py test --no-input --failfast --pdb --timing --verbosity 2 --keepdb"

# 3rd party apps
alias dgoseed="python manage.py seed"
alias dgotruncate="python manage.py truncate"
alias dgotruncateapps="python manage.py truncate --apps"
alias dgolivereload="python manage.py livereload"

## django-extensions
alias dgoshowurls="python manage.py show_urls"
alias dgovalidatetemplates="python manage.py validate_templates"
alias dgograph="python manage.py graph_models -a -g -o"
alias dgoshell="python manage.py shell_plus"
alias dgoshellbpython="python manage.py shell_plus --bpython"
alias dgoshellptpython="python manage.py shell_plus --ptpython"
alias dgoshellipython="python manage.py shell_plus --ipython"
alias dgorunserverplus="python manage.py runserver_plus --nopin"
alias dgorunserverpluspdb="python -m pdb manage.py runserver_plus --nopin"
alias dgorunserverplusipdb="python -m ipdb manage.py runserver_plus --nopin"
alias dgogenerateadminmodels="python manage.py admin_generator"
alias dgosqldiff="python manage.py sqldiff"
alias dgoresetschema="python manage.py reset_schema"
alias dgoresetschematest="python manage.py reset_schema --database test"
alias dgoresetdb="python manage.py reset_db"
alias dgoresetdbtest="python manage.py reset_db --database test"
alias dgoprintsettings="python manage.py print_settings"
alias dgogeneratepassword="python manage.py generate_password --length=12"
alias dgodumpscript="python manage.py dumpscript"
alias dgorunscript="python manage.py runscript"
alias dgolistmodelinfo="python manage.py list_model_info"
alias dgolistmodelinfomodel="python manage.py list_model_info --model"

# Bash completions
if [[ ! -f "${AP_VENDORS_DJANGO_SETUP_DIR}/django_bash_completon.sh" ]]; then
    curl -SL "https://raw.githubusercontent.com/django/django/main/extras/django_bash_completion" >${AP_VENDORS_DJANGO_SETUP_DIR}/django_bash_completon.sh
fi

# source "${AP_VENDORS_DJANGO_SETUP_DIR}/django_bash_completon.sh"

# @$alias $$ ap_func_dgo {
alias ap_alias_dgo="ap_func_dgo"
alias dgof="ap_func_dgo"
alias dgofdumpdata="ap_func_dgo -d"
alias dgofloaddata="ap_func_dgo -l"
# }

# @$func $$ ap_func_dgo {
# ap_func_dgo [-pld] <prj_code> [--] <params...>
# Description
#	Execute django admin commands
# Options
#	-p <prj_code> Change directory to <prj_code> to execute Django command
# 	-d	dumpdata
# 	-l	loaddata
# Parameters
# 	<params...>	Optional paramters depend on input command
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_dgo() {
    local ap_opts_string="p:b:ld"
    local ap_opt=""
    local ap_opt_p=0
    local ap_opt_b=0
    local ap_opt_d=0
    local ap_opt_l=0
    local ap_prj_code=""
    local ap_dgo_cmd=""
    local ap_db=""
    local ap_db_cmd=""
    local ap_cmd="python manage.py"

    unset OPTIND

    while getopts "${ap_opts_string}" ap_opt; do
        case "${ap_opt}" in
        "p")
            ap_opt_p=1
            ap_prj_code="${OPTARG}"
            ;;
        "b")
            ap_opt_b=1
            ap_db="${OPTARG}"
            ap_db_cmd="--database ${ap_db}"
            ;;
        "d")
            ap_opt_d=1
            ap_dgo_cmd="dumpdata"
            ;;
        "l")
            ap_opt_l=1
            ap_dgo_cmd="loaddata"
            ;;
        ?)
            echo "Invalid option [${OPTARG}]"
            @reterr_opt_invalid_option
            ;;
        esac
    done

    # Remove all options in parameter list
    shift $((OPTIND - 1))

    # Implementation
    local ap_prj_dir=''
    if [ ${ap_opt_p} == 1 ]; then
        ap_prj_dir="AP_PRJ_${ap_prj_code^^}_DIR"
        cd "${!ap_prj_dir}"
    fi

    if [ ${ap_opt_d} == 1 ]; then
        local ap_app_name="$1"
        local ap_model_name="$2"
        local ap_file="${ap_app_name}_${3}.jsonl"

        if [ -z "${ap_app_name}" ]; then
            @merr "Missing app name!\n"
            return 1
        fi

        local ap_dir="${ap_app_name}/fixtures"

        if [ -z "${3}" ]; then
            ap_file="${ap_app_name}.jsonl"
        fi

        if [ -n ${ap_prj_dir} ]; then
            ap_dir="${!ap_prj_dir}/${ap_dir}"
        fi

        if [ ! -d "${ap_dir}" ]; then
            mkdir -p "${ap_dir}"
        fi

        if [ -n "${ap_model_name}" ]; then
            if [ -z "${3}" ]; then
                ap_file="${ap_app_name}_${ap_model_name}.jsonl"
            fi
            ap_cmd="${ap_cmd} ${ap_dgo_cmd} --format jsonl --indent 4 ${ap_app_name}.${ap_app_name^}${ap_model_name^}Model --output ${ap_dir}/${ap_file}"
        else
            ap_cmd="${ap_cmd} ${ap_dgo_cmd} --format jsonl --indent 4 ${ap_app_name} --output ${ap_dir}/${ap_file}"
        fi
    fi

    if [ ${ap_opt_l} == 1 ]; then
        local ap_app_name="$1"

        if [ -z "${ap_app_name}" ]; then
            @merr "Missing app name!\n"
            return 1
        fi

        local ap_dir="${ap_app_name}/fixtures"
        if [ -n ${ap_prj_dir} ]; then
            ap_dir="${!ap_prj_dir}/${ap_dir}"
        fi

        local ap_file="${ap_app_name}_${2}.jsonl"
        if [ -z "${2}" ]; then
            ap_file="${ap_app_name}.jsonl"
        fi

        ap_cmd="${ap_cmd} ${ap_dgo_cmd} ${ap_db_cmd} --app ${ap_app_name} ${ap_dir}/${ap_file}"
    fi

    echo "${ap_cmd}"
    eval "${ap_cmd}"

    @retsuccess
}
