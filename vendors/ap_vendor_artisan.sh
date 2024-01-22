alias @initartisan="ap_func_init_artisan"
ap_func_init_artisan() {
    alias artisan="php artisan"

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

alias artisancache="ap_php_artisan cache"
alias artisancacheclear="ap_php_artisan cache clear"

alias artisanconfig="ap_php_artisan config"
alias artisanconfigclear="ap_php_artisan config clear"

alias artisanstorage="ap_php_artisan storage"
alias artisanstorageclear="ap_php_artisan storage clear"
ap_php_artisan() {
    php artisan "${1}:${2}"
}
