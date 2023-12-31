alias @initcomposer="ap_func_init_composer"
ap_func_init_composer() {
    # https://getcomposer.org/doc/03-cli.md
    export COMPOSER_HOME="${HOME}/.composer"
    export COMPOSER_BIN_DIR="${COMPOSER_HOME}/vendor/bin"
    @addpath "${COMPOSER_BIN_DIR}"

    if alias @initcomposershare &>/dev/null; then
        @initcomposershare
    fi

    if alias @initcomposercommon &>/dev/null; then
        @initcomposercommon
    fi
}

alias @createdirstructcomposer="ap_func_create_dirstruct_composer"
ap_func_create_dirstruct_composer() {
    @logshow "Generate [PHP composer] bash autocomplete\n"
    symfony-autocomplete >"${AP_COMPLETIONS_DIR}/ap_completion_composer.bash"

    if alias @createdirstructcomposershare &>/dev/null; then
        @createdirstructcomposershare
    fi

    if alias @createdirstructcomposercommon &>/dev/null; then
        @createdirstructcomposercommon
    fi
}

alias @rmdirstructcomposer="ap_func_remove_dirstruct_composer"
ap_func_remove_dirstruct_composer() {
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_composer.bash"

    if alias @rmdirstructcomposershare &>/dev/null; then
        @rmdirstructcomposershare
    fi

    if alias @rmdirstructcomposercommon &>/dev/null; then
        @rmdirstructcomposercommon
    fi
}

alias @setupcomposer="ap_func_setup_composer"
ap_func_setup_composer() {
    # https://getcomposer.org
    @logshow "Install [PHP composer]\n"

    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then
        echo >&2 'ERROR: Invalid installer checksum'
        rm composer-setup.php
    fi

    rm -f "${AP_SOFT_DIR}/bin/composer"
    php composer-setup.php --quiet --install-dir="${AP_SOFT_DIR}/bin" --filename=composer
    rm composer-setup.php

    export COMPOSER_HOME="${HOME}/.composer"
    export COMPOSER_BIN_DIR="${COMPOSER_HOME}/vendor/bin"
    @addpath "${COMPOSER_BIN_DIR}"

    # Autocomplete
    @logshow "Installing [symfony-console-autocomplete]\n"
    composer global require bamarni/symfony-console-autocomplete

    @initcomposer

    if alias @createdirstructcomposer &>/dev/null; then
        @createdirstructcomposer
    fi
}

alias @rmcomposer="ap_func_remove_composer"
ap_func_remove_composer() {
    @logshow "Remove [PHP composer]\n"
    rm -f "${AP_SOFT_DIR}/bin/composer"
    rm -rf "${HOME}/.composer"

    if alias @rmdirstructcomposer &>/dev/null; then
        @rmdirstructcomposer
    fi

    if alias @rmglobalsymlinkcomposer &>/dev/null; then
        @rmglobalsymlinkcomposer
    fi
}
