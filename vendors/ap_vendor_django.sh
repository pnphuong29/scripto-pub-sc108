alias @initdjango="ap_func_init_django"
ap_func_init_django() {
    if alias @initdjangocommon &>/dev/null; then
        @initdjangocommon
    fi
}

alias @createdirstructdjango="ap_func_create_dirstruct_django"
ap_func_create_dirstruct_django() {
    @logshow "Generate [django] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_django.bash]\n"
    curl -SL "https://raw.githubusercontent.com/django/django/main/extras/django_bash_completion" >"${AP_COMPLETIONS_DIR}/ap_completion_django.bash"

    if alias @createdirstructdjangoshare &>/dev/null; then
        @createdirstructdjangoshare
    fi

    if alias @createdirstructdjangocommon &>/dev/null; then
        @createdirstructdjangocommon
    fi
}

alias @rmdirstructdjango="ap_func_remove_dirstruct_django"
ap_func_remove_dirstruct_django() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_django.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_django.bash"

    if alias @rmdirstructdjangoshare &>/dev/null; then
        @rmdirstructdjangoshare
    fi

    if alias @rmdirstructdjangocommon &>/dev/null; then
        @rmdirstructdjangocommon
    fi
}

alias @setupdjango="ap_func_setup_django"
ap_func_setup_django() {
    @logshow "Install [django]\n"
    pip install django
    if alias @createdirstructdjango &>/dev/null; then
        @createdirstructdjango
    fi
}

alias @rmdjango="ap_func_remove_django"
ap_func_remove_django() {
    @logshow "Remove [django]\n"
    pip uninstall django
    if alias @rmdirstructdjango &>/dev/null; then
        @rmdirstructdjango
    fi
}
