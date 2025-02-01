alias apinitartisan="ap_func_init_artisan"
ap_func_init_artisan() {
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

    if alias apinitartisanshare &>/dev/null; then
        apinitartisanshare
    fi

    if alias apinitartisancommon &>/dev/null; then
        apinitartisancommon
    fi
}

alias apcreatedirstructartisan="ap_func_create_dirstruct_artisan"
ap_func_create_dirstruct_artisan() {
    if alias apcreatedirstructartisanshare &>/dev/null; then
        apcreatedirstructartisanshare
    fi

    if alias apcreatedirstructartisancommon &>/dev/null; then
        apcreatedirstructartisancommon
    fi
}

alias aprmdirstructartisan="ap_func_rm_dirstruct_artisan"
ap_func_rm_dirstruct_artisan() {
    if alias aprmdirstructartisanshare &>/dev/null; then
        aprmdirstructartisanshare
    fi

    if alias aprmdirstructartisancommon &>/dev/null; then
        aprmdirstructartisancommon
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
