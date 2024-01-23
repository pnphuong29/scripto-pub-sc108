alias @initartisan="ap_func_init_artisan"
ap_func_init_artisan() {
    if [ -f "${HOME}/scripto/vendors/artisan/ap_completion_artisan.sh" ]; then
        source "${HOME}/scripto/vendors/artisan/ap_completion_artisan.sh"
    fi

    alias zlaravellogs='cd "${PWD}"/storage/logs'
    alias clearlaravellogs='printf "" > "${PWD}"/storage/logs/laralve.log'
    alias updatelaravelstoragperm='sudo chmod -R 777 storage'

    alias artisan="./artisan"
    alias artisanupdate="\
        sudo chmod -R 777 storage; \
        php artisan cache:clear; \
        php artisan route:clear; \
        php artisan config:clear; \
        php artisan config:cache; \
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
    php artisan "${1}:${2}"
}
