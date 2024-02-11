alias @initartisan="ap_func_init_artisan"
ap_func_init_artisan() {
    if [ -f "${HOME}/scripto/vendors/artisan/ap_completion_artisan.sh" ]; then
        source "${HOME}/scripto/vendors/artisan/ap_completion_artisan.sh"
    fi

    alias zlaravellogs='cd "${PWD}"/storage/logs'
    alias zlaravelstoragepublic='cd "${PWD}/storage/app/public"'
    alias clearlaravellogs='printf "" > "${PWD}/storage/logs/laravel.log"'

    alias artisan="./artisan"
    alias artisantinker='php artisan tinker'
    alias artisanserve='php artisan serve'

    alias artisanclear="\
        php artisan cache:clear; \
        php artisan config:clear; \
        php artisan route:clear; \
    "

    alias artisanupdate="\
        php artisan config:cache; \
        php artisan route:cache; \
    "

    alias artisanupdate="\
        php artisan cache:clear; \
        php artisan config:clear; \
        php artisan config:cache; \
        php artisan route:clear; \
        php artisan route:cache; \
    "

    if alias @initartisanshare &>/dev/null; then
        @initartisanshare
    fi

    if alias @initartisancommon &>/dev/null; then
        @initartisancommon
    fi
}

alias @createdirstructartisan="ap_func_create_dirstruct_artisan"
ap_func_create_dirstruct_artisan() {
    if alias @createdirstructartisanshare &>/dev/null; then
        @createdirstructartisanshare
    fi

    if alias @createdirstructartisancommon &>/dev/null; then
        @createdirstructartisancommon
    fi
}

alias @rmdirstructartisan="ap_func_rm_dirstruct_artisan"
ap_func_rm_dirstruct_artisan() {
    if alias @rmdirstructartisanshare &>/dev/null; then
        @rmdirstructartisanshare
    fi

    if alias @rmdirstructartisancommon &>/dev/null; then
        @rmdirstructartisancommon
    fi
}

alias artisanroute="ap_php_artisan route"
alias artisanroutels="ap_php_artisan route list"
alias artisanrouteclear="ap_php_artisan route clear"
alias artisanroutecache="ap_php_artisan route cache"

alias artisancache="ap_php_artisan cache"
alias artisancacheclear="ap_php_artisan cache clear"

alias artisanconfig="ap_php_artisan config"
alias artisanconfigclear="ap_php_artisan config clear"
alias artisanconfigcache="ap_php_artisan config cache"

alias artisanstorage="ap_php_artisan storage"
alias artisanstoragelink="ap_php_artisan storage link"
ap_php_artisan() {
    if [ -z "${3}" ]; then
        php artisan "${1}:${2}"
    else
        php artisan "${1}:${2}" "${3}"
    fi
}

alias artisandbseed="ap_php_artisan_db_seed"
ap_php_artisan_db_seed() {
    php artisan "db:seed" --class="${3}Seeder"
}
