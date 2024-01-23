alias @initartisan="ap_func_init_artisan"
ap_func_init_artisan() {
    if [ -f "${HOME}/scripto/vendors/artisan/ap_completion_artisan.sh" ]; then
        source "${HOME}/scripto/vendors/artisan/ap_completion_artisan.sh"
    fi

    alias artisan="php artisan"
    alias zlaravelstoragelogs='cd "${PWD}"/storage/logs'
    alias chmod777storage="sudo chmod -R 777 storage"
    alias artisanupdate="
        php artisan
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
