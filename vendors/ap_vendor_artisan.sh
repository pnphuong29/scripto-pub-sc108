alias @initartisan="ap_func_init_artisan"
ap_func_init_artisan() {
    alias @art="php artisan"
    alias @artserve="@art route"
    alias @artserve="@art serve"
    alias @artserve="@art serve"

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

php_artisan
