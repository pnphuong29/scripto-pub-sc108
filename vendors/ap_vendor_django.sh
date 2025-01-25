alias apinitdjango="ap_func_init_django"
ap_func_init_django() {
    # https://docs.djangoproject.com/en/4.2/ref/django-admin/#syntax-coloring
    export DJANGO_COLORS="error=white/red,blink;notice=white/magenta;success=white/green;warning=black/yellow"

    # AP_DJANGO_DIR=$(python -c "import django; print(django.__path__);")
    # export AP_DJANGO_DIR="${AP_DJANGO_DIR:2:-2}"
    # alias zdgolib="cd \${AP_DJANGO_DIR}"

    # django-admin
    alias dga="django-admin"
    alias dgastartproject="django-admin startproject"
    alias dgadbshell="django-admin dbshell -c"

    # manage.py
    alias dgo="python manage.py"
    alias dgostartapp="python manage.py startapp"
    alias dgocreatesuperuser="python manage.py createsuperuser --username"
    alias dgocreatesuperuseradmin="python manage.py createsuperuser --username admin"
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

    if alias apinitdjangoshare &>/dev/null; then
        apinitdjangoshare
    fi

    if alias apinitdjangocommon &>/dev/null; then
        apinitdjangocommon
    fi
}

alias apcreatedirstructdjango="ap_func_create_dirstruct_django"
ap_func_create_dirstruct_django() {
    aplogshow "Generate [django] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_django.bash]\n"
    curl -SL "https://raw.githubusercontent.com/django/django/main/extras/django_bash_completion" >"${AP_COMPLETIONS_DIR}/ap_completion_django.bash"

    if alias apcreatedirstructdjangoshare &>/dev/null; then
        apcreatedirstructdjangoshare
    fi

    if alias apcreatedirstructdjangocommon &>/dev/null; then
        apcreatedirstructdjangocommon
    fi
}

alias aprmdirstructdjango="ap_func_rm_dirstruct_django"
ap_func_rm_dirstruct_django() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_django.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_django.bash"

    if alias aprmdirstructdjangoshare &>/dev/null; then
        aprmdirstructdjangoshare
    fi

    if alias aprmdirstructdjangocommon &>/dev/null; then
        aprmdirstructdjangocommon
    fi
}

alias apsetupdjango="ap_func_setup_django"
ap_func_setup_django() {
    aplogshow "Install [django]\n"
    pip install django

    if alias apcreatedirstructdjango &>/dev/null; then
        apcreatedirstructdjango
    fi
}

alias aprmdjango="ap_func_rm_django"
ap_func_rm_django() {
    aplogshow "Remove [django]\n"
    pip uninstall django

    if alias aprmdirstructdjango &>/dev/null; then
        aprmdirstructdjango
    fi
}
